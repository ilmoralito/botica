package ni.org.mina

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class DealerController {
	static defaultAction = "list"
	static allowedMethods = [
		list:"GET"
	]

  def list() {

  }
}
