package desungms

class AdverseReports {
	
	String reportType
	Date dateCommitted
	String remarks
	
	static hasOne = [desung: Desung]
	static belongsTo = Desung

    static constraints = {
		reportType blank: false, nullable: false
		remarks maxSize: 1000, blank: true, nullable: true
		dateCommitted nullable:false, blank: false
		desung nullable:true
    }
	
	String toString() {
		return reportType + " on " 
	}

}
