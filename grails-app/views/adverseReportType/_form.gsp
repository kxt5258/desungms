<%@ page import="desungms.AdverseReportType" %>



<div class="fieldcontain ${hasErrors(bean: adverseReportTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="adverseReportType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${adverseReportTypeInstance?.name}"/>

</div>

