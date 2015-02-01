<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name='layout' content='private'/>
	<title>Lista de usuarios</title>
</head>
<body>
	<div class="row">
		<div class="col-md-10">
			<h4>Usuarios</h4>
			<table class="table table-hover">
				<colgroup>
					<col span="1" style="width: 1%;">
					<col span="1" style="width: 39%;">
					<col span="1" style="width: 20%;">
					<col span="1" style="width: 20%;">
					<col span="1" style="width: 20%;">
				</colgroup>
				<thead>
					<th></th>
					<th>Nombre completo</th>
					<th>Nombre de usuario</th>
					<th>Estado</th>
					<th>Roles</th>
				</thead>
				<tbody>
					<g:each in="${users}" var="user">
						<tr>
							<td>
								<g:link action="show" id="${user.id}">
									<span class="glyphicon glyphicon-pencil"></span>
								</g:link>
							</td>
							<td>${user.fullName}</td>
							<td>${user.username}</td>
							<td><botica:userStatus enabled="${user.enabled}"/></td>
							<td>${user.authorities.authority.join(", ")}</td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<div class="col-md-2">
		<h4>Nuevo usuario</h4>
			<g:form action="save" autocomplete="off">
				<g:render template="form"/>

				<g:submitButton name="submit" value="Agregar usuario" class="btn btn-primary btn-block"/>
			</g:form>

			<h4>Filtrar</h4>
			<g:form action="list">
				<h5>Por rol</h5>
				<div class="checkbox">
					<label>
						<g:checkBox name="roles" value="ROLE_ADMIN" checked="false"/>
						Administrador
					</label>
				</div>
				<div class="checkbox">
					<label>
						<g:checkBox name="roles" value="ROLE_USER" checked="false"/>
						Usuario
					</label>
				</div>

				<h5>Por estado</h5>
				<div class="checkbox">
					<label>
						<g:checkBox name="enabledState" value="true" checked="${params?.enabledState?.contains('true')}"/>
						Activos
					</label>
				</div>
				<div class="checkbox">
					<label>
						<g:checkBox name="enabledState" value="false" checked="${params?.enabledState?.contains('false')}"/>
						Inactivos
					</label>
				</div>

				<button type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-filter"></span> Filtrar</button>
			</g:form>
		</div>
	</div>
</body>
</html>