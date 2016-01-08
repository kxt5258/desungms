<%@ page import="desungms.DisasterServed" %>



<div class="fieldcontain ${hasErrors(bean: disasterServedInstance, field: 'disasterType', 'error')} required">
	<label for="disasterType">
		<g:message code="disasterServed.disasterType.label" default="Disaster Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="disasterType" from="${disasterServedInstance.constraints.disasterType.inList}" required="" value="${disasterServedInstance?.disasterType}" valueMessagePrefix="disasterServed.disasterType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: disasterServedInstance, field: 'place', 'error')} required">
	<label for="place">
		<g:message code="disasterServed.place.label" default="Place" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="place" required="" value="${disasterServedInstance?.place}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: disasterServedInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="disasterServed.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${disasterServedInstance?.startDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: disasterServedInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="disasterServed.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${disasterServedInstance?.endDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: disasterServedInstance, field: 'details', 'error')} ">
	<label for="details">
		<g:message code="disasterServed.details.label" default="Details" />
		
	</label>
	<g:textArea name="details" cols="40" rows="5" maxlength="1200" value="${disasterServedInstance?.details}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: disasterServedInstance, field: 'desung', 'error')} required">
	<label for="desung">
		<g:message code="disasterServed.desung.label" default="Desung" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="desung" name="desung.id" from="${desungms.Desung.list()}" optionKey="id" required="" value="${disasterServedInstance?.desung?.id}" class="many-to-one"/>

</div>

