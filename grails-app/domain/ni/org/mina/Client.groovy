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
  SortedSet telephones

  Date dateCreated
  Date lastUpdated

  static constraints = {
  	fullName blank:false
  	address nullable:true
  	idCard nullable:true, unique:true
  	telephones nullable:true
  }

  static hasMany = [telephones:String]
}
