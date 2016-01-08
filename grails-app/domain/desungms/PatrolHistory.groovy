package desungms

class PatrolHistory {
	
	String border, details
	Date startDate, endDate
	
	static hasOne = [desung: Desung]
	static belongsTo = Desung

    static constraints = {
		border (inList:["North", "South"])
		details blank: true, nullable: true, maxSize: 1200
		startDate nullable: false
		endDate nullable: false
    }
	
	String toString() {
		return border
	}
}
