package desungms

class MedicalHistory {
	
	String name
	String details
	
	static hasOne = [desung: Desung]
	static belongsTo = Desung
	
    static constraints = {
		name nullable:false, blank: false
		details blank: true, nullable: true, maxSize: 1500
    }
	
	String toString() {
		return name
	}
}
