package ni.org.mina

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class UserController {
	def springSecurityService

	static defaultAction = "profile"
	static allowedMethods = [
		profile:["GET", "POST"],
		updatePassword:"POST",
		list:["GET", "POST"],
		save:"POST",
		show:"GET",
		toggleEnabledState:"GET",
		update:"POST"
	]

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

  def updatePassword(UpdatePassword command) {
  	if (command.hasErrors()) {
  		command.errors.allErrors.each { error -> log.error "[$error.field:$error.defaultMessage]" }
  	}

  	def user = springSecurityService.currentUser
  	user.password = command.password
  	user.save()

  	redirect action:"profile"
  }

  def list() {
  	def users = []

  	if (request.method == "POST") {
  		def roles = params.list("roles")
  		def enabledState = params.list("enabledState")*.toBoolean()

      if (roles && !enabledState) {
        def query = UserRole.where {
          role.authority in roles
        }
  			
        users = query.list().user
      } else if (enabledState && !roles) {
  		 	def query = User.where {
          enabled in enabledState
        }

        users = query.list()
      } else if (roles && enabledState) {
        def query = UserRole.where {
          role.authority in roles
        }
        
        def results = query.list().user

        users = results.findAll { u ->
          u.enabled in enabledState
        }
      } else {
        users = User.list()
      }
    } else {
      users = User.list()
    }

  	[users:users]
  }

  def save() {
  	def roles = params.list("roles")

  	if (roles) {
	  	params.password = "123"
	  	def user = new User(params)

	  	if (!user.save()) {
	  		user.errors.allErrors.each { error -> log.error "[$error.field:$error.defaultMessage]" }
	  	}

	  	roles.each { role ->
	  		UserRole.create user, Role.findByAuthority(role), true
	  	}
  	} else {
  		flash.message = "Seleccione rol"
  	}

  	redirect action:"list"
  }

  def show(Integer id) {
  	def user = User.get id

  	if (!user) {
  		response.senError 404
  	}

  	[user:user]
  }

  def update(Integer id) {
  	def user = User.get id

  	if (!user) {
  		response.senError 404
  	}

  	def roles = params.list("roles")

  	if (roles) {
  		user.properties["username", "fullName"] = params

  		if (!user.save()) {
  			redirect action:"show", id:id
  			return
  		}

  		UserRole.removeAll user, true

  		roles.each { role ->
	  		UserRole.create user, Role.findByAuthority(role), true
	  	}
  	} else {
  		flash.message = "Seleccione rol"
  	}

  	redirect action:"show", id:id
  }

  def toggleEnabledState(Integer id) {
  	def user = User.get id

  	if (!user) {
  		response.sendError 404
  	}

  	user.enabled = !user?.enabled
  	user.save(flush:true)

  	redirect action:"show", id:id
  }
}

class UpdatePassword {
	def passwordEncoder
	def springSecurityService

	String password
	String newPassword
	String confirmNewPassword

	static constraints = {
		password blank:false, validator:{val, obj ->
			obj.passwordEncoder.isPasswordValid(obj.springSecurityService.currentUser.password, val, null)
		}
		newPassword blank:false
		confirmNewPassword blank:false, validator:{ val, obj ->
			val == obj.newPassword
		}
	}
}
