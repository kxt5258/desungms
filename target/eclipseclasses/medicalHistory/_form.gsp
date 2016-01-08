<%@ page import="desungms.MedicalHistory" %>



<div class="fieldcontain ${hasErrors(bean: medicalHistoryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="medicalHistory.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${medicalHistoryInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicalHistoryInstance, field: 'details', 'error')} ">
	<label for="details">
		<g:message code="medicalHistory.details.label" default="Details" />
	</label>
	<g:textArea name="details" cols="40" rows="5" maxlength="1500" value="${medicalHistoryInstance?.details}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicalHistoryInstance, field: 'desung', 'error')} required">
	<label for="desung">
		<g:message code="medicalHistory.desung.label" default="Desung" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="desung" name="desung.id" from="${desungms.Desung.list()}" optionKey="id" required="" value="${medicalHistoryInstance?.desung?.id}" class="many-to-one"/>

</div>

