package ni.org.mina

import org.grails.databinding.BindUsing
import groovy.transform.ToString

@ToString(includeNames=true, includeFields=true)
class Client {
	@BindUsing ({ obj, source ->
    source["fullName"]?.toLowerCase()?.tokenize(" ")*.capitalize().join(" ")
  })
  String fullName
  String address
  @BindUsing ({ obj, source ->
    	source["idCard"]?.toUpperCase()
    })
  String idCard
  Telephone movistar
  Telephone claro
  Telephone convencional

  Date dateCreated
  Date lastUpdated

  static embedded = ["movistar", "claro", "convencional"]

  static constraints = {
  	fullName blank:false
  	address nullable:true, unique:true
  	idCard nullable:true, unique:true
    movistar nullable:true
    claro nullable:true
    convencional nullable:true
  }

  static mapping = {
    sort dateCreated: "desc"
  }

  Boolean isClientProfileCompleted(status) {
		if (status.toBoolean()) {
			this.properties.idCard && this.properties.address && (this.properties.movistar || this.properties.claro || this.properties.convencional)
		} else {
			!this.properties.idCard
		}
  }
}

class Telephone {
  String number

  static constraints = {
    number unique:true, validator: { number ->
      number?.size() == 8
    }
  }
}
