
<%@ page import="desungms.Desung" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'desung.label', default: 'Desung')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-desung" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div id="show-desung" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:render template="showDesups" />
			<g:form url="[resource:desungInstance, action:'delete']" method="DELETE">
				<sec:ifLoggedIn>
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${desungInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="download" action="downloadPdf" id="${desungInstance.desungId}.pdf">Download</g:link>
				</fieldset>
				</sec:ifLoggedIn>
				<sec:ifNotLoggedIn>
				<fieldset class="buttons">
					<g:link class="download" action="downloadPdf" id="${desungInstance.desungId}.pdf">Download</g:link>
				</fieldset>
				</sec:ifNotLoggedIn>
			</g:form>
		</div>
	</body>
</html>
