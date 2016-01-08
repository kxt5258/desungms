<%@ page import="desungms.Desung" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'desung.label', default: 'Desung')}" />
		<title>Upload File</title>
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
			<g:form url="[controller:'Desung', action:'uploadExcel']" method="PUT"  enctype="multipart/form-data">
			<fieldset class="form">
				<label><b>Upload Excel File:</b>
				</label><br /><br />
				<input type="file" name="file" />
			</fieldset>
			
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="uploadExcel" value="Upload" />
			</fieldset>
		</g:form>
		</div>
	</body>
</html>
