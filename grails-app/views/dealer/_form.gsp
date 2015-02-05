<h4>Contacto</h4>
<div class="form-group">
	<label for="name" class="sr-only">Name</label>
	<g:textField name="name" value="${dealer?.name}" class="form-control" placeholder="Nombre"/>
</div>
<div class="form-group">
	<label for="email" class="sr-only">Email</label>
	<g:textField name="email" value="${dealer?.email}" class="form-control" placeholder="Email"/>
</div>
<div class="form-group">
	<label for="address" class="sr-only">Address</label>
	<g:textField name="address" value="${dealer?.address}" class="form-control" placeholder="Direccion"/>
</div>

<h4>Telefonos</h4>
<div class="form-group">
	<label for="movistar" class="sr-only">Movistar</label>
	<g:textField name="telephones.movistar" value="${dealer?.telephones?.movistar}" class="form-control" placeholder="Movistar"/>
</div>
<div class="form-group">
	<label for="claro" class="sr-only">Claro</label>
	<g:textField name="telephones.claro" value="${dealer?.telephones?.claro}" class="form-control" placeholder="Claro"/>
</div>
<div class="form-group">
	<label for="convencional" class="sr-only">Convencional</label>
	<g:textField name="telephones.convencional" value="${dealer?.telephones?.convencional}" class="form-control" placeholder="Convencional"/>
</div>

<h4>Laboratorios</h4>
<g:each in="${laboratories}" var="lab">
	<div class="checkbox">
		<label>
			<g:checkBox name="laboratories" value="${lab.id}" checked="${dealer?.laboratories?.name?.contains(lab.name)}"/>
			${lab.name}
		</label>
	</div>
</g:each>