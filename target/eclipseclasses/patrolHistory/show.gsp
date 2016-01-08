
<%@ page import="desungms.PatrolHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patrolHistory.label', default: 'PatrolHistory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-patrolHistory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div id="show-patrolHistory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list patrolHistory">
			
				<g:if test="${patrolHistoryInstance?.border}">
				<li class="fieldcontain">
					<span id="border-label" class="property-label"><g:message code="patrolHistory.border.label" default="Border" /></span>
					
						<span class="property-value" aria-labelledby="border-label"><g:fieldValue bean="${patrolHistoryInstance}" field="border"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patrolHistoryInstance?.details}">
				<li class="fieldcontain">
					<span id="details-label" class="property-label"><g:message code="patrolHistory.details.label" default="Details" /></span>
					
						<span class="property-value" aria-labelledby="details-label"><g:fieldValue bean="${patrolHistoryInstance}" field="details"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${patrolHistoryInstance?.desung}">
				<li class="fieldcontain">
					<span id="desung-label" class="property-label"><g:message code="patrolHistory.desung.label" default="Desung" /></span>
					
						<span class="property-value" aria-labelledby="desung-label"><g:link controller="desung" action="show" id="${patrolHistoryInstance?.desung?.id}">${patrolHistoryInstance?.desung?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${patrolHistoryInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="patrolHistory.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${patrolHistoryInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${patrolHistoryInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="patrolHistory.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${patrolHistoryInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:patrolHistoryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${patrolHistoryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
