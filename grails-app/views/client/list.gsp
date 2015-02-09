<g:applyLayout name="threeBlocks">
	<head>
		<title>Clientes</title>
	</head>

	<content tag="main">
		<g:if test="${clients}">
			<table class="table table-hover">
				<thead>
					<th>Clientes</th>
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
	</content>

	<content tag="action">
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
				<label for="movistar" class="sr-only">movistar</label>
				<g:textField name="movistar" value="${client?.movistar}" class="form-control" placeholder="Movistar"/>
			</div>

			<div class="form-group">
				<label for="claro" class="sr-only">claro</label>
				<g:textField name="claro" value="${client?.claro}" class="form-control" placeholder="Claro"/>
			</div>

			<div class="form-group">
				<label for="convencional" class="sr-only">convencional</label>
				<g:textField name="convencional" value="${client?.convencional}" class="form-control" placeholder="Convencional"/>
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
	</content>
</g:applyLayout>