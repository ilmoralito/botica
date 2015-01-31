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
				<thead>
					<th width="1"></th>
					<th>Nombre completo</th>
					<th>Nombre de usuario</th>
					<th>Estado</th>
					<th>Roles</th>
				</thead>
				<tbody>
					<g:each in="${users}" var="user">
						<tr>
							<td><g:link action="show" id="${user.id}">+</g:link></td>
							<td>${user.fullName}</td>
							<td>${user.username}</td>
							<td><botica:userStatus enabled="${user.enabled}"/></td>
							<td>${user.authorities.authority.join(" ")}</td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<div class="col-md-2">
			Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam doloribus vitae nulla minus temporibus ab mollitia, officia accusantium illo earum aliquid, quisquam corporis saepe ipsa magni consequuntur fugiat. Quis, animi.
		</div>
	</div>
</body>
</html>