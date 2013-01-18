



<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'fecha', 'error')} ">
	<label for="fecha">
		<g:message code="cheque.fecha.label" default="Fecha" />
		
	</label>
	<g:textField name="fecha" value="${chequeInstance?.fecha}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'folio', 'error')} required">
	<label for="folio">
		<g:message code="cheque.folio.label" default="Folio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="folio" type="number" value="${chequeInstance.folio}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="cheque.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: chequeInstance, field: 'monto')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'piePagina', 'error')} ">
	<label for="piePagina">
		<g:message code="cheque.piePagina.label" default="Pie Pagina" />
		
	</label>
	<g:textField name="piePagina" value="${chequeInstance?.piePagina}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="cheque.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${chequeInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'totalMoneda', 'error')} ">
	<label for="totalMoneda">
		<g:message code="cheque.totalMoneda.label" default="Total Moneda" />
		
	</label>
	<g:textField name="totalMoneda" value="${chequeInstance?.totalMoneda}"/>
</div>

