package desungms

import jxl.*

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TestImportController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TestImport.list(params), model:[testImportInstanceCount: TestImport.count()]
    }

    def show(TestImport testImportInstance) {
        respond testImportInstance
    }

    def create() {
        respond new TestImport(params)
    }

    @Transactional
    def save(TestImport testImportInstance) {
        if (testImportInstance == null) {
            notFound()
            return
        }

        if (testImportInstance.hasErrors()) {
            respond testImportInstance.errors, view:'create'
            return
        }

        testImportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'testImport.label', default: 'TestImport'), testImportInstance.id])
                redirect testImportInstance
            }
            '*' { respond testImportInstance, [status: CREATED] }
        }
    }

    def edit(TestImport testImportInstance) {
        respond testImportInstance
    }

    @Transactional
    def update(TestImport testImportInstance) {
        if (testImportInstance == null) {
            notFound()
            return
        }

        if (testImportInstance.hasErrors()) {
            respond testImportInstance.errors, view:'edit'
            return
        }

        testImportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TestImport.label', default: 'TestImport'), testImportInstance.id])
                redirect testImportInstance
            }
            '*'{ respond testImportInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TestImport testImportInstance) {

        if (testImportInstance == null) {
            notFound()
            return
        }

        testImportInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TestImport.label', default: 'TestImport'), testImportInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'testImport.label', default: 'TestImport'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	//IMPORT
	private final static int NAME = 0
	private final static int DOB = 1
	
	/*def doUpload() {
		def file = request.getFile('file');
		Workbook workbook = Workbook.getWorkbook(file.getInputStream());
		Sheet sheet = workbook.getSheet(0);
		
		// skip first row (row 0) by starting from 1
		for (int row = 1; row < sheet.getRows(); row++) {
			LabelCell name = sheet.getCell(NAME, row)
			DateCell dob = sheet.getCell(DOB, row)

			new TestImport(name:name.string , dob:dob.date).save()

		}
		
		redirect (action: 'index')
	} */
	
}
