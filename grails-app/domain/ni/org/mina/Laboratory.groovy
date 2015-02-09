package ni.org.mina

import org.grails.databinding.BindUsing
import groovy.transform.ToString

@ToString(includeNames=true, includeFields=true)
class Laboratory {
	@BindUsing({
    obj, source -> source["name"]?.toUpperCase()
  })
	String name

  Date dateCreated
  Date lastUpdated

  static constraints = {
  	name blank:false, unique:true
  }

  static mapping = {
    sort dateCreated: "desc"
  }

  def beforeUpdate() {
  	name = name.toUpperCase()
  }

  static hasMany = [dealers:Dealer, medicaments:Medicament]
  static belongsTo = Dealer
}
