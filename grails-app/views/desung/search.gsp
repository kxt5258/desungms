<%@ page import="desungms.Desung" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'desung.label', default: 'Desung')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-desung" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		<div class="searchInterface">
			<g:form url="[controller:'Desung', action:'searchResult']" method="PUT"  enctype="multipart/form-data">
			<fieldset class="form">
				<g:textField name="desungId" size="35" height="10" placeholder="Enter Desung ID"/>
			</fieldset>
			
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="searchResult" value="Search" />
			</fieldset>
		</g:form>
		</div>
	</body>
</html>
