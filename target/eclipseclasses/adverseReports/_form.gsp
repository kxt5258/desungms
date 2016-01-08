<%@ page import="desungms.AdverseReports" %>
<%@ page import="desungms.AdverseReportType" %>

<div class="fieldcontain ${hasErrors(bean: adverseReportsInstance, field: 'reportType', 'error')} required">
	<label for="reportType">
		<g:message code="adverseReports.reportType.label" default="Report Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="reportType" from="${AdverseReportType.list().name}" required="" valueMessagePrefix="adverseReports.reportType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adverseReportsInstance, field: 'remarks', 'error')}">
	<label for="remarks">
		<g:message code="adverseReports.remarks.label" default="Remarks" />
	</label>
	<g:textArea name="remarks" cols="40" rows="5" maxlength="1000" value="${adverseReportsInstance?.remarks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adverseReportsInstance, field: 'dateCommitted', 'error')} required">
	<label for="dateCommitted">
		<g:message code="adverseReports.dateCommitted.label" default="Date Committed" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateCommitted" precision="day"  value="${adverseReportsInstance?.dateCommitted}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: adverseReportsInstance, field: 'desung', 'error')} ">
	<label for="desung">
		<g:message code="adverseReports.desung.label" default="Desung" />
		
	</label>
	<g:select id="desung" name="desung.id" from="${desungms.Desung.list()}" optionKey="id" value="${adverseReportsInstance?.desung?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

