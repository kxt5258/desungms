<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${grailsApplication.config.globalValues.app.fullname}</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 15em 1.25em 15em;
				ttext-align: center;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
				
				.sign-in {
					text-align: center;
				}
			}
			
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div role="navigation">
			<g:render template="/layouts/menu"/>
		</div>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div id="page-body" role="main">
			<form action='${postUrl}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>
			
			
			<div class="sign-in">
		
			<table>
				<tr>
				<td colspan='2'>
					<h2>Login to ${grailsApplication.config.globalValues.app.fullname}</h2>
				</td>
				</tr>
				<tr>
					<td><label for="username"><g:message code='spring.security.ui.login.username'/></label></td>
					<td><input name="j_username" id="username" size="20" /></td>
				</tr>
				<tr>
					<td><label for="password"><g:message code='spring.security.ui.login.password'/></label></td>
					<td><input type="password" name="j_password" id="password" size="20" /></td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" class="checkbox" name="${rememberMeParameter}" id="remember_me" checked="checked" />
						<label for='remember_me'><g:message code='spring.security.ui.login.rememberme'/></label> |
					</td>
					<td>
						<button type="submit" class="btn">Login</button>
					</td>
				</tr>
			</table>
		
			</div>
			</form>
	</div>

<script>
$(document).ready(function() {
	$('#username').focus();
});

<s2ui:initCheckboxes/>

</script>

</body>
</html>
