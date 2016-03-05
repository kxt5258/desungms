/**
 * The service module 
 * @author kinley tshering
 * @Date 2015
 */
package desungms

import org.springframework.transaction.annotation.Transactional
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
	
	/**
	 * Define the html to pdf converter service
	 */
	def wkhtmltoxService
	def grailsApplication
	
	/**
	 * Define the excel import service, for uploading of excel sheets
	 */
	def excelImportService
	
	/**
	 * Define the image upload service, attach profile picture to each domains
	 */
	def imageUploadService
	
	/*
	 * Map to link excel column to the domain values (fields)
	 */
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
	
	/**
	 * enforce property type for CID, or else it gets converted to scientific notation
	 */
	static Map CONFIG_PROPERTY_TYPE = [
		citizenID: ([expectedType: ExpectedPropertyType.StringType, defaultValue:""])
		]
	
	/**
	 * Sorting the desuups based on the params passed
	 * @param params parameters used for sorting
	 * @return desungs map of desuung object
	 */
    def sortDesunps(params) {
		def alive = params?.alive
		def dzongkhag = params?.dzongkhag
		def bloodGroup = params?.bloodGroup
		
		String query = "from Desung WHERE alive LIKE '${alive}' AND presentDzongkhag LIKE '${dzongkhag}' AND bloodGroup LIKE '${bloodGroup}'"
		
		def desungs = Desung.executeQuery(query)
		return desungs
    }
	/**
	 * Download the sorted desuups as excel file
	 * @param desungs map of desuungs
	 * @param response the HttpServletResponse object
	 * @return none
	 */
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
	
	/**
	 * Download the desuup profile as pdf file
	 * @param desungs the Desuung object
	 * @param response HttpServletResponse
	 * @param dc DesungController
	 * @return
	 */
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
	
	/**
	 * Upload the list of desuungs from an excel sheet
	 * @param file the excel file
	 * @param response HttpServletResponse
	 * @return
	 */
	@Transactional
	def uploadExcel(def file, HttpServletResponse response) {
		Workbook workbook = WorkbookFactory.create(file.inputStream) ;
		def desungList = excelImportService.columns(workbook, CONFIG_DESUUNG_COLUMN_MAPS, null, CONFIG_PROPERTY_TYPE, -1)
		
		println "STARTING.........."
		def errorMessages = []
		desungList.each { Map desuupParams ->
			def profile = null
			if(desuupParams['citizenID']) {
				profile = this.getMultiPartFile(new URL("https://www.citizenservices.gov.bt/G2CCIDImageService/ImageServlet?type=PH&cidNo=" + desuupParams['citizenID']))
				if(!profile) {
					profile = this.getMultiPartFile(new URL("http://berms.election-bhutan.org.bt/eagency/MemberPhoto.ashx?_CID=" + desuupParams['citizenID']))
				}
			} 
			
			desuupParams['email'] = checkEmail(desuupParams['email'])

			def desungInstance = new Desung(desuupParams);
			
			if(desungInstance.save(flush: false)) {
				if(profile) {
					desungInstance.profile = profile;
					imageUploadService.save(desungInstance)
				}
				else {
					errorMessages << "NO IMAGE: " + desuupParams['desungId'] + ": " + desuupParams['name'] 
				}
				
				if(!desungInstance.save(flush: true)) {
					desungInstance.errors.allErrors.each {
						errorMessages << desuupParams['desungId'] + ": " + desuupParams['name'] + ": Check the values again"
						println it
						}
				}
			}
			else {
				desungInstance.errors.allErrors.each {
					errorMessages << desuupParams['desungId'] + ": " + desuupParams['name'] + ": Check the values again"
					println it
					}
			} 
					
		} 
		println "DONE.........."
		return errorMessages
	}
	
	/**
	 * Download the profile picture from the provided URL
	 * @param url url of image
	 * @return image the image of desuup
	 */
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
	
	
	/**
	 * Check the inout email and validate it before uploading
	 * @param email
	 * @return valid email or ""
	 */
	def checkEmail(def email) {
		def emailPattern = /[_A-Za-z0-9-]+(.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})/
		if (email ==~ emailPattern){
		  return email
		} 
		else {
		    return ""
		}
	}
	
}
