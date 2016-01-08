package desungms

import grails.transaction.Transactional
import javax.servlet.http.HttpServletResponse
import pl.touk.excel.export.WebXlsxExporter
import org.grails.plugins.excelimport.*
import org.springframework.mock.web.MockMultipartFile
import org.springframework.web.multipart.MultipartFile
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.commons.io.FileUtils
import org.apache.commons.io.IOUtils

class DesungService {
	
	static transactional = false
	def wkhtmltoxService
	def grailsApplication
	def excelImportService
	def imageUploadService
	
	static Map CONFIG_DESUUNG_COLUMN_MAPS = [
		sheet: 'Desuups',
		startRow: 1,
		columnMap:  [
			'B':'desungId',
			'C':'citizenID',
			'D':'name',
			'E':'gender',
			'F':'qualification',
			'G':'permenantAddress',
			'H':'presentAddress',
			'I':'presentDzongkhag',
			'J':'contactNumber',
			'K':'email',
			'L':'bloodGroup',
			'M':'alive',
			'N':'inCountry',
			'O':'remarks',
			]
		]
	
	static Map CONFIG_PROPERTY_TYPE = [
		citizenID: ([expectedType: ExpectedPropertyType.StringType, defaultValue:""])
		]

    def sortDesunps(params) {
		def alive = params?.alive
		def dzongkhag = params?.dzongkhag
		def bloodGroup = params?.bloodGroup
		
		String query = "from Desung WHERE alive LIKE '${alive}' AND presentDzongkhag LIKE '${dzongkhag}' AND bloodGroup LIKE '${bloodGroup}'"
		
		def desungs = Desung.executeQuery(query)
		return desungs
    }
	
	def downloadExcel(def desungs, HttpServletResponse response) {
			def headers = ['Desunng Id', 'Citizenship ID', 'Name', 'Date of Birth','Gender', 'Qualification', 'Contact Number', 'Email','Maritial Status','Blood Group',
				'Permanent Address','Working Address','Present Dzongkhag','Alive', 'Present Country', 'Remarks']
			def withProperties = ['desungId', 'citizenID', 'name', new DateGetter('dateOfBirth'), 'gender', 'qualification', 'contactNumber', 'email','maritialStatus','bloodGroup',
				'permenantAddress','presentAddress','presentDzongkhag','alive', 'inCountry', 'remarks']
			
			new WebXlsxExporter().with {
				setResponseHeaders(response)
				fillHeader(headers)
				add(desungs, withProperties)
				save(response.outputStream)
			}		
	}
	
	def downloadPdf(def desungs, HttpServletResponse response, DesungController dc) {
		def values = desungs.properties['biImage']['large']
		def imageValue= values.toString().substring(values.toString().indexOf(':') + 1).trim();
		
		dc.render(filename:"${desungs.name}.pdf",
				view:"/desung/downloadPdf",
				model:[desungInstance:desungs, imageId: imageValue, grailsApplication: grailsApplication],
				marginLeft:15,
				marginTop:30,
				marginBottom:20,
				marginRight:15,
				headerSpacing:10,
				);
	}
	
	def uploadExcel(def file, HttpServletResponse response) {
		Workbook workbook = WorkbookFactory.create(file.inputStream) ;
		def desungList = excelImportService.columns(workbook, CONFIG_DESUUNG_COLUMN_MAPS, null, CONFIG_PROPERTY_TYPE, -1)
		
		println "STARTING.........."
		desungList.each { Map desuupParams ->
			def profile = null
			if(desuupParams['citizenID']) {
				profile = this.getMultiPartFile(new URL("https://www.citizenservices.gov.bt/G2CCIDImageService/ImageServlet?type=PH&cidNo=" + desuupParams['citizenID']))
			}

			def desungInstance = new Desung(desuupParams);
			
			if(desungInstance.save(flush: false)) {
				if(profile) {
					desungInstance.profile = profile;
					imageUploadService.save(desungInstance)
				}
				else {
					print "NO IMAGE: " + desuupParams['desungId'] + ": " + desuupParams['name'] 
				}
				
				if(!desungInstance.save(flush: true)) {
					desungInstance.errors.allErrors.each {
						println desuupParams['desungId'] + ": " + desuupParams['name'] + ": "+ it
						}
				}
			}
			else {
				desungInstance.errors.allErrors.each {
					println desuupParams['desungId'] + ": " + desuupParams['name'] + ": "+ it
					}
			} 
					
		} 
		println "DONE.........."
	}
	
	def getMultiPartFile(URL url) {
		File file = new File("test.jpg");
		FileUtils.copyURLToFile(url, file);
		if(file.length() > 0)  {
			FileInputStream input = new FileInputStream(file);
			MultipartFile multipartFile = new MockMultipartFile("file",
				file.getName(), "image/jpeg", IOUtils.toByteArray(input));
			return multipartFile
		}
		else {
			return null
		}
	}
	
}
