

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cheque.label', default: 'Cheque')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cheque" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cheque" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cheque">
			
				<g:if test="${chequeInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="cheque.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:fieldValue bean="${chequeInstance}" field="fecha"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chequeInstance?.folio}">
				<li class="fieldcontain">
					<span id="folio-label" class="property-label"><g:message code="cheque.folio.label" default="Folio" /></span>
					
						<span class="property-value" aria-labelledby="folio-label"><g:fieldValue bean="${chequeInstance}" field="folio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chequeInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="cheque.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${chequeInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chequeInstance?.piePagina}">
				<li class="fieldcontain">
					<span id="piePagina-label" class="property-label"><g:message code="cheque.piePagina.label" default="Pie Pagina" /></span>
					
						<span class="property-value" aria-labelledby="piePagina-label"><g:fieldValue bean="${chequeInstance}" field="piePagina"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chequeInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="cheque.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${chequeInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chequeInstance?.totalMoneda}">
				<li class="fieldcontain">
					<span id="totalMoneda-label" class="property-label"><g:message code="cheque.totalMoneda.label" default="Total Moneda" /></span>
					
						<span class="property-value" aria-labelledby="totalMoneda-label"><g:fieldValue bean="${chequeInstance}" field="totalMoneda"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${chequeInstance?.id}" />
					<g:link class="edit" action="edit" id="${chequeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
