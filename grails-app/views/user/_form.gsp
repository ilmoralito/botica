<div class="form-group">
	<label for="username" class="sr-only">Username</label>
	<g:textField name="username" value="${user?.username}" class="form-control" placeholder="Nombre de usuario"/>
</div>
<div class="form-group">
	<label for="fullName" class="sr-only">FullName</label>
	<g:textField name="fullName" value="${user?.fullName}" class="form-control" placeholder="Nombre completo"/>
</div>
<g:if test="${actionName != 'profile'}">
	<div class="checkbox">
		<label>
			<g:checkBox name="roles" value="ROLE_ADMIN" checked="${user?.authorities?.authority?.contains('ROLE_ADMIN')}"/>
			Administrador
		</label>
	</div>
	<div class="checkbox">
		<label>
			<g:checkBox name="roles" value="ROLE_USER" checked="${user?.authorities?.authority?.contains('ROLE_USER')}"/>
			Usuario
		</label>
	</div>
</g:if>