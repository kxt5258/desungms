package desungms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class SocialWorkController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SocialWork.list(params), model:[socialWorkInstanceCount: SocialWork.count()]
    }

    def show(SocialWork socialWorkInstance) {
        respond socialWorkInstance
    }

    def create() {
        respond new SocialWork(params)
    }

    @Transactional
    def save(SocialWork socialWorkInstance) {
        if (socialWorkInstance == null) {
            notFound()
            return
        }

        if (socialWorkInstance.hasErrors()) {
            respond socialWorkInstance.errors, view:'create'
            return
        }

        socialWorkInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'socialWork.label', default: 'SocialWork'), socialWorkInstance.id])
                redirect socialWorkInstance
            }
            '*' { respond socialWorkInstance, [status: CREATED] }
        }
    }

    def edit(SocialWork socialWorkInstance) {
        respond socialWorkInstance
    }

    @Transactional
    def update(SocialWork socialWorkInstance) {
        if (socialWorkInstance == null) {
            notFound()
            return
        }

        if (socialWorkInstance.hasErrors()) {
            respond socialWorkInstance.errors, view:'edit'
            return
        }

        socialWorkInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SocialWork.label', default: 'SocialWork'), socialWorkInstance.id])
                redirect socialWorkInstance
            }
            '*'{ respond socialWorkInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SocialWork socialWorkInstance) {

        if (socialWorkInstance == null) {
            notFound()
            return
        }

        socialWorkInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SocialWork.label', default: 'SocialWork'), socialWorkInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'socialWork.label', default: 'SocialWork'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
