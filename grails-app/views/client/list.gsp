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
						<th width="1"></th>
						<th>Nombre completo</th>
					</thead>
					<tbody>
						<g:each in="${clients}" var="client" status="i">
							<tr>
								<td>${i + 1}</td>
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
				<g:submitButton name="submit" value="Agregar" class="btn btn-primary btn-block"/>
			</g:form>

			<g:hasErrors bean="${client}">
				<g:eachError bean="${client}">
					<p><small><g:message error="${it}"/></small></p>
				</g:eachError>
			</g:hasErrors>
		</div>
	</div>
</body>
</html>