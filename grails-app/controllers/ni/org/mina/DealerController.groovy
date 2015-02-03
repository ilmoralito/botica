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
  	Map telephones = params.subMap(["movistar", "claro", "convencional"]).findAll { it.value }
  	Map data = params.subMap(["name", "email", "address"])

		def dealer = new Dealer(name:params?.name, email:params?.email, address:params?.address, telephones:telephones)

		if (!dealer.save()) {
			dealer.errors.allErrors.each { error -> log.error "[$error.field:$error.defaultMessage]" }
			chain action:"list", model:[dealer:dealer]
			return
		}

  	redirect action:"list"
  }
}
