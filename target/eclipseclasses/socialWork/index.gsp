
<%@ page import="desungms.SocialWork" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'socialWork.label', default: 'SocialWork')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-socialWork" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div id="list-socialWork" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="socialWork" title="${message(code: 'socialWork.socialWork.label', default: 'Social Work')}" />
					
						<g:sortableColumn property="place" title="${message(code: 'socialWork.place.label', default: 'Place')}" />
					
						<g:sortableColumn property="startDate" title="${message(code: 'socialWork.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'socialWork.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="details" title="${message(code: 'socialWork.details.label', default: 'Details')}" />
					
						<th><g:message code="socialWork.desung.label" default="Desung" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${socialWorkInstanceList}" status="i" var="socialWorkInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${socialWorkInstance.id}">${fieldValue(bean: socialWorkInstance, field: "socialWork")}</g:link></td>
					
						<td>${fieldValue(bean: socialWorkInstance, field: "place")}</td>
					
						<td><g:formatDate date="${socialWorkInstance.startDate}" /></td>
					
						<td><g:formatDate date="${socialWorkInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: socialWorkInstance, field: "details")}</td>
					
						<td>${fieldValue(bean: socialWorkInstance, field: "desung")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${socialWorkInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
