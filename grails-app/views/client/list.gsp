<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name='layout' content='private'/>
	<title>Clientes</title>
</head>
<body>
	<div class="row">
		<div class="col-md-10">
			<g:if test="${clients}">
				<table class="table table-hover">
					<thead>
						<th>Nombre completo</th>
					</thead>
					<tbody>
						<g:each in="${clients}" var="client">
							<tr>
								<td><g:link action="show" id="${client.id}">${client.fullName}</g:link></td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</g:if>
			<g:else>
				<h4>Nada que mostrar</h4>
			</g:else>
		</div>
		<div class="col-md-2">
			<g:form action="save" autocomplete="off">
				<div class="form-group">
					<label for="fullName" class="sr-only">fullName</label>
					<g:textField name="fullName" value="${client?.fullName}" class="form-control" placeholder="Nombre completo" autofocus="true"/>
				</div>

				<div class="form-group">
					<label for="address" class="sr-only">address</label>
					<g:textField name="address" value="${client?.address}" class="form-control" placeholder="Direccion"/>
				</div>

				<div class="form-group">
					<label for="idCard" class="sr-only">idCard</label>
					<g:textField name="idCard" value="${client?.idCard}" class="form-control" placeholder="Cedula"/>
				</div>

				<div class="form-group">
					<label for="telephone" class="sr-only">telephone</label>
					<g:textField name="telephones" value="${client?.movistar}" class="form-control" placeholder="Movistar"/>
				</div>

				<div class="form-group">
					<label for="telephone" class="sr-only">telephone</label>
					<g:textField name="telephones" value="${client?.claro}" class="form-control" placeholder="Claro"/>
				</div>

				<div class="form-group">
					<label for="telephone" class="sr-only">telephone</label>
					<g:textField name="telephones" value="${client?.convencional}" class="form-control" placeholder="Convencional"/>
				</div>

				<g:submitButton name="submit" value="Agregar" class="btn btn-primary btn-block"/>
			</g:form>

			<g:form action="list">
				<h4>Filtrar</h4>
				<h5>Por perfil</h5>
				<div class="checkbox">
					<label>
						<g:checkBox name="profile" value="true" checked="${params?.profile?.contains("true")}"/>
						Completo
					</label>
				</div>

				<div class="checkbox">
					<label>
						<g:checkBox name="profile" value="false" checked="${params?.profile?.contains("false")}"/>
						Sin completar
					</label>
				</div>

				<button type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-filter"></span> Filtrar</button>
				</g:form>

			<g:hasErrors bean="${client}">
				<g:eachError bean="${client}">
					<p><small><g:message error="${it}"/></small></p>
				</g:eachError>
			</g:hasErrors>
		</div>
	</div>
	<asset:javascript src="addTelephone.js"/>
</body>
</html>