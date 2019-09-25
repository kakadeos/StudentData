
<!-- Header File Navbar  -->
<%@ include file="header.jsp"%>
<!-- Header File Navbar End -->
<!-- Form Division -->
<div class='container-fluid'>


	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h1>
				<spring:message code="AddNewStudentPage.heading1"
					text="Add New Student" />
			</h1>
			<form:form method="post" action="save" modelAttribute="student">
				<div class="input-group">
					<spring:message code="AddNewStudentPage.name" text="Name" />
					<form:input class="form-control" path="name" />
					<form:errors path="name" cssClass="error" />
				</div>

				<div class="input-group">
					<spring:message code="AddNewStudentPage.standard" text="Standard" />
					<form:input class="form-control" path="standard" />
					<form:errors path="standard" cssClass="error" />
				</div>

				<div class="input-group">
					<spring:message code="AddNewStudentPage.gender" text="Gender" />
					<spring:message code="AddNewStudentPage.male" var="male" />
					<form:radiobutton path="Gender" value="${male}" />${male}
					<spring:message code="AddNewStudentPage.female" var="female" />
					<form:radiobutton path="Gender" value="${female}" />${female}
					<form:errors path="gender" cssClass="error" />
				</div>

				<div class="input-group">
					<spring:message code="AddNewStudentPage.city" text="City" />
					<form:select path="city">
						<spring:message code="AddNewStudentPage.city.gaziabad"
							var="Gaziabad" />
						<form:option value="${Gaziabad}" label="${Gaziabad}" />
						<spring:message code="AddNewStudentPage.city.modinagar"
							var="Modinagar" />
						<form:option value="${Modinagar}" label="${Modinagar}" />
						<spring:message code="AddNewStudentPage.city.meerut" var="Meerut" />
						<form:option value="${Meerut}" label="${Meerut}" />
						<spring:message code="AddNewStudentPage.city.amritsar"
							var="Amritsar" />
						<form:option value="${Amritsar}" label="${Amritsar}" />
					</form:select>
				</div>
				<div class="input-group">
					<spring:message code="AddNewStudentPage.dob" text="Date of Birth" />
					<form:input path="dob" type='date' />
					<form:errors path="dob" cssClass="error" />
				</div>
				<div class="input-group">
					<spring:message code="AddNewStudentPage.smssubscribe"
						text="SMS Subscription" />
					<form:checkbox path="smssubscribe" />
				</div>
				<div class="input-group">
					<spring:message code="AddNewStudentPage.sports" text="Sports" />
					<spring:message code="AddNewStudentPage.cricket" var="Cricket" />
					<form:checkbox path="sports" value="${Cricket}" />${Cricket}
					<spring:message code="AddNewStudentPage.football" var="Football" />
					<form:checkbox path="sports" value="${Football}" />${Football}
					<spring:message code="AddNewStudentPage.hockey" var="Hockey" />
					<form:checkbox path="sports" value="${Hockey}" />${Hockey}
				</div>
				<spring:message code="AddNewStudentPage.save" var="save" />
				<input class="btn btn-primary" type="submit" value="${save }" />
			</form:form>

		</div>
		<div class="col-md-4"></div>
	</div>

</div>

<!-- Footer File -->
<%@ include file="footer.jsp"%>
<!-- Footer File End -->