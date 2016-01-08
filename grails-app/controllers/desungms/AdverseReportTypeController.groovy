package desungms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AdverseReportTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AdverseReportType.list(params), model:[adverseReportTypeInstanceCount: AdverseReportType.count()]
    }

    def show(AdverseReportType adverseReportTypeInstance) {
        respond adverseReportTypeInstance
    }

    def create() {
        respond new AdverseReportType(params)
    }

    @Transactional
    def save(AdverseReportType adverseReportTypeInstance) {
        if (adverseReportTypeInstance == null) {
            notFound()
            return
        }

        if (adverseReportTypeInstance.hasErrors()) {
            respond adverseReportTypeInstance.errors, view:'create'
            return
        }

        adverseReportTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'adverseReportType.label', default: 'AdverseReportType'), adverseReportTypeInstance.id])
                redirect adverseReportTypeInstance
            }
            '*' { respond adverseReportTypeInstance, [status: CREATED] }
        }
    }

    def edit(AdverseReportType adverseReportTypeInstance) {
        respond adverseReportTypeInstance
    }

    @Transactional
    def update(AdverseReportType adverseReportTypeInstance) {
        if (adverseReportTypeInstance == null) {
            notFound()
            return
        }

        if (adverseReportTypeInstance.hasErrors()) {
            respond adverseReportTypeInstance.errors, view:'edit'
            return
        }

        adverseReportTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AdverseReportType.label', default: 'AdverseReportType'), adverseReportTypeInstance.id])
                redirect adverseReportTypeInstance
            }
            '*'{ respond adverseReportTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AdverseReportType adverseReportTypeInstance) {

        if (adverseReportTypeInstance == null) {
            notFound()
            return
        }

        adverseReportTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AdverseReportType.label', default: 'AdverseReportType'), adverseReportTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'adverseReportType.label', default: 'AdverseReportType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
