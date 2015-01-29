import ni.org.mina.*

class BootStrap {
  def init = { servletContext ->
  	def adminRole =  new Role(authority:"ROLE_ADMIN").save(failOnError:true)
  	def userRole =  new Role(authority:"ROLE_USER").save(failOnError:true)

  	def testUser = new User(
      username:"me",
      fullName:"John Doe",
      password:"password"
    ).save(failOnError:true)

  	UserRole.create testUser, adminRole, true

  	assert User.count() == 1
  	assert Role.count() == 2
  	assert UserRole.count() == 1
  }
  def destroy = {
  }
}
