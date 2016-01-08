<%@ page import="desungms.SocialWorkType" %>



<div class="fieldcontain ${hasErrors(bean: socialWorkTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="socialWorkType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${socialWorkTypeInstance?.name}"/>

</div>

