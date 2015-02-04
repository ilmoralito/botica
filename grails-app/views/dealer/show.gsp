<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name='layout' content='private'/>
	<title>${dealer?.name}</title>
</head>
<body>
	<div class="row">
		<div class="col-md-4">
			<g:form action="update" autocomplete="off">
				<g:hiddenField name="id" value="${params?.id}"/>
				<g:render template="form"/>
			
				<g:submitButton name="submit" value="Actualizar" class="btn btn-primary"/>
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