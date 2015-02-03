package ni.org.mina

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class DealerController {
	static defaultAction = "list"
	static allowedMethods = [
		list:"GET",
		save:"POST"
	]

  def list() {
  	[dealers:Dealer.list()]
  }

  def save() {
  	def telephones = params.telephones.findAll { it.value }
  	def data = params.subMap(["name", "email", "address"])
  	data["telephones"] = telephones

  	def dealer = new Dealer(data)

		if (!dealer.save(flush:true)) {
			chain action:"list", model:[dealer:dealer]
			return
		}

  	redirect action:"list"
  }
}
