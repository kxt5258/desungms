
<%@ page import="desungms.PatrolHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'patrolHistory.label', default: 'PatrolHistory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-patrolHistory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div id="list-patrolHistory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="border" title="${message(code: 'patrolHistory.border.label', default: 'Border')}" />
					
						<g:sortableColumn property="details" title="${message(code: 'patrolHistory.details.label', default: 'Details')}" />
					
						<th><g:message code="patrolHistory.desung.label" default="Desung" /></th>
					
						<g:sortableColumn property="endDate" title="${message(code: 'patrolHistory.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="startDate" title="${message(code: 'patrolHistory.startDate.label', default: 'Start Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${patrolHistoryInstanceList}" status="i" var="patrolHistoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${patrolHistoryInstance.id}">${fieldValue(bean: patrolHistoryInstance, field: "border")}</g:link></td>
					
						<td>${fieldValue(bean: patrolHistoryInstance, field: "details")}</td>
					
						<td>${fieldValue(bean: patrolHistoryInstance, field: "desung")}</td>
					
						<td><g:formatDate date="${patrolHistoryInstance.endDate}" /></td>
					
						<td><g:formatDate date="${patrolHistoryInstance.startDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${patrolHistoryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
