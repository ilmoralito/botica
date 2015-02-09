<ul class="nav nav-pills nav-stacked">
	<li class="${controllerName == 'dealer' ? 'active' : ''}">
		<g:link controller="dealer">Distribuidores</g:link>
	</li>
	<li class="${controllerName == 'laboratory' ? 'active' : ''}">
		<g:link controller="laboratory">Laboratorios</g:link>
	</li>
	<li class="${controllerName == 'client' ? 'active' : ''}">
		<g:link controller="client">Clientes</g:link>
	</li>
</ul>