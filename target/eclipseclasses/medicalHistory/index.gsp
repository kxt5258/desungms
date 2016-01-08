
<%@ page import="desungms.MedicalHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medicalHistory.label', default: 'MedicalHistory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-medicalHistory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div id="list-medicalHistory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'medicalHistory.name.label', default: 'Name')}" />
					
						<th><g:message code="medicalHistory.desung.label" default="Desung" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${medicalHistoryInstanceList}" status="i" var="medicalHistoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${medicalHistoryInstance.id}">${fieldValue(bean: medicalHistoryInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: medicalHistoryInstance, field: "desung")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${medicalHistoryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
