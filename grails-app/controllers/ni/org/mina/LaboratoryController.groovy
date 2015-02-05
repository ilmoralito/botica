package ni.org.mina

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class LaboratoryController {
	static defaultAction = "list"
	static allowedMethods = [
		list:"GET",
		save:"POST",
		show:"GET",
		update:"POST"
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

  def show(Integer id) {
  	def laboratory = Laboratory.get id

  	if (!laboratory) {
  		response.sendError 404
  	}

  	[laboratory:laboratory]
  }

  def update(Integer id) {
  	def laboratory = Laboratory.get id

  	if (!laboratory) {
  		response.sendError 404
  	}

  	laboratory.name = params?.name
  	laboratory.save(flush:true)

  	redirect action:"show", id:id
  }
}
