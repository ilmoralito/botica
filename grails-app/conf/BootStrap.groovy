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

    //dealers
    def dealer1 = new Dealer(
      name:"la baratera",
      email:"labaratera@hotmail.ni",
      address:"Some address",
      telephones:["claro":"57654389", "movistar":"88767600", "convencional":"23114455"]
    )

    def dealer2 = new Dealer(
      name:"la guadalupama",
      email:"laguadalupana@gmail.com",
      address:"Another address",
      telephones:["convencional":"23114455"]
    )


    //labs
    def lab1 = new Laboratory(name:"lab1").save(failOnError:true)
    def lab2 = new Laboratory(name:"lab2").save(failOnError:true)
    def lab3 = new Laboratory(name:"lab3").save(failOnError:true)

    assert Laboratory.count() == 3

    //labs in dealer
    dealer1
      .addToLaboratories(lab1)
      .addToLaboratories(lab2)
      .save(failOnError:true)

    dealer2
      .addToLaboratories(lab1)
      .addToLaboratories(lab2)
      .addToLaboratories(lab3)
      .save(failOnError:true)
    
    assert Dealer.count() == 2

    //clients
    def client1 = new Client(
      fullName:"Juan Perez",
      address:"Juna Perez address",
      idCard:"201-290180-0001w",
      movistar:new Telephone(number:"56767889"),
      claro:new Telephone(number:"56767889")
    ).save(failOnError:true)

    def client2 = new Client(
      fullName:"Fulano mengano",
      address:"Another address",
      idCard:"201-290179-0001w",
      claro:new Telephone(number:"67676767")
    ).save(failOnError:true)

    def client3 = new Client(
      fullName:"Kukamonga"
    ).save(failOnError:true)

    assert Client.count() == 3
  }
  def destroy = {
  }
}
