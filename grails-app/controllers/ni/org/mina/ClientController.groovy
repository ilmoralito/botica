package ni.org.mina

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ClientController {
	static defaultAction = "list"
	static allowedMethods = [
		list:["GET", "POST"],
		save:"POST"
	]

  def list() {
  	def clients = Client.list()
		def profile = params.list("profile")
		def results = []

  	if (request.method == "POST" && profile.size() == 1) {
  		results = clients.findAll { obj ->
  			obj.isClientProfileCompleted(profile[0])
  		}
  	}
  	
  	[clients:results ?: clients]
  }

  def save(CreateClient command) {
  	if (command.hasErrors()) {
  		command.errors.allErrors.each { error ->
  			log.error "[$error.field:$error.defaultMessage]"
  		}
  	}

  	client.save()
  	redirect action:"list"
  }
}

class CreateClient {
	String fullName
	String address
	String idCard
	SortedSet telephones

	static constraints = {
		fullName blank:false
		address blank:false, unique:true
		idCard blank:false, unique:true
		telephones validator: { telephones ->
			if (!telephones?.size()) {
				"notMatch"
			}
		}
	}
}
