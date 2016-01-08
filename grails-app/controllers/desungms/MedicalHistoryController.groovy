package desungms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MedicalHistoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MedicalHistory.list(params), model:[medicalHistoryInstanceCount: MedicalHistory.count()]
    }

    def show(MedicalHistory medicalHistoryInstance) {
        respond medicalHistoryInstance
    }

    def create() {
        respond new MedicalHistory(params)
    }

    @Transactional
    def save(MedicalHistory medicalHistoryInstance) {
        if (medicalHistoryInstance == null) {
            notFound()
            return
        }

        if (medicalHistoryInstance.hasErrors()) {
            respond medicalHistoryInstance.errors, view:'create'
            return
        }

        medicalHistoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'medicalHistory.label', default: 'MedicalHistory'), medicalHistoryInstance.id])
                redirect medicalHistoryInstance
            }
            '*' { respond medicalHistoryInstance, [status: CREATED] }
        }
    }

    def edit(MedicalHistory medicalHistoryInstance) {
        respond medicalHistoryInstance
    }

    @Transactional
    def update(MedicalHistory medicalHistoryInstance) {
        if (medicalHistoryInstance == null) {
            notFound()
            return
        }

        if (medicalHistoryInstance.hasErrors()) {
            respond medicalHistoryInstance.errors, view:'edit'
            return
        }

        medicalHistoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MedicalHistory.label', default: 'MedicalHistory'), medicalHistoryInstance.id])
                redirect medicalHistoryInstance
            }
            '*'{ respond medicalHistoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MedicalHistory medicalHistoryInstance) {

        if (medicalHistoryInstance == null) {
            notFound()
            return
        }

        medicalHistoryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MedicalHistory.label', default: 'MedicalHistory'), medicalHistoryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicalHistory.label', default: 'MedicalHistory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
