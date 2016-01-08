<table class="desupdetail">
				<g:if test="${desungInstance?.desungId}">
				<tr>
				<td width="200">
					<span id="desungId-label" class="property-label"><g:message code="desung.desungId.label" default="Desung Id:" /></span>
				</td>
				<td>
					<span class="property-value" aria-labelledby="desungId-label"><g:fieldValue bean="${desungInstance}" field="desungId"/></span>
				</td>	
				<td rowspan="8">
						<bi:hasImage bean="${desungInstance}">
							<bi:img size="large" bean="${desungInstance}" class="profile"/>
						</bi:hasImage>				
					</td>
				</tr>
				</g:if>
			
				<g:if test="${desungInstance?.name}">
				<tr>
				<td>
					<span id="name-label" class="property-label"><g:message code="desung.name.label" default="Name:" /></span>
				</td>
				<td>
					<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${desungInstance}" field="name"/></span>
				</td>
				</tr>
				</g:if>

				<g:if test="${desungInstance?.citizenID}">
				<tr>
				<td>
					<span id="name-label" class="property-label"><g:message code="desung.citizenID.label" default="Citizen ID:" /></span>
				</td>
				<td>
					<span class="property-value" aria-labelledby="citizenID-label"><g:fieldValue bean="${desungInstance}" field="citizenID"/></span>
				</td>
				</tr>
				</g:if>
							
				<g:if test="${desungInstance?.gender}">
				<tr>
				<td>
					<span id="gender-label" class="property-label"><g:message code="desung.gender.label" default="Gender:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${desungInstance}" field="gender"/></span>
				</td>
				</tr>
				</g:if>
				
				<g:if test="${desungInstance?.qualification}">
				<tr>
				<td>
					<span id="qualification-label" class="property-label"><g:message code="desung.qualification.label" default="Qualification:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="qualification-label"><g:fieldValue bean="${desungInstance}" field="qualification"/></span>
				</td>
				</tr>
				</g:if>
			
				<g:if test="${desungInstance?.contactNumber}">
				<tr>
				<td>
					<span id="contactNumber-label" class="property-label"><g:message code="desung.contactNumber.label" default="Contact Number:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="contactNumber-label"><g:fieldValue bean="${desungInstance}" field="contactNumber"/></span>
				</td>
				</tr>
				</g:if>
			
				<g:if test="${desungInstance?.bloodGroup}">
				<tr>
				<td>
					<span id="bloodGroup-label" class="property-label"><g:message code="desung.bloodGroup.label" default="Blood Group:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="bloodGroup-label"><g:fieldValue bean="${desungInstance}" field="bloodGroup"/></span>
				</td>
				</tr>
				</g:if>
			
				<g:if test="${desungInstance?.dateOfBirth}">
				<tr>
				<td>
					<span id="dateOfBirth-label" class="property-label"><g:message code="desung.dateOfBirth.label" default="Date Of Birth:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${desungInstance?.dateOfBirth}" /></span>
				</td>
				</tr>
				</g:if>
			
				<g:if test="${desungInstance?.maritialStatus}">
				<tr>
				<td>
					<span id="maritialStatus-label" class="property-label"><g:message code="desung.maritialStatus.label" default="Maritial Status:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="maritialStatus-label"><g:fieldValue bean="${desungInstance}" field="maritialStatus"/></span>
				</td>
				</tr>
				</g:if>
			
				<g:if test="${desungInstance?.email}">
				<tr>
				<td>
					<span id="email-label" class="property-label"><g:message code="desung.email.label" default="Email:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${desungInstance}" field="email"/></span>
				</td>
				</tr>
				</g:if>
			
				<g:if test="${desungInstance?.permenantAddress}">
				<tr>
				<td>
					<span id="permenantAddress-label" class="property-label"><g:message code="desung.permenantAddress.label" default="Permenant Address:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="permenantAddress-label"><g:fieldValue bean="${desungInstance}" field="permenantAddress"/></span>
				</td>
				</tr>
				</g:if>
			
				<g:if test="${desungInstance?.presentAddress}">
				<tr>
				<td>
					<span id="presentAddress-label" class="property-label"><g:message code="desung.presentAddress.label" default="Present Address:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="presentAddress-label"><g:fieldValue bean="${desungInstance}" field="presentAddress"/></span>
				</td>
				</tr>
				</g:if>
			
				<g:if test="${desungInstance?.presentDzongkhag}">
				<tr>
				<td>
					<span id="presentDzongkhag-label" class="property-label"><g:message code="desung.presentDzongkhag.label" default="Present Dzongkhag:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="presentDzongkhag-label"><g:fieldValue bean="${desungInstance}" field="presentDzongkhag"/></span>
				</td>
				</tr>
				</g:if>
				
			
				<g:if test="${desungInstance?.inCountry}">
				<tr>
				<td>
					<span id="inCountry-label" class="property-label"><g:message code="desung.inCountry.label" default="Currently In:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="inCountry-label"><g:fieldValue bean="${desungInstance}" field="inCountry"/></span>
				</td>
				</tr>
				</g:if>

				<g:if test="${desungInstance?.alive}">
				<tr>
				<td>
					<span id="alive-label" class="property-label"><g:message code="desung.alive.label" default="Dead or Alive:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="alive"><g:fieldValue bean="${desungInstance}" field="alive"/></span>
				</td>
				</tr>
				</g:if>
				
				<g:if test="${desungInstance?.remarks}">
				<tr>
				<td>
					<span id="remarks-label" class="property-label"><g:message code="desung.remarks.label" default="Remarks:" /></span>
				</td>
				<td>
						<span class="property-value" aria-labelledby="remarks-label"><g:fieldValue bean="${desungInstance}" field="remarks"/></span>
				</td>
				</tr>
				</g:if>
								
				<g:if test="${desungInstance?.medicalHistory}">
				<tr>
				<td colspan=3>
					<span id="medicalHistory-label" class="property-label"><br /><g:message code="desung.medicalHistory.label" default="Medical History:" /></span>
				</td>
				</tr>
				<tr>
				<td colspan="3">
					<table BORDER=1 CELLPADDING=10 CELLSPACING=5 RULES=ROWS FRAME=HSIDES width=100%>
						<thead>
						<tr>
							<td> Type </td>
							<td> Details</td>
						</tr>
						</thead>
					<g:each in="${desungInstance.medicalHistory}" var="s">
						<tr>
							<td>
								<span class="property-value" aria-labelledby="amedicalHistory-label">
									<g:link controller="medicalHistory" action="show" id="${s.id}">
										${s?.name?.encodeAsHTML()} 
									</g:link>
								</span>
							</td>
							<td>
								${s?.details?.encodeAsHTML()}
							</td>		
							</tr>
						</g:each>	
					</table>			
				</td>
				</tr>
				</g:if>
				
				<g:if test="${desungInstance?.adverseReports}">
				<tr>
				<td colspan="3">
					<span id="adverseReports-label" class="property-label"><br /><g:message code="desung.adverseReports.label :" default="Adverse Reports:" /></span>
				</td>
				</tr>
				<tr>
				<td colspan="3">
					<table BORDER=1 CELLPADDING=10 CELLSPACING=5 RULES=ROWS FRAME=HSIDES width=100%>
						<thead>
						<tr>
							<td> Report Type</td>
							<td> Date Committed</td>
							<td> Remarks</td>
						</tr>
						</thead>
							<g:each in="${desungInstance.adverseReports}" var="s">
							<tr>
							<td>
								<span class="property-value" aria-labelledby="adverseReports-label">
									<g:link controller="adverseReports" action="show" id="${s.id}">
										${s?.reportType?.encodeAsHTML()} 
									</g:link>
								</span>
							</td>
							<td>
								${s?.dateCommitted?.format('dd-MMM-yyyy').encodeAsHTML()}
							</td>
							<td>
								${s?.remarks?.encodeAsHTML()}
							</td>		
							</tr>
							</g:each>		
							</table>				
				</td>
				</tr>
				</g:if>			
				
				<g:if test="${desungInstance?.patrolHistory}">
				<tr>
				<td colspan=3>
					<span id="patrolHistory-label" class="property-label"><br /><g:message code="desung.patrolHistory.label :" default="Patrol History:" /></span>
				</td>
				</tr>
				<tr>
				<td colspan="3">
					<table BORDER=1 CELLPADDING=10 CELLSPACING=5 RULES=ROWS FRAME=HSIDES width=100%>
					<thead>
					<tr>
						<td> Where</td>
						<td> Start Date</td>
						<td> End date</td>
						<td> Details</td>	
					</tr>
					</thead>
						<g:each in="${desungInstance.patrolHistory}" var="s">
						<tr>
						<td>
							<span class="property-value" aria-labelledby="patrolHistory-label">
								<g:link controller="patrolHistory" action="show" id="${s.id}">
									${s?.encodeAsHTML()} 
								</g:link>
							</span>
						</td>
						<td>
							${s?.startDate?.format('dd-MMM-yyyy').encodeAsHTML()}
						</td>
						<td>
							${s?.endDate?.format('dd-MMM-yyyy').encodeAsHTML()}
						</td>
						<td>
							${s?.details.encodeAsHTML()}
						</td>		
						</tr>
						</g:each>		
						</table>		
					</td>
				</tr>
				</g:if>
							
				<g:if test="${desungInstance?.socialWork}">
				<tr>
				<td colspan=3>
					<span id="socialWork-label" class="property-label"><br /><g:message code="desung.socialWork.label :" default="Social Work:" /></span>
				</td>
				</tr>
				<tr>
				<td colspan="3">
					<table BORDER=1 CELLPADDING=10 CELLSPACING=5 RULES=ROWS FRAME=HSIDES width=100%>
						<thead>
						<tr>
							<td> Social Work</td>
							<td> Place</td>
							<td> Start Date</td>
							<td> End Date</td>	
							<td> Details</td>	
						</tr>
						</thead>
							<g:each in="${desungInstance.socialWork}" var="s">
							<tr>
							<td>
								<span class="property-value" aria-labelledby="socialWork-label">
									<g:link controller="socialWork" action="show" id="${s.id}">
										${s?.socialWork?.encodeAsHTML()} 
									</g:link>
								</span>
							</td>
							<td>
								${s?.place?.encodeAsHTML()}
							</td>
							<td>
								${s?.startDate?.format('dd-MMM-yyyy').encodeAsHTML()}
							</td>
							<td>
								${s?.endDate?.format('dd-MMM-yyyy').encodeAsHTML()}
							</td>
							<td>
								${s?.details?.encodeAsHTML()}
							</td>		
							</tr>
							</g:each>		
							</table>				
				</td>
				</tr>
				</g:if>
			
				<g:if test="${desungInstance?.servedDuringDisaster}">
				<tr>
				<td colspan=3>
					<span id="servedDuringDisaster-label" class="property-label"><br /><g:message code="desung.servedDuringDisaster.label :" default="Served During Disaster:" /></span>
				</td>
				</tr>
				<tr>
				<td colspan="3">
					<table BORDER=1 CELLPADDING=10 CELLSPACING=5 RULES=ROWS FRAME=HSIDES width=100%>
						<thead>
						<tr>
							<td> Disaster Type</td>
							<td> Place</td>
							<td> Start Date</td>
							<td> End Date</td>	
							<td> Details</td>	
						</tr>
						</thead>
							<g:each in="${desungInstance.servedDuringDisaster}" var="s">
							<tr>
							<td>
								<span class="property-value" aria-labelledby="servedDuringDisaster-label">
									<g:link controller="disasterServed" action="show" id="${s.id}">
										${s?.disasterType?.encodeAsHTML()} 
									</g:link>
								</span>
							</td>
							<td>
								${s?.place?.encodeAsHTML()}
							</td>
							<td>
								${s?.startDate?.format('dd-MMM-yyyy').encodeAsHTML()}
							</td>
							<td>
								${s?.endDate?.format('dd-MMM-yyyy').encodeAsHTML()}
							</td>
							<td>
								${s?.details?.encodeAsHTML()}
							</td>		
							</tr>
							</g:each>		
							</table>					
				</td>
				</tr>
				</g:if>
			

</table>