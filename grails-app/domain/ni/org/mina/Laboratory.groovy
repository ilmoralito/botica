package ni.org.mina

import org.grails.databinding.BindUsing

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

  def beforeUpdate() {
  	name = name.toUpperCase()
  }

  static hasMany = [dealers:Dealer, medicaments:Medicament]
  static belongsTo = Dealer
}
