
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
			<form:form method="post" action="leStudentData" modelAttribute="student">
				<div class="input-group">
					<spring:message code="AddNewStudentPage.name" text="Name" />
					<form:input class="form-control" path="name" value="omkar"/>
					<form:errors path="name" cssClass="error" />
				</div>

				<div class="input-group">
					<spring:message code="AddNewStudentPage.standard" text="Standard" />
					<form:input class="form-control" path="standard" value="Director" />
					<form:errors path="standard" cssClass="error" />
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