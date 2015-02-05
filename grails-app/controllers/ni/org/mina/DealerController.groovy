package ni.org.mina

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class DealerController {
	static defaultAction = "list"
	static allowedMethods = [
		list:"GET",
		save:"POST",
		show:"GET"
	]

  def list() {
  	[dealers:Dealer.list(), laboratories:Laboratory.list()]
  }

  def save() {
  	def telephones = params.telephones.findAll { it.value }
  	def data = params.subMap(["name", "email", "address"])
  	data["telephones"] = telephones

  	def dealer = new Dealer(data)

    params?.laboratories?.each { laboratory ->
      def lab = Laboratory.get laboratory

      dealer.addToLaboratories lab
    }

		if (!dealer.save(flush:true)) {
			chain action:"list", model:[dealer:dealer]
			return
		}

  	redirect action:"list"
  }

  def show(Integer id) {
  	def dealer = Dealer.get id

  	if (!dealer) {
  		response.sendError 404
  	}

  	[dealer:dealer, laboratories:Laboratory.list()]
  }

  def update(Integer id) {
  	def dealer = Dealer.get id

  	if (!dealer) {
  		response.sendError 404
  	}

  	
  	dealer.name = params?.name
  	dealer.email = params?.email
  	dealer.address = params?.address
  	params?.telephones?.each { operator, phoneNumber ->
  		if (phoneNumber) {
  			dealer.telephones[operator] = phoneNumber
  		} else {
  			dealer.telephones.remove(operator)
  		}
  	}
    dealer.laboratories.clear()
    params?.laboratories?.each { laboratory ->
      def lab = Laboratory.get laboratory

      dealer.addToLaboratories lab
    }

  	if (!dealer.save(flush:true)) {
  		dealer.errors.allErrors.each { e ->
  			log.error "[$e.field:$e.defaultMessage]"
  		}
  	}

  	redirect action:"show", id:id
  }
}
