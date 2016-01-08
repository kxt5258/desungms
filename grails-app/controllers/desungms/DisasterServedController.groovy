package desungms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DisasterServedController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DisasterServed.list(params), model:[disasterServedInstanceCount: DisasterServed.count()]
    }

    def show(DisasterServed disasterServedInstance) {
        respond disasterServedInstance
    }

    def create() {
        respond new DisasterServed(params)
    }

    @Transactional
    def save(DisasterServed disasterServedInstance) {
        if (disasterServedInstance == null) {
            notFound()
            return
        }

        if (disasterServedInstance.hasErrors()) {
            respond disasterServedInstance.errors, view:'create'
            return
        }

        disasterServedInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'disasterServed.label', default: 'DisasterServed'), disasterServedInstance.id])
                redirect disasterServedInstance
            }
            '*' { respond disasterServedInstance, [status: CREATED] }
        }
    }

    def edit(DisasterServed disasterServedInstance) {
        respond disasterServedInstance
    }

    @Transactional
    def update(DisasterServed disasterServedInstance) {
        if (disasterServedInstance == null) {
            notFound()
            return
        }

        if (disasterServedInstance.hasErrors()) {
            respond disasterServedInstance.errors, view:'edit'
            return
        }

        disasterServedInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DisasterServed.label', default: 'DisasterServed'), disasterServedInstance.id])
                redirect disasterServedInstance
            }
            '*'{ respond disasterServedInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DisasterServed disasterServedInstance) {

        if (disasterServedInstance == null) {
            notFound()
            return
        }

        disasterServedInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DisasterServed.label', default: 'DisasterServed'), disasterServedInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'disasterServed.label', default: 'DisasterServed'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
