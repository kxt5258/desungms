<%@ page import="desungms.SocialWork" %>
<%@ page import="desungms.SocialWorkType" %>

<div class="fieldcontain ${hasErrors(bean: socialWorkInstance, field: 'socialWork', 'error')} required">
	<label for="socialWork">
		<g:message code="socialWork.socialWork.label" default="Social Work" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="socialWork" from="${SocialWorkType.list().name}" required="" valueMessagePrefix="socialWork.socialWork"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socialWorkInstance, field: 'place', 'error')} required">
	<label for="place">
		<g:message code="socialWork.place.label" default="Place" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="place" required="" value="${socialWorkInstance?.place}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socialWorkInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="socialWork.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${socialWorkInstance?.startDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: socialWorkInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="socialWork.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${socialWorkInstance?.endDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: socialWorkInstance, field: 'details', 'error')} ">
	<label for="details">
		<g:message code="socialWork.details.label" default="Details" />
	</label>
	<g:textArea name="details" cols="40" rows="5" maxlength="1500" value="${socialWorkInstance?.details}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socialWorkInstance, field: 'desung', 'error')} required">
	<label for="desung">
		<g:message code="socialWork.desung.label" default="Desung" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="desung" name="desung.id" from="${desungms.Desung.list()}" optionKey="id" required="" value="${socialWorkInstance?.desung?.id}" class="many-to-one"/>

</div>

