
<%@ page import="desungms.AdverseReports" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'adverseReports.label', default: 'AdverseReports')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-adverseReports" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div id="show-adverseReports" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list adverseReports">
			
				<g:if test="${adverseReportsInstance?.reportType}">
				<li class="fieldcontain">
					<span id="reportType-label" class="property-label"><g:message code="adverseReports.reportType.label" default="Report Type" /></span>
					
						<span class="property-value" aria-labelledby="reportType-label"><g:fieldValue bean="${adverseReportsInstance}" field="reportType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adverseReportsInstance?.remarks}">
				<li class="fieldcontain">
					<span id="remarks-label" class="property-label"><g:message code="adverseReports.remarks.label" default="Remarks" /></span>
					
						<span class="property-value" aria-labelledby="remarks-label"><g:fieldValue bean="${adverseReportsInstance}" field="remarks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adverseReportsInstance?.dateCommitted}">
				<li class="fieldcontain">
					<span id="dateCommitted-label" class="property-label"><g:message code="adverseReports.dateCommitted.label" default="Date Committed" /></span>
					
						<span class="property-value" aria-labelledby="dateCommitted-label"><g:formatDate date="${adverseReportsInstance?.dateCommitted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${adverseReportsInstance?.desung}">
				<li class="fieldcontain">
					<span id="desung-label" class="property-label"><g:message code="adverseReports.desung.label" default="Desung" /></span>
					
						<span class="property-value" aria-labelledby="desung-label"><g:link controller="desung" action="show" id="${adverseReportsInstance?.desung?.id}">${adverseReportsInstance?.desung?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:adverseReportsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${adverseReportsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
