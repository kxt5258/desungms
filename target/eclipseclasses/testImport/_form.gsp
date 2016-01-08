<%@ page import="desungms.TestImport" %>



<div class="fieldcontain ${hasErrors(bean: testImportInstance, field: 'dob', 'error')} required">
	<label for="dob">
		<g:message code="testImport.dob.label" default="Dob" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dob" precision="day"  value="${testImportInstance?.dob}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: testImportInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="testImport.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${testImportInstance?.name}"/>

</div>

