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
					<colgroup>
						<col span="1" style="width: 1%;">
						<col span="1" style="width: 25%;">
						<col span="1" style="width: 25%;">
						<col span="1" style="width: 25%;">
						<col span="1" style="width: 24%;">
					</colgroup>
					<thead>
						<th></th>
						<th>Nombre</th>
						<th>Email</th>
						<th>Direccion</th>
						<th>Telefonos</th>
					</thead>
					<tbody>
						<g:each in="${dealers}" var="dealer">
							<tr>
								<td><g:link action="show" id="${dealer.id}"><span class="glyphicon glyphicon-pencil"></span></g:link></td>
								<td>${dealer.name}</td>
								<td>${dealer.email}</td>
								<td>${dealer.address}</td>
								<td>
									<g:each in="${dealer.telephones.keySet()}" var="o">
										${o[0]}:${dealer.telephones[o]}
									</g:each>
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
				<div class="form-group">
					<label for="movistar" class="sr-only">Movistar</label>
					<g:textField name="movistar" value="${dealer?.movistar}" class="form-control" placeholder="Movistar"/>
				</div>
				<div class="form-group">
					<label for="claro" class="sr-only">Claro</label>
					<g:textField name="claro" value="${dealer?.claro}" class="form-control" placeholder="Claro"/>
				</div>
				<div class="form-group">
					<label for="convencional" class="sr-only">Convencional</label>
					<g:textField name="convencional" value="${dealer?.convencional}" class="form-control" placeholder="Convencional"/>
				</div>

				<g:submitButton name="submit" value="Agregar" class="btn btn-primary btn-block"/>
			</g:form>
		</div>
	</div>
</body>
</html>