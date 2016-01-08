package desungms

import pl.touk.excel.export.getters.PropertyGetter

public class DateGetter extends PropertyGetter<Date,Date> {
	DateGetter(String propertyName) {
        super(propertyName)
    }
	
	@Override
	protected String format(Date date) {
		if(date) {
			return date.format("dd-MMM-yyyy")
		}
		else {
			return ""
		}
	}
}
