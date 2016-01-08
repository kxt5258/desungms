<%@ page import="desungms.PatrolHistory" %>



<div class="fieldcontain ${hasErrors(bean: patrolHistoryInstance, field: 'border', 'error')} required">
	<label for="border">
		<g:message code="patrolHistory.border.label" default="Border" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="border" from="${patrolHistoryInstance.constraints.border.inList}" required="" value="${patrolHistoryInstance?.border}" valueMessagePrefix="patrolHistory.border"/>

</div>

<div class="fieldcontain ${hasErrors(bean: patrolHistoryInstance, field: 'details', 'error')} ">
	<label for="details">
		<g:message code="patrolHistory.details.label" default="Details" />
		
	</label>
	<g:textArea name="details" cols="40" rows="5" maxlength="1200" value="${patrolHistoryInstance?.details}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: patrolHistoryInstance, field: 'desung', 'error')} required">
	<label for="desung">
		<g:message code="patrolHistory.desung.label" default="Desung" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="desung" name="desung.id" from="${desungms.Desung.list()}" optionKey="id" required="" value="${patrolHistoryInstance?.desung?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: patrolHistoryInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="patrolHistory.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${patrolHistoryInstance?.endDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: patrolHistoryInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="patrolHistory.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${patrolHistoryInstance?.startDate}"  />

</div>

