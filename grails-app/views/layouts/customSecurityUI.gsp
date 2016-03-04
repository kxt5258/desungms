<%@ page import="grails.util.Holders" %>
<%@ page import="grails.plugin.springsecurity.SpringSecurityUtils" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
		<asset:javascript src="application.js"/>
  		<s2ui:resources module='spring-security-ui' />
  		<asset:stylesheet src="application.css"/>
		
		
		<%-- tab icons --%>
		<style>
		.icon_role {
			background-image: url('${fam.icon(name: 'lock')}');
		}
		.icon_users {
			background-image: url('${fam.icon(name: 'group')}');
		}
		.icon_user {
			background-image: url('${fam.icon(name: 'user')}');
		}
		.icon_error {
			background-image: url('${fam.icon(name: 'exclamation')}');
		}
		.icon_info {
			background-image: url('${fam.icon(name: 'information')}');
		}
		.icon, .ui-tabs .ui-tabs-nav li a.icon {
			background-repeat: no-repeat;
			padding-left: 24px;
			background-position: 4px center;
		}
		</style>
		<g:layoutHead/>
	</head>
	<body>
		<div id="grailsLogo" role="banner"><asset:image src="${grailsApplication.config.globalValues.app.logo}" alt="Desuung" id="logo"/>
		<h2 id="systemName">${grailsApplication.config.globalValues.app.fullname}</h2></div><div style="clear: both;"></div>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<div style="width: 100% !important; height: 10px !important;"></div>
		<div>

				<div id="s2ui_main">
			<div id="s2ui_content">
				<s2ui:layoutResources module='spring-security-ui' />
				<g:layoutBody/>
			</div>
		</div>
				</div>
				<g:render template='/includes/ajaxLogin' plugin='spring-security-ui'/>

<s2ui:showFlash/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
