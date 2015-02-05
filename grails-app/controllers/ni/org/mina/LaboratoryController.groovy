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
  	[laboratories:Laboratory.list()]
  }

  def save() {
  	def laboratory = new Laboratory(params)

  	if (!laboratory.save()) {
  		chain action:"list", model:[laboratory:laboratory]
  		return
  	}

  	redirect action:"list"
  }
}
