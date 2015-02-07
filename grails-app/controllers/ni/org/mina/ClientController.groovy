package ni.org.mina

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ClientController {
	static defaultAction = "list"
	static allowedMethods = [
		list:["GET", "POST"]
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
}
