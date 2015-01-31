package ni.org.mina

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class UserController {
	def springSecurityService
	static defaultAction = "profile"
	static allowedMethods = {
		profile:["GET", "POST"]
	}

  def profile() {
  	def user = springSecurityService.currentUser

  	if (request.method == "POST") {
  		user.properties["username", "fullName"] = params

  		if (!user.save(flush:true)) {
  			user.errors.allErrors.each { error -> log.error "[$error.field:$error.defaultMessage]" }
  		} else {
  			flash.message = "Peril actualizado"
  		}
  	}

  	[user:user]
  }
}
