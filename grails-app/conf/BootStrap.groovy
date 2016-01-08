import java.util.Date;

import desungms.AdverseReportType
import desungms.SocialWorkType
import desungms.Desung

class BootStrap {

    def init = { servletContext ->
		/*def desup1 = new Desung(
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
		def desup2 = new Desung(
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
			 alive:"Alive"
			)
		def desup3 = new Desung(
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
		def desup4 = new Desung(
			desungId: "54366764535",
			name: "Sonam Dorji Dema",
			citizenID: "55556677654",
			 gender: "Female",
			 contactNumber: "12354545678",
			 inCountry: "Yes",
			 dateOfBirth: new Date(),
			 maritialStatus:"Single",
			 bloodGroup: "O+",
			 altContactNumber:"",
			 email:"khssate@moaf.bt",
			 presentAddress:"sjdjsjds",
			 presentDzongkhag:"Thimphu",
			 permenantAddress:"sdkjskjdskj",
			 alive:"Alive"
			)
		desup1.save(failOnError: true)
		desup2.save(failOnError: true)
		desup3.save(failOnError: true)
		desup4.save(failOnError: true) */
		
		def drugs = new AdverseReportType(name: "Drugs")
		def robbery = new AdverseReportType(name: "Robbery")
		def murder = new AdverseReportType(name: "Murder")
		def rape = new AdverseReportType(name: "Rape")
		def violence = new AdverseReportType(name: "Violence")
		
		drugs.save(failOnError: true)
		robbery.save(failOnError: true)
		murder.save(failOnError: true)
		rape.save(failOnError: true)
		violence.save(failOnError: true)
		
		def drill = new SocialWorkType(name: "Drill")
		def awareness = new SocialWorkType(name: "Awareness")
		def crowd = new SocialWorkType(name: "Crowd Control")
		def refresh = new SocialWorkType(name: "Refresher Course")
		
		drill.save(failOnError: true)
		awareness.save(failOnError: true)
		crowd.save(failOnError: true)
		refresh.save(failOnError: true)
    }
    def destroy = {
    }
}
