<%@ page import="desungms.Desung" %>



<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'profile', 'error')} ">
	<label for="profile">
		<g:message code="desung.profile.label" default="Profile" />
		
	</label>
	<input type="file" id="profile" name="profile" />

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'desungId', 'error')} required">
	<label for="desungId">
		<g:message code="desung.desungId.label" default="Desung Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="desungId" required="" value="${desungInstance?.desungId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="desung.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${desungInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'citizenID', 'error')} required">
	<label for="citizenID">
		<g:message code="desung.citizenID.label" default="Citizen Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="citizenID" length="15" required="" value="${desungInstance?.citizenID}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="desung.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${desungInstance.constraints.gender.inList}" required="" value="${desungInstance?.gender}" valueMessagePrefix="desung.gender"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'maritialStatus', 'error')} ">
	<label for="maritialStatus">
		<g:message code="desung.maritialStatus.label" default="Maritial Status" />
	</label>
	<g:select name="maritialStatus" from="${desungInstance.constraints.maritialStatus.inList}" value="${desungInstance?.maritialStatus}" valueMessagePrefix="desung.maritialStatus" noselection="['':'']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'qualification', 'error')} ">
	<label for="qualification">
		<g:message code="desung.qualification.label" default="Qualification" />
		
	</label>
	<g:textField name="qualification" value="${desungInstance?.qualification}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'contactNumber', 'error')} ">
	<label for="contactNumber">
		<g:message code="desung.contactNumber.label" default="Contact Number" />
	</label>
	<g:textField name="contactNumber" maxlength="25" value="${desungInstance?.contactNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'bloodGroup', 'error')} ">
	<label for="bloodGroup">
		<g:message code="desung.bloodGroup.label" default="Blood Group" />
	</label>
	<g:select name="bloodGroup" from="${desungInstance.constraints.bloodGroup.inList}" required="" value="${desungInstance?.bloodGroup}" valueMessagePrefix="desung.bloodGroup" noselection="['':'']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'inCountry', 'error')}">
	<label for="inCountry">
		<g:message code="desung.inCountry.label" default="Present Country" />
	</label>
	<g:textField name="inCountry" value="${desungInstance?.inCountry?:'Bhutan'}" valueMessagePrefix="desung.inCountry"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'dateOfBirth', 'error')} ">
	<label for="dateOfBirth">
		<g:message code="desung.dateOfBirth.label" default="Date Of Birth" />
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${desungInstance?.dateOfBirth}"  default="none" noSelection="['':'']" />

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="desung.email.label" default="Email" />
	</label>
	<g:field type="email" name="email" value="${desungInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'permenantAddress', 'error')}">
	<label for="permenantAddress">
		<g:message code="desung.permenantAddress.label" default="Permenant Address" />
	</label>
	<g:textArea name="permenantAddress" cols="40" rows="5" value="${desungInstance?.permenantAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'presentAddress', 'error')} ">
	<label for="presentAddress">
		<g:message code="desung.presentAddress.label" default="Present Address" />
	</label>
	<g:textArea name="presentAddress" cols="40" rows="5" value="${desungInstance?.presentAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'presentDzongkhag', 'error')} ">
	<label for="presentDzongkhag">
		<g:message code="desung.presentDzongkhag.label" default="Present Dzongkhag" />
	</label>
	<g:select name="presentDzongkhag" from="${desungInstance.constraints.presentDzongkhag.inList}" noselection="['':'']" value="${desungInstance?.presentDzongkhag}" valueMessagePrefix="desung.presentDzongkhag"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'alive', 'error')} required">
	<label for="alive">
		<g:message code="desung.alive.label" default="Dead or Alive" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="alive" from="${desungInstance.constraints.alive.inList}" required="" value="${desungInstance?.alive}" valueMessagePrefix="desung.alive"/>

</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'remarks', 'error')} ">
	<label for="remarks">
		<g:message code="desung.remarks.label" default="Remarks" />
		
	</label>
	<g:textField name="remarks" value="${desungInstance?.remarks}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'patrolHistory', 'error')} ">
	<label for="patrolHistory">
		<g:message code="desung.patrolHistory.label" default="Patrol History" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${desungInstance?.patrolHistory?}" var="a">
    <li><g:link controller="patrolHistory" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="patrolHistory" action="create" params="['desung.id': desungInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'patrolHistory.label', default: 'Patrol History')])}</g:link>
</li>
</ul>
</div>



<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'medicalHistory', 'error')} ">
	<label for="medicalHistory">
		<g:message code="desung.medicalHistory.label" default="Medical History" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${desungInstance?.medicalHistory?}" var="a">
    <li><g:link controller="medicalHistory" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="medicalHistory" action="create" params="['desung.id': desungInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'medicalHistory.label', default: 'Medical History')])}</g:link>
</li>
</ul>
</div>





<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'adverseReports', 'error')} ">
	<label for="adverseReports">
		<g:message code="desung.adverseReports.label" default="Adverse Reports" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${desungInstance?.adverseReports?}" var="a">
    <li><g:link controller="adverseReports" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="adverseReports" action="create" params="['desung.id': desungInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'adverseReports.label', default: 'Adverse Reports')])}</g:link>
</li>
</ul>
</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'servedDuringDisaster', 'error')} ">
	<label for="servedDuringDisaster">
		<g:message code="desung.servedDuringDisaster.label" default="Served During Disaster" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${desungInstance?.servedDuringDisaster?}" var="s">
    <li><g:link controller="disasterServed" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="disasterServed" action="create" params="['desung.id': desungInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'disasterServed.label', default: 'Disaster Served Records')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: desungInstance, field: 'socialWork', 'error')} ">
	<label for="socialWork">
		<g:message code="desung.socialWork.label" default="Social Work" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${desungInstance?.socialWork?}" var="s">
    <li><g:link controller="socialWork" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="socialWork" action="create" params="['desung.id': desungInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'socialWork.label', default: 'Social Work Records')])}</g:link>
</li>
</ul>


</div>

