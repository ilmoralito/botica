<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name='layout' content='private'/>
	<title>${user?.fullName}</title>
</head>
<body>
	<div class="row">
		<div class="col-md-4">
			<div class="row">
				<div class="col-md-12">
					<p class="pull-right">
						<g:link action="toggleEnabledState" id="${user?.id}" class="btn btn-warning">
							<botica:userStatus enabled="${user?.enabled}"/> <span class="glyphicon glyphicon-trash"></span>
						</g:link>
					</p>
				</div>
			</div>

			<g:form action="update" autocomplete="off">
				<g:render template="form"/>

				<g:submitButton name="submit" value="Confirmar" class="btn btn-primary"/>
				<g:link action="list" class="btn btn-default">Regresar</g:link>
			</g:form>
		</div>
	</div>
</body>
</html>