package desungms

import pl.burningice.plugins.image.ast.DBImageContainer

@DBImageContainer(field = 'profile')
class Desung {
	 String desungId, name, citizenID, gender, contactNumber, qualification, inCountry, maritialStatus, bloodGroup,
	 email, presentAddress, presentDzongkhag, permenantAddress, alive, remarks;
	 Date dateOfBirth;
	 
	 static hasMany = [medicalHistory: MedicalHistory, adverseReports: AdverseReports, servedDuringDisaster: DisasterServed, 
		 socialWork: SocialWork, patrolHistory: PatrolHistory]
	 	 
    static constraints = {
		desungId blank:false, unique: true
		name blank: false, nullable: false
		citizenID blank:true, nullable: true, unique: true, maxSize: 15
		gender (inList: ['Male','Female'])
		maritialStatus (blank: true, nullable: true, inList: [' ','Single','Married'])
		contactNumber blank: true, nullable: true, size: 6..25
		bloodGroup (blank: true, nullable: true, inList: ['O+','O-','A+','A-','B+','B-','AB+','AB-',' '])
		qualification blank: true, nullable: true
		inCountry blank: true, nullable: true
		dateOfBirth blank: true, nullable: true
		email email:true, blank: true, nullable: true
		permenantAddress blank: true, nullable: true, widget: 'textarea'
		presentAddress blank: true, nullable: true,  widget: 'textarea'
		presentDzongkhag (blank: true, nullable: true, inList:["Thimphu","Bumthang", "Chukha", "Dagana","Gasa","Haa","Lhuentse","Mongar",
			"Paro","Pemagatshel", "Punakha", "Samdrup Jongkhar","Samtse","Sarpang","Tashigang","Trashi Yangtse",
			"Trongsa","Tsirang","Wangdue Phodrang", "Zhemgang", ""])
		alive (inList: ['Alive','Dead'])
		remarks blank: true, nullable: true
    }
	
	String toString() {
		 	return name
	}
	
}
