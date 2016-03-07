
<%@ page import="desungms.Desung" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'desung.label', default: 'Desung')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-desung" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div id="list-desung" class="content scaffold-list" role="main">
			<div class="sortForm">
				<g:render template="sortForm" />
			</div>
			<h1>
			<g:if test="${flash.sorted}">
				${flash.sorted}
			</g:if>
			<g:else>
				<g:message code="default.list.label" args="[entityName]" />
			</g:else>
			</h1>
			
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>					
						<g:sortableColumn property="desungId" title="${message(code: 'desung.desungId.label', default: 'Desung ID')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'desung.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="citizenID" title="${message(code: 'desung.gender.label', default: 'Citizen ID')}" />
					
						<g:sortableColumn property="contactNumber" title="${message(code: 'desung.contactNumber.label', default: 'Contact Number')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'desung.email.label', default: 'Email Address')}" />

						<g:sortableColumn property="presentDzongkhag" title="${message(code: 'desung.presentDzongkhag.label', default: 'Residence')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${desungInstanceList}" status="i" var="desungInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">										
						<td><g:link action="show" id="${desungInstance.id}">${fieldValue(bean: desungInstance, field: "desungId")}</g:link></td>
					
						<td>${fieldValue(bean: desungInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: desungInstance, field: "citizenID")}</td>
					
						<td>${fieldValue(bean: desungInstance, field: "contactNumber")}</td>
					
						<td>${fieldValue(bean: desungInstance, field: "email")}</td>
						
						<td>${fieldValue(bean: desungInstance, field: "presentDzongkhag")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${desungInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
