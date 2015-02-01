import ni.org.mina.*

class BootStrap {
  def init = { servletContext ->
  	def adminRole =  new Role(authority:"ROLE_ADMIN").save(failOnError:true)
  	def userRole =  new Role(authority:"ROLE_USER").save(failOnError:true)

  	def john = new User(
      username:"me",
      fullName:"John Doe",
      password:"password"
    ).save(failOnError:true)

    def juan = new User(
      username:"juan",
      fullName:"Juan Perez",
      password:"password",
      enabled:false
    ).save(failOnError:true)

    def fulano = new User(
      username:"fulano",
      fullName:"Fulano de Tal",
      password:"password"
    ).save(failOnError:true)

    UserRole.create john, adminRole, true
    UserRole.create juan, adminRole, true
  	UserRole.create fulano, userRole, true

  	assert User.count() == 3
  	assert Role.count() == 2
  	assert UserRole.count() == 3
  }
  def destroy = {
  }
}
