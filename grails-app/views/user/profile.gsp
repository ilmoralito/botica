<g:applyLayout name="twoBlocks">
	<head>
		<title>${user?.fullName}</title>
	</head>

	<content tag="main">
		<h4>Actualizar perfil</h4>
		<g:form autocomplete="off">
			<g:render template="form"/>
		
			<g:submitButton name="submit" value="Confirmar" class="btn btn-primary"/>
		</g:form>
		
		<h4>Actualizar clave</h4>
		<g:form action="updatePassword" autocomplete="off">
			<div class="form-group">
				<label for="password" class="sr-only">password</label>
				<g:passwordField name="password" class="form-control" placeholder="Clave actual"/>
			</div>
			<div class="form-group">
				<label for="newPassword" class="sr-only">newPassword</label>
				<g:passwordField name="newPassword" class="form-control" placeholder="Nueva clave"/>
			</div>
			<div class="form-group">
				<label for="confirmNewPassword" class="sr-only">confirmNewPassword</label>
				<g:passwordField name="confirmNewPassword" class="form-control" placeholder="Confirmar nueva clave"/>
			</div>
		
			<g:submitButton name="submit" value="Confirmar" class="btn btn-primary"/>
		</g:form>
	</content>
</g:applyLayout>