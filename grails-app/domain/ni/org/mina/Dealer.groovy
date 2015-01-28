package ni.org.mina

import org.grails.databinding.BindUsing
import groovy.transform.ToString

@ToString(includeNames=true, includeFields=true)
class Dealer {
	@BindUsing({
    obj, source -> source["name"]?.toLowerCase()?.tokenize(" ")*.capitalize()?.join(" ")
  })
	String name
	Map telephones

	Date dateCreated
	Date lastUpdated

  static constraints = {
  	name blank:false, unique:true
  }

  static mapping = {
  	version false
  }
}
