package ni.org.mina

class AppTagLib {
  static defaultEncodeAs = [taglib:'html']
  static namespace = "botica"
  //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

  def userStatus = { attrs ->
  	if (attrs.enabled) {
  		out << "Activo"
  	} else {
  		out << "Inactivo"
  	}
  }
}
