
<%@ page import="desungms.MedicalHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medicalHistory.label', default: 'MedicalHistory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-medicalHistory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div id="show-medicalHistory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list medicalHistory">
			
				<g:if test="${medicalHistoryInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="medicalHistory.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${medicalHistoryInstance}" field="name"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${medicalHistoryInstance?.details}">
				<li class="fieldcontain">
					<span id="details-label" class="property-label"><g:message code="medicalHistory.details.label" default="Details" /></span>
					
						<span class="property-value" aria-labelledby="details-label"><g:fieldValue bean="${medicalHistoryInstance}" field="details"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicalHistoryInstance?.desung}">
				<li class="fieldcontain">
					<span id="desung-label" class="property-label"><g:message code="medicalHistory.desung.label" default="Desung" /></span>
					
						<span class="property-value" aria-labelledby="desung-label"><g:link controller="desung" action="show" id="${medicalHistoryInstance?.desung?.id}">${medicalHistoryInstance?.desung?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:medicalHistoryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${medicalHistoryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
