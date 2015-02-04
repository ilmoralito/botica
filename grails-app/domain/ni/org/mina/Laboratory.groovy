package ni.org.mina

import org.grails.databinding.BindUsing

class Laboratory {
	@BindUsing({
    obj, source -> source["name"]?.toUpperCase()
  })
	String name

  static constraints = {
  	name blank:false, unique:true
  }
}
