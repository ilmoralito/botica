<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name='layout' content='private'/>
	<title>Distribuidores</title>
</head>
<body>
	<div class="row">
		<div class="col-md-10">
			<g:if test="${dealers}">
				<table class="table table-hover">
					<thead>
						<th>Nombre</th>
					</thead>
					<tbody>
						<g:each in="${dealers}" var="dealer">
							<tr>
								<td><g:link action="show" id="${dealer.id}">${dealer.name}</g:link></td>
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
				<g:render template="form"/>

				<g:submitButton name="submit" value="Agregar" class="btn btn-primary btn-block"/>
			</g:form>

			<g:hasErrors bean="${dealer}">
				<g:eachError bean="${dealer}">
					<p><small><g:message error="${it}"/></small></p>
				</g:eachError>
			</g:hasErrors>
		</div>
	</div>
</body>
</html>