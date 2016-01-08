
<div id='cssmenu'>
<ul>
	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
	<li><g:link class="list" controller="Desung" action="index">List Desuup</g:link></li>
	<li><g:link class="create" controller="Desung" action="create">Create Desuup</g:link></li>
	<li class='has-sub'><a href="#">Add Types</a>
		<ul>
			<li><g:link class="artype" controller="AdverseReportType" action="create"> Adverse Report</g:link></li>
			<li><g:link class="artype" controller="SocialWorkType" action="create"> Social Work</g:link></li>
		</ul>
	</li>
	<li><g:link class="searchdesup" controller="Desung" action="uploadExcel">Upload</g:link></li>
	<li class='last'><g:link class="searchdesup" controller="Desung" action="search">Search Desuup</g:link></li>
</ul>
</div>