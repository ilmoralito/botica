<g:applyLayout name="twoBlocks">
	<head>
		<title>${laboratory?.name}</title>
	</head>

	<content tag="main">
		<g:form action="update" autocomplete="off">
			<g:hiddenField name="id" value="${params?.id}"/>

			<div class="form-group">
				<label for="name" class="sr-only">Name</label>
				<g:textField name="name" value="${laboratory?.name}" class="form-control" placeholder="Laboratorio" autofocus="true"/>
			</div>

			<g:submitButton name="submit" value="Confirmar" class="btn btn-primary"/>
		</g:form>
	</content>
</g:applyLayout>