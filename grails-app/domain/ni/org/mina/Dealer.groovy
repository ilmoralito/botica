package ni.org.mina

import org.grails.databinding.BindUsing
import groovy.transform.ToString

@ToString(includeNames=true, includeFields=true)
class Dealer {
	@BindUsing({
    obj, source -> source["name"]?.toLowerCase()?.tokenize(" ")*.capitalize()?.join(" ")
  })
	String name
  String email
  String address
	Map telephones

	Date dateCreated
	Date lastUpdated

  static constraints = {
  	name blank:false, unique:true
    email email:true, unique:true, blank:false
    address blank:false
  }

  static mapping = {
  	version false
  }
}
