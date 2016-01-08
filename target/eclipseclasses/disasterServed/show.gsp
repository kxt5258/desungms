
<%@ page import="desungms.DisasterServed" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'disasterServed.label', default: 'DisasterServed')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-disasterServed" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div id="show-disasterServed" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list disasterServed">
			
				<g:if test="${disasterServedInstance?.disasterType}">
				<li class="fieldcontain">
					<span id="disasterType-label" class="property-label"><g:message code="disasterServed.disasterType.label" default="Disaster Type" /></span>
					
						<span class="property-value" aria-labelledby="disasterType-label"><g:fieldValue bean="${disasterServedInstance}" field="disasterType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${disasterServedInstance?.place}">
				<li class="fieldcontain">
					<span id="place-label" class="property-label"><g:message code="disasterServed.place.label" default="Place" /></span>
					
						<span class="property-value" aria-labelledby="place-label"><g:fieldValue bean="${disasterServedInstance}" field="place"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${disasterServedInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="disasterServed.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${disasterServedInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${disasterServedInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="disasterServed.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${disasterServedInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${disasterServedInstance?.details}">
				<li class="fieldcontain">
					<span id="details-label" class="property-label"><g:message code="disasterServed.details.label" default="Details" /></span>
					
						<span class="property-value" aria-labelledby="details-label"><g:fieldValue bean="${disasterServedInstance}" field="details"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${disasterServedInstance?.desung}">
				<li class="fieldcontain">
					<span id="desung-label" class="property-label"><g:message code="disasterServed.desung.label" default="Desung" /></span>
					
						<span class="property-value" aria-labelledby="desung-label"><g:link controller="desung" action="show" id="${disasterServedInstance?.desung?.id}">${disasterServedInstance?.desung?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:disasterServedInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${disasterServedInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
