<%@ page import="desungms.Desung" %>
<div style="float:right; margin:0px 5px;">
<g:form controller="Desung" action="sortDesuups">
<g:if test="${params?.alive}">
<g:select name="alive" 
		  from="${grailsApplication.config.globalValues.app.livingStatus }"
		  value="${params?.alive}"
		  noSelection="['%':'-All-']"
		  style="width:100px"/>  
</g:if>
<g:else>
<g:select name="alive" 
		  from="${grailsApplication.config.globalValues.app.livingStatus }"
		  noSelection="['%':'-All-']"
		  style="width:100px"/>  
</g:else>
		  
<g:if test="${params?.dzongkhag}">		  
<g:select name="dzongkhag" 
		  from="${grailsApplication.config.globalValues.app.dzongkhags }" 
		  value="${params?.dzongkhag}"
		  noSelection="['%':'-All-']"
		  style="width:160px"/>  
</g:if>
<g:else>
<g:select name="dzongkhag" 
		  from="${grailsApplication.config.globalValues.app.dzongkhags }" 
		  noSelection="['%':'-All-']"
		  style="width:160px"/>  
</g:else>

<g:if test="${params?.bloodGroup}">
<g:select name="bloodGroup" 
		  from="${grailsApplication.config.globalValues.app.bloodGroups}" 
		  value="${params?.bloodGroup}"
		  noSelection="['%':'-All-']"
		  style="width:100px"/>  
</g:if>
<g:else>
<g:select name="bloodGroup" 
		  from="${grailsApplication.config.globalValues.app.bloodGroups }" 
		  noSelection="['%':'-All-']"
		  style="width:100px"/>  
</g:else>		  

<g:actionSubmit action="sortDesuups" value="Sort & View" />
<g:actionSubmit action="downloadExcel" value="Download Excel" />
</g:form>
</div>