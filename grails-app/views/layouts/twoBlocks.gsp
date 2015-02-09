<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="private"/>
	<title><g:layoutTitle/></title>
	<g:layoutHead/>
</head>
<body>
	<div class="row">
		<div class="col-md-2">
			<g:render template="/layouts/sidebar"/>
		</div>
		<div class="col-md-10">
			<g:pageProperty name="page.main"/>
		</div>
	</div>
</body>
</html>