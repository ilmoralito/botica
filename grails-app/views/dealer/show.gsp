<g:applyLayout name="twoBlocks">
	<head>
		<title>${dealer?.name}</title>
	</head>

	<content tag="main">
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
	</content>
</g:applyLayout>