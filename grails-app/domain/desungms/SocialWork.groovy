package desungms

class SocialWork {
	
	String socialWork
	Date startDate
	Date endDate
	String details
	String place
	
	static hasOne = [desung: Desung]
	static belongsTo = Desung

    static constraints = {
		socialWork blank: false, nullable: false
		place blank: false, nullable: false
		startDate blank: false, nullable: false
		endDate blank: false, nullable: false
		details blank: true, nullable: true, maxSize: 1500
    }
	
	String toString() {
		return socialWork + " at " + place + " from "
	}
}
