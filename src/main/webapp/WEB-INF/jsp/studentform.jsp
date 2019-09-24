	<!-- Header File Navbar  -->
	<%@ include file = "header.jsp" %>
	<!-- Header File Navbar End -->
	<!-- Form Division -->
	<div class='container-fluid'>
		<h1>
			<spring:message code="AddNewStudentPage.heading1"
				text="Add New Student" />
		</h1>
		<form:form method="post" action="save" modelAttribute="student">
			<table>
				<tr>
					<div class="input-group">
						<td><spring:message code="AddNewStudentPage.name" text="Name" /></td>
						<td><form:input class="form-control" path="name" /></td>
						<td><form:errors path="name" cssClass="error" /></td>
					</div>
				</tr>
				<tr>
					<div class="input-group">
						<td><spring:message code="AddNewStudentPage.standard"
								text="Standard" /></td>
						<td><form:input class="form-control" path="standard" /></td>
						<td><form:errors path="standard" cssClass="error" /></td>
					</div>
				</tr>
				<tr>
					<td><spring:message code="AddNewStudentPage.gender"
							text="Gender" /></td>
					<td><spring:message code="AddNewStudentPage.male" var="male"/>
						<form:radiobutton path="Gender" value="${male}" />${male} <spring:message
							code="AddNewStudentPage.female" var="female"/> <form:radiobutton
							path="Gender" value="${female}" />${female}</td>
					<td><form:errors path="gender" cssClass="error" /></td>
				</tr>
				<tr>
					<td><spring:message code="AddNewStudentPage.city" text="City" /></td>
					<td><form:select path="city">
							<spring:message code="AddNewStudentPage.city.gaziabad" var="Gaziabad"  />
							<form:option value="${Gaziabad}" label="${Gaziabad}" />
							<spring:message code="AddNewStudentPage.city.modinagar" var="Modinagar"  />
							<form:option value="${Modinagar}" label="${Modinagar}" />
							<spring:message code="AddNewStudentPage.city.meerut" var="Meerut"  />
							<form:option value="${Meerut}" label="${Meerut}"/>
							<spring:message code="AddNewStudentPage.city.amritsar" var="Amritsar"  />
							<form:option value="${Amritsar}" label="${Amritsar}" />
						</form:select></td>
				</tr>
				<tr>
					<td><spring:message code="AddNewStudentPage.dob"
							text="Date of Birth" /></td>
					<td><form:input path="dob" type='date' /></td>
					<td><form:errors path="dob" cssClass="error" /></td>
				</tr>
				<tr>
					<td><spring:message code="AddNewStudentPage.smssubscribe"
							text="SMS Subscription" /></td>
					<td><form:checkbox path="smssubscribe" />
				</tr>
				<tr>
					<td><spring:message code="AddNewStudentPage.sports"
							text="Sports" /></td>
					<td>
					<spring:message code="AddNewStudentPage.cricket" var="Cricket" /> 
					<form:checkbox path="sports" value="${Cricket}" />${Cricket}
					<spring:message code="AddNewStudentPage.football" var="Football" />
					<form:checkbox path="sports" value="${Football}" /> ${Football}
					<spring:message code="AddNewStudentPage.hockey" var="Hockey" /> 
					<form:checkbox path="sports" value="${Hockey}" />${Hockey}
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
					<spring:message code="AddNewStudentPage.save" var="save" /> 
					<input class="btn btn-primary" type="submit" value="${save }" /></td>
				</tr>
			</table>
		</form:form>
	</div>

<!-- Footer File -->
	<%@ include file = "footer.jsp" %>
	<!-- Footer File End -->