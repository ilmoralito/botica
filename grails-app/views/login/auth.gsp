<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>
<body>
	<h3>${grailsApplication.config.ni.org.mina.application.name}</h3>
	<h4>${grailsApplication.config.ni.org.mina.application.label}</h4>

	<form action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
		<div class="form-group">
			<label for="username" class="sr-only"><g:message code="springSecurity.login.username.label"/></label>
			<g:textField name="j_username" id="username" class="form-control" placeholder="Username"/>
		</div>

		<div class="form-group">
			<label for="password" class="sr-only"><g:message code="springSecurity.login.password.label"/></label>
			<g:textField name="j_password" id="password" class="form-control" placeholder="Password"/>
		</div>

		<div class="checkbox">
			<label>
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<g:message code="springSecurity.login.remember.me.label"/>
			</label>
		</div>

		<g:submitButton name="submit" value="${message(code: "springSecurity.login.button")}" class="btn btn-primary"/>
	</form>

	<g:if test='${flash.message}'>
		<p><br>${flash.message}</p>
	</g:if>
</body>
</html>
