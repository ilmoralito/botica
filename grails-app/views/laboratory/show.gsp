<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name='layout' content='private'/>
	<title>${laboratory?.name}</title>
</head>
<body>
	<div class="row">
		<div class="col-md-2">
			<g:form action="update" autocomplete="off">
				<g:hiddenField name="id" value="${params?.id}"/>

				<div class="form-group">
					<label for="name" class="sr-only">Name</label>
					<g:textField name="name" value="${laboratory?.name}" class="form-control" placeholder="Laboratorio" autofocus="true"/>
				</div>

				<g:submitButton name="submit" value="Confirmar" class="btn btn-primary btn-block"/>
			</g:form>
		</div>
		<div class="col-md-8">
			<h4>lorem</h4>
		</div>
		<div class="col-md-2">

		</div>
	</div>
</body>
</html>