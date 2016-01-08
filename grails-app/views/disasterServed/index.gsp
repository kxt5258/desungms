
<%@ page import="desungms.DisasterServed" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'disasterServed.label', default: 'DisasterServed')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-disasterServed" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div id="list-disasterServed" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="disasterType" title="${message(code: 'disasterServed.disasterType.label', default: 'Disaster Type')}" />
					
						<g:sortableColumn property="place" title="${message(code: 'disasterServed.place.label', default: 'Place')}" />
					
						<g:sortableColumn property="startDate" title="${message(code: 'disasterServed.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'disasterServed.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="details" title="${message(code: 'disasterServed.details.label', default: 'Details')}" />
					
						<th><g:message code="disasterServed.desung.label" default="Desung" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${disasterServedInstanceList}" status="i" var="disasterServedInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${disasterServedInstance.id}">${fieldValue(bean: disasterServedInstance, field: "disasterType")}</g:link></td>
					
						<td>${fieldValue(bean: disasterServedInstance, field: "place")}</td>
					
						<td><g:formatDate date="${disasterServedInstance.startDate}" /></td>
					
						<td><g:formatDate date="${disasterServedInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: disasterServedInstance, field: "details")}</td>
					
						<td>${fieldValue(bean: disasterServedInstance, field: "desung")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${disasterServedInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
