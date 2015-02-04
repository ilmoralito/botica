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
	  <div class="container">
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
	            <li class="${actionName == 'profile' ? 'active' : ''}">
	            	<g:link controller="user">Perfil</g:link>
	            </li>
	            <li class="${controllerName == 'user' && actionName == 'list' ? 'active' : ''}">
	            	<g:link controller="user" action="list">Administrar usuarios</g:link>
	            </li>
	            <li class="divider"></li>
	            <li><g:link controller="logout">Salir</g:link></li>
	          </ul>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<!--sidebar-->
				<ul class="nav nav-pills nav-stacked">
					<li class="${controllerName == 'dealer' ? 'active' : ''}">
						<g:link controller="dealer">Distribuidores</g:link>
					</li>
				</ul>
			</div>
			<div class="col-md-10">
				<g:layoutBody/>

				
			</div>
		</div>
	</div>
	<asset:javascript src="app.js"/>
</body>
</html>