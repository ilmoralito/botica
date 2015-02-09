<g:applyLayout name="twoBlocks">
	<head>
		<title>${user?.fullName}</title>
	</head>

	<content tag="main">
		<div class="row">
			<div class="col-md-12">
				<p class="pull-right">
					<g:link action="toggleEnabledState" id="${user?.id}" class="btn btn-warning">
						<span class="glyphicon glyphicon-repeat"></span>
						<botica:userStatus enabled="${user?.enabled}"/>
					</g:link>
				</p>
			</div>
		</div>

		<g:form action="update" autocomplete="off">
			<g:hiddenField name="id" value="${user?.id}"/>
			<g:render template="form"/>

			<g:submitButton name="submit" value="Confirmar" class="btn btn-primary"/>
			<g:link action="list" class="btn btn-default">Regresar</g:link>
		</g:form>
	</content>
</g:applyLayout>