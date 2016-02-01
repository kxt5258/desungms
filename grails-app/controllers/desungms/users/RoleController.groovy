package desungms.users
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class RoleController extends grails.plugin.springsecurity.ui.RoleController {
}
