package desungms


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional


@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class DesungController {
	
	def desungService
	def imageUploadService
	def wkhtmltoxService
    //static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Desung.list(params), model:[desungInstanceCount: Desung.count()]
    }

	@Secured(['permitAll']) 
    def show(Desung desungInstance) {
        respond desungInstance
    }

    def create() {
        respond new Desung(params)
    }

    @Transactional
    def save(Desung desungInstance) {
        if (desungInstance == null) {
            notFound()
            return
        }

        if (desungInstance.hasErrors()) {
            respond desungInstance.errors, view:'create'
            return
        }

		if(desungInstance.save(flush: false)) {
			if(!(desungInstance.profile?.empty)) {
				imageUploadService.save(desungInstance)
			}
			desungInstance.save(flush: true)
		}

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'desung.label', default: 'Desung'), desungInstance.id])
                redirect desungInstance
            }
            '*' { respond desungInstance, [status: CREATED] }
        }
    }

    def edit(Desung desungInstance) {
        respond desungInstance
    }

    @Transactional
    def update(Desung desungInstance) {
        if (desungInstance == null) {
            notFound()
            return
        }

        if (desungInstance.hasErrors()) {
            respond desungInstance.errors, view:'edit'
            return
        }

        if(desungInstance.save(flush: false)) {
			if(!(desungInstance.profile?.empty)) {
				imageUploadService.save(desungInstance)
			}
			desungInstance.save(flush: true)
		}

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Desung.label', default: 'Desung'), desungInstance.id])
                redirect desungInstance
            }
            '*'{ respond desungInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Desung desungInstance) {

        if (desungInstance == null) {
            notFound()
            return
        }
		
		imageUploadService.delete(desungInstance, true)
        desungInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Desung.label', default: 'Desung'), desungInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'desung.label', default: 'Desung'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	@Secured(['permitAll'])
	def searchResult() {
		def desungs = Desung.findByDesungId(params.desungId);
		if(desungs) {
			respond desungs, view:'show'
		}
		else {
			flash.message = "The Desuup ID may not be correct. Try again!"
			render view:'search'
		}
	}
	
	@Secured(['permitAll'])
	def search() {}
	
	def sortDesuups = {
		def desungs = desungService.sortDesunps(params);
		respond desungs, view:'index', model:params
	}
	
	def downloadExcel = {
		def desungs = desungService.sortDesunps(params);
		desungService.downloadExcel(desungs, response);
		respond desungs, view:'index', model:params
	}
	
	@Secured(['permitAll'])
	def downloadPdf() {
		def desungs = Desung.findByDesungId(params.id);
		desungService.downloadPdf(desungs, response, this);
	}
	
	def uploadExcel = {
		//TODO The excel uploads
		if(params.file) {
			desungService.uploadExcel(params.file, response);
		}
	}
}
