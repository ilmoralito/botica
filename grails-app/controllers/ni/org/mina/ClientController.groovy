package ni.org.mina

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ClientController {
	static defaultAction = "list"
	static allowedMethods = [
		list:"GET"
	]

  def list() {
  	[clients:Client.list()]
  }
}
