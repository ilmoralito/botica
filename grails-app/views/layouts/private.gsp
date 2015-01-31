<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><g:layoutTitle default="We love grails too"/></title>
	<asset:stylesheet src="private.css"/>
</head>
<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">${grailsApplication.config.ni.org.mina.application.name}</a>
	    </div>

	    <div class="collapse navbar-collapse">
	      <ul class="nav navbar-nav navbar-right">
	        <!--<li><a href="#">Link</a></li>-->
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
	            <li><g:link controller="user">Perfil</g:link></li>
	            <li><a href="#">Administrar usuarios</a></li>
	            <li class="divider"></li>
	            <li><a href="#">Salir</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque dolores placeat fuga, ratione laborum quibusdam nulla omnis eum temporibus, facere eveniet tempore illo quas, assumenda culpa impedit alias magnam asperiores.
			</div>
			<div class="col-md-10">
				<g:layoutBody/>
			</div>
		</div>
	</div>
	<asset:javascript src="app.js"/>
</body>
</html>