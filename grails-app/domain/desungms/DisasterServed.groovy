package desungms

class DisasterServed {
	
	String disasterType
	String details
	String place
	Date startDate
	Date endDate
	
	static hasOne = [desung: Desung]
	static belongsTo = Desung

    static constraints = {
		disasterType (inList:["Earth","Water","Fire","Wind"])
		place blank: false, nullable: false
		startDate (validator: {it <= new Date()})
		endDate (validator: {it <= new Date()})
		details blank: true, nullable: true, maxSize: 1200
    }
	
	String toString() {
		return disasterType + ": at " + place + " from " 
	}
	
}
