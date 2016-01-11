package desungms

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class AdminUserAdminRole implements Serializable {

	private static final long serialVersionUID = 1

	AdminUser adminUser
	AdminRole adminRole

	AdminUserAdminRole(AdminUser u, AdminRole r) {
		this()
		adminUser = u
		adminRole = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof AdminUserAdminRole)) {
			return false
		}

		other.adminUser?.id == adminUser?.id && other.adminRole?.id == adminRole?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (adminUser) builder.append(adminUser.id)
		if (adminRole) builder.append(adminRole.id)
		builder.toHashCode()
	}

	static AdminUserAdminRole get(long adminUserId, long adminRoleId) {
		criteriaFor(adminUserId, adminRoleId).get()
	}

	static boolean exists(long adminUserId, long adminRoleId) {
		criteriaFor(adminUserId, adminRoleId).count()
	}

	private static DetachedCriteria criteriaFor(long adminUserId, long adminRoleId) {
		AdminUserAdminRole.where {
			adminUser == AdminUser.load(adminUserId) &&
			adminRole == AdminRole.load(adminRoleId)
		}
	}

	static AdminUserAdminRole create(AdminUser adminUser, AdminRole adminRole, boolean flush = false) {
		def instance = new AdminUserAdminRole(adminUser: adminUser, adminRole: adminRole)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(AdminUser u, AdminRole r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = AdminUserAdminRole.where { adminUser == u && adminRole == r }.deleteAll()

		if (flush) { AdminUserAdminRole.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(AdminUser u, boolean flush = false) {
		if (u == null) return

		AdminUserAdminRole.where { adminUser == u }.deleteAll()

		if (flush) { AdminUserAdminRole.withSession { it.flush() } }
	}

	static void removeAll(AdminRole r, boolean flush = false) {
		if (r == null) return

		AdminUserAdminRole.where { adminRole == r }.deleteAll()

		if (flush) { AdminUserAdminRole.withSession { it.flush() } }
	}

	static constraints = {
		adminRole validator: { AdminRole r, AdminUserAdminRole ur ->
			if (ur.adminUser == null || ur.adminUser.id == null) return
			boolean existing = false
			AdminUserAdminRole.withNewSession {
				existing = AdminUserAdminRole.exists(ur.adminUser.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['adminUser', 'adminRole']
		version false
	}
}
