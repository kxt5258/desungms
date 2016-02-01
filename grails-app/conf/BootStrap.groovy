import java.util.Date;
import desungms.*;
import desungms.auth.*;

class BootStrap {

    def init = { servletContext ->
		/*Desung.findOrSaveWhere(
			 desungId: "1234",
			 name: "Kinley Tsherng",
			 citizenID: "11300234325",
			 gender: "Male",
			 contactNumber: "1235678", 
			 inCountry: "Yes",
			 qualification: "MSc",
			 bloodGroup: "A+",
			 email:"jahjas@maod.com",
			 presentAddress:"sjdjsjds",
			 presentDzongkhag:"Thimphu",
			 permenantAddress:"sdkjskjdskj",
			 alive:"Alive"
			)
		Desung.findOrSaveWhere(
			desungId: "5434535",
			name: "Sonam Pelden",
			citizenID: "4543222245",
			 gender: "Female",
			 contactNumber: "12354545678",
			 inCountry: "Yes",
			 dateOfBirth: new Date(),
			 bloodGroup: "O+",
			 email:"khste@moaf.bt",
			 presentAddress:"sjdjsjds",
			 presentDzongkhag:"Trongsa",
			 permenantAddress:"sdkjskjdskj",
			 alive:"Alive",
			 remarks:"She dropped halfway because of family issues"
			)
		Desung.findOrSaveWhere(
			desungId: "543443535",
			name: "RINCHEN Pelzang",
			citizenID: "45676545678",
			 gender: "Male",
			 contactNumber: "12354545678",
			 inCountry: "Yes",
			 qualification: "MBA",
			 dateOfBirth: new Date(),
			 maritialStatus:"Single",
			 bloodGroup: "O+",
			 email:"dfdf@modfdaf.bt",
			 presentAddress:"sjdjsjds",
			 presentDzongkhag:"Gasa",
			 permenantAddress:"sdkjskjdskj",
			 alive:"Dead"
			)
		Desung.findOrSaveWhere(
			desungId: "54366764535",
			name: "Sonam Dorji Dema",
			citizenID: "55556677654",
			 gender: "Female",
			 contactNumber: "12354545678",
			 inCountry: "Yes",
			 dateOfBirth: new Date(),
			 maritialStatus:"Single",
			 bloodGroup: "O+",
			 email:"khssate@moaf.bt",
			 presentAddress:"sjdjsjds",
			 presentDzongkhag:"Thimphu",
			 permenantAddress:"sdkjskjdskj",
			 alive:"Alive"
			)*/
		/*desup1.save(failOnError: true)
		desup2.save(failOnError: true)
		desup3.save(failOnError: true)
		desup4.save(failOnError: true) */
		
		AdverseReportType.findOrSaveWhere(name: "Drugs")
		AdverseReportType.findOrSaveWhere(name: "Robbery")
		AdverseReportType.findOrSaveWhere(name: "Murder")
		AdverseReportType.findOrSaveWhere(name: "Rape")
		AdverseReportType.findOrSaveWhere(name: "Violence")
		
		/*drugs.save(failOnError: true)
		robbery.save(failOnError: true)
		murder.save(failOnError: true)
		rape.save(failOnError: true)
		violence.save(failOnError: true) */
		
		SocialWorkType.findOrSaveWhere(name: "Drill")
		SocialWorkType.findOrSaveWhere(name: "Awareness")
		SocialWorkType.findOrSaveWhere(name: "Crowd Control")
		SocialWorkType.findOrSaveWhere(name: "Refresher Course")
		
		/*drill.save(failOnError: true)
		awareness.save(failOnError: true)
		crowd.save(failOnError: true)
		refresh.save(failOnError: true) */
		
		/*def adminRole = new DesuungRole(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new DesuungRole(authority: 'ROLE_USER').save(flush: true)
		def testUser = new DesuungUser(username: 'admin', enabled: true, password: 'admin')
		testUser.save(flush: true)
	
		DesuungUserDesuungRole.create testUser, adminRole, true  */
		def adminRole = Role.findOrSaveWhere(authority:'ROLE_ADMIN')
		def userRole = Role.findOrSaveWhere(authority:'ROLE_USER')
		def user = User.findOrSaveWhere(username:'admin',password:'password')

		if(!user.authorities.contains(adminRole)) {
			  UserRole.create(user,adminRole,true)
		}  
	
    }
	
    def destroy = {
    }
}
