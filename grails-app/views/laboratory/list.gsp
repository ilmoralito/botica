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
			<g:if test="${laboratories}">
				<table class="table table-hover">
					<thead>
						<th>Nombre de laboratorio</th>
					</thead>
					<tbody>
						<g:each in="${laboratories}" var="laboratory">
							<tr>
								<td>
									<g:link action="show" id="${laboratory.id}">${laboratory.name}</g:link>
								</td>
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
					<label for="name" class="sr-only">Name</label>
					<g:textField name="name" value="${laboratory?.name}" class="form-control" placeholder="Laboratorio" autofocus="true"/>
				</div>

				<g:submitButton name="submit" value="Agregar" class="btn btn-primary btn-block"/>
			</g:form>

			<g:hasErrors bean="${laboratory}">
				<g:eachError bean="${laboratory}">
					<p><small><g:message error="${it}"/></small></p>
				</g:eachError>
			</g:hasErrors>
		</div>
	</div>
</body>
</html>