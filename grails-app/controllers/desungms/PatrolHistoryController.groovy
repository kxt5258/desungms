package desungms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PatrolHistoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PatrolHistory.list(params), model:[patrolHistoryInstanceCount: PatrolHistory.count()]
    }

    def show(PatrolHistory patrolHistoryInstance) {
        respond patrolHistoryInstance
    }

    def create() {
        respond new PatrolHistory(params)
    }

    @Transactional
    def save(PatrolHistory patrolHistoryInstance) {
        if (patrolHistoryInstance == null) {
            notFound()
            return
        }

        if (patrolHistoryInstance.hasErrors()) {
            respond patrolHistoryInstance.errors, view:'create'
            return
        }

        patrolHistoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'patrolHistory.label', default: 'PatrolHistory'), patrolHistoryInstance.id])
                redirect patrolHistoryInstance
            }
            '*' { respond patrolHistoryInstance, [status: CREATED] }
        }
    }

    def edit(PatrolHistory patrolHistoryInstance) {
        respond patrolHistoryInstance
    }

    @Transactional
    def update(PatrolHistory patrolHistoryInstance) {
        if (patrolHistoryInstance == null) {
            notFound()
            return
        }

        if (patrolHistoryInstance.hasErrors()) {
            respond patrolHistoryInstance.errors, view:'edit'
            return
        }

        patrolHistoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PatrolHistory.label', default: 'PatrolHistory'), patrolHistoryInstance.id])
                redirect patrolHistoryInstance
            }
            '*'{ respond patrolHistoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PatrolHistory patrolHistoryInstance) {

        if (patrolHistoryInstance == null) {
            notFound()
            return
        }

        patrolHistoryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PatrolHistory.label', default: 'PatrolHistory'), patrolHistoryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'patrolHistory.label', default: 'PatrolHistory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
