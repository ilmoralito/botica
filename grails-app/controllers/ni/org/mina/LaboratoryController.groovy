package ni.org.mina

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class LaboratoryController {
	static defaultAction = "list"
	static allowedMethods = [
		list:"GET",
		save:"POST"
	]

  def list() {
  	[labs:Laboratory.list()]
  }
}
