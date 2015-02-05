package ni.org.mina

import org.grails.databinding.BindUsing
import groovy.transform.ToString

@ToString(includeNames=true, includeFields=true)
class Medicament {
	@BindUsing({
    obj, source -> source["name"]?.toLowerCase()?.tokenize(" ")*.capitalize()?.join(" ")
  })
	String name
	@BindUsing({obj, source ->
    source["genericName"]?.capitalize()
  })
  String genericName

	Date dateCreated
	Date lastUpdated

  static constraints = {
  	name blank:false, unique:true
  	genericName nullable:true
  }
}
