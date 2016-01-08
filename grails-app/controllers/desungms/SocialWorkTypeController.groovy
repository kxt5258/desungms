package desungms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SocialWorkTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SocialWorkType.list(params), model:[socialWorkTypeInstanceCount: SocialWorkType.count()]
    }

    def show(SocialWorkType socialWorkTypeInstance) {
        respond socialWorkTypeInstance
    }

    def create() {
        respond new SocialWorkType(params)
    }

    @Transactional
    def save(SocialWorkType socialWorkTypeInstance) {
        if (socialWorkTypeInstance == null) {
            notFound()
            return
        }

        if (socialWorkTypeInstance.hasErrors()) {
            respond socialWorkTypeInstance.errors, view:'create'
            return
        }

        socialWorkTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'socialWorkType.label', default: 'SocialWorkType'), socialWorkTypeInstance.id])
                redirect socialWorkTypeInstance
            }
            '*' { respond socialWorkTypeInstance, [status: CREATED] }
        }
    }

    def edit(SocialWorkType socialWorkTypeInstance) {
        respond socialWorkTypeInstance
    }

    @Transactional
    def update(SocialWorkType socialWorkTypeInstance) {
        if (socialWorkTypeInstance == null) {
            notFound()
            return
        }

        if (socialWorkTypeInstance.hasErrors()) {
            respond socialWorkTypeInstance.errors, view:'edit'
            return
        }

        socialWorkTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SocialWorkType.label', default: 'SocialWorkType'), socialWorkTypeInstance.id])
                redirect socialWorkTypeInstance
            }
            '*'{ respond socialWorkTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SocialWorkType socialWorkTypeInstance) {

        if (socialWorkTypeInstance == null) {
            notFound()
            return
        }

        socialWorkTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SocialWorkType.label', default: 'SocialWorkType'), socialWorkTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'socialWorkType.label', default: 'SocialWorkType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
