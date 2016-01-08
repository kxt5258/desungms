
<%@ page import="desungms.AdverseReports" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'adverseReports.label', default: 'AdverseReports')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-adverseReports" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div id="list-adverseReports" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="reportType" title="${message(code: 'adverseReports.reportType.label', default: 'Report Type')}" />
					
						<g:sortableColumn property="remarks" title="${message(code: 'adverseReports.remarks.label', default: 'Remarks')}" />
					
						<g:sortableColumn property="dateCommitted" title="${message(code: 'adverseReports.dateCommitted.label', default: 'Date Committed')}" />
					
						<th><g:message code="adverseReports.desung.label" default="Desung" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${adverseReportsInstanceList}" status="i" var="adverseReportsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${adverseReportsInstance.id}">${fieldValue(bean: adverseReportsInstance, field: "reportType")}</g:link></td>
					
						<td>${fieldValue(bean: adverseReportsInstance, field: "remarks")}</td>
					
						<td><g:formatDate date="${adverseReportsInstance.dateCommitted}" /></td>
					
						<td>${fieldValue(bean: adverseReportsInstance, field: "desung")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${adverseReportsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
