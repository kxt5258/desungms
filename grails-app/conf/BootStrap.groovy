import java.util.Date;
import desungms.*;
import desungms.auth.*;

class BootStrap {

    def init = { servletContext ->
		
		AdverseReportType.findOrSaveWhere(name: "Drugs")
		AdverseReportType.findOrSaveWhere(name: "Robbery")
		AdverseReportType.findOrSaveWhere(name: "Murder")
		AdverseReportType.findOrSaveWhere(name: "Rape")
		AdverseReportType.findOrSaveWhere(name: "Violence")		
		
		SocialWorkType.findOrSaveWhere(name: "Drill")
		SocialWorkType.findOrSaveWhere(name: "Awareness")
		SocialWorkType.findOrSaveWhere(name: "Crowd Control")
		SocialWorkType.findOrSaveWhere(name: "Refresher Course")
		
		def adminRole = Role.findOrSaveWhere(authority:'ROLE_ADMIN')
		//def userRole = Role.findOrSaveWhere(authority:'ROLE_USER')
		def user = new User(username: 'admin', enabled: true, password: 'password').save(flush: true)

		try {
			if(!user.authorities.contains(adminRole)) {
				  UserRole.create(user,adminRole,true)
			}  
		}
		catch(Exception exc) {
			println "User already linked!"
		}
	
    }
	
    def destroy = {
    }
}
