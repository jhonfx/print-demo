

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cheque.label', default: 'Cheque')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cheque" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cheque" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fecha" title="${message(code: 'cheque.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="folio" title="${message(code: 'cheque.folio.label', default: 'Folio')}" />
					
						<g:sortableColumn property="monto" title="${message(code: 'cheque.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="piePagina" title="${message(code: 'cheque.piePagina.label', default: 'Pie Pagina')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'cheque.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="totalMoneda" title="${message(code: 'cheque.totalMoneda.label', default: 'Total Moneda')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chequeInstanceList}" status="i" var="chequeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chequeInstance.id}">${fieldValue(bean: chequeInstance, field: "fecha")}</g:link></td>
					
						<td>${fieldValue(bean: chequeInstance, field: "folio")}</td>
					
						<td>${fieldValue(bean: chequeInstance, field: "monto")}</td>
					
						<td>${fieldValue(bean: chequeInstance, field: "piePagina")}</td>
					
						<td>${fieldValue(bean: chequeInstance, field: "titulo")}</td>
					
						<td>${fieldValue(bean: chequeInstance, field: "totalMoneda")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chequeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
