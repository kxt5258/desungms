
<%@ page import="desungms.SocialWork" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'socialWork.label', default: 'SocialWork')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-socialWork" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div id="show-socialWork" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list socialWork">
			
				<g:if test="${socialWorkInstance?.socialWork}">
				<li class="fieldcontain">
					<span id="socialWork-label" class="property-label"><g:message code="socialWork.socialWork.label" default="Social Work" /></span>
					
						<span class="property-value" aria-labelledby="socialWork-label"><g:fieldValue bean="${socialWorkInstance}" field="socialWork"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socialWorkInstance?.place}">
				<li class="fieldcontain">
					<span id="place-label" class="property-label"><g:message code="socialWork.place.label" default="Place" /></span>
					
						<span class="property-value" aria-labelledby="place-label"><g:fieldValue bean="${socialWorkInstance}" field="place"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socialWorkInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="socialWork.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${socialWorkInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${socialWorkInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="socialWork.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${socialWorkInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${socialWorkInstance?.details}">
				<li class="fieldcontain">
					<span id="details-label" class="property-label"><g:message code="socialWork.details.label" default="Details" /></span>
					
						<span class="property-value" aria-labelledby="details-label"><g:fieldValue bean="${socialWorkInstance}" field="details"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socialWorkInstance?.desung}">
				<li class="fieldcontain">
					<span id="desung-label" class="property-label"><g:message code="socialWork.desung.label" default="Desung" /></span>
					
						<span class="property-value" aria-labelledby="desung-label"><g:link controller="desung" action="show" id="${socialWorkInstance?.desung?.id}">${socialWorkInstance?.desung?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:socialWorkInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${socialWorkInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
