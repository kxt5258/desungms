package desungms

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class AdverseReportsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AdverseReports.list(params), model:[adverseReportsInstanceCount: AdverseReports.count()]
    }

    def show(AdverseReports adverseReportsInstance) {
        respond adverseReportsInstance
    }

    def create() {
        respond new AdverseReports(params)
    }

    @Transactional
    def save(AdverseReports adverseReportsInstance) {
        if (adverseReportsInstance == null) {
            notFound()
            return
        }

        if (adverseReportsInstance.hasErrors()) {
            respond adverseReportsInstance.errors, view:'create'
            return
        }

        adverseReportsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'adverseReports.label', default: 'AdverseReports'), adverseReportsInstance.id])
                redirect adverseReportsInstance
            }
            '*' { respond adverseReportsInstance, [status: CREATED] }
        }
    }

    def edit(AdverseReports adverseReportsInstance) {
        respond adverseReportsInstance
    }

    @Transactional
    def update(AdverseReports adverseReportsInstance) {
        if (adverseReportsInstance == null) {
            notFound()
            return
        }

        if (adverseReportsInstance.hasErrors()) {
            respond adverseReportsInstance.errors, view:'edit'
            return
        }

        adverseReportsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AdverseReports.label', default: 'AdverseReports'), adverseReportsInstance.id])
                redirect adverseReportsInstance
            }
            '*'{ respond adverseReportsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AdverseReports adverseReportsInstance) {

        if (adverseReportsInstance == null) {
            notFound()
            return
        }

        adverseReportsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AdverseReports.label', default: 'AdverseReports'), adverseReportsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'adverseReports.label', default: 'AdverseReports'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
