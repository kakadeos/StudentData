
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Project</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"
	integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ"
	crossorigin="anonymous">

<style type="text/css">
.error {
	color: red;
}
</style>
</head>
<body>
	<!-- Navbar Started -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Brand</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="/StudentData/studentform">Add Student <span
							class="sr-only">(current)</span></a></li>
					<li><a href="/StudentData/viewstud">View Students </a></li>
					<li><a href="/StudentData/viewstuddatatable">View
							Students(Data Table Approch) </a></li>
					<li><a href="/StudentData/uploadFile">Upload File </a></li>
					<li><a href="/StudentData/viewFiles">View Server files </a></li>
					<li><a href="/StudentData/uploadFileToDB"> <spring:message
								code="header.UploadToDB" /></a></li>
					<li><a href="/StudentData/viewDatabaseFiles"> <spring:message
								code="header.viewDBFiles" /></a></li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- Navbar Ended -->
	<div class='container-fluid'>

		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<h2>
					<spring:message code="EditStudent.headingPageTop"
						text="Edit Student" />
				</h2>
				<form:form method="POST" action="/StudentData/editsave">
					<form:hidden path="id" />

					<div class="input-group">
						<spring:message code="EditStudent.name" text="Name" />
						<form:input class="form-control" path="name" />
						<form:errors path="name" cssClass="error" />
					</div>

					<div class="input-group">
						<spring:message code="EditStudent.standard" text="Standard" />
						<form:input class="form-control" path="standard" />
						<form:errors path="standard" cssClass="error" />
					</div>

					<div class="input-group">
						<spring:message code="EditStudent.gender" text="Gender" />
						<spring:message code="EditStudent.male" var="male" />
						<form:radiobutton path="Gender" value="Male" />${male}
						<spring:message code="EditStudent.female" var="female" />
						<form:radiobutton path="Gender" value="Female" />${female}
						<form:errors path="gender" cssClass="error" />
					</div>

					<div class="input-group">
						<spring:message code="EditStudent.city" text="City" />
						<form:select path="city">
							<spring:message code="EditStudent.city.gaziabad" var="Gaziabad" />
							<form:option value="Gaziabad" label="${Gaziabad}" />
							<spring:message code="EditStudent.city.modinagar" var="Modinagar" />
							<form:option value="Modinagar" label="${Modinagar}" />
							<spring:message code="EditStudent.city.meerut" var="Meerut" />
							<form:option value="Meerut" label="${Meerut}" />
							<spring:message code="EditStudent.city.amritsar" var="Amritsar" />
							<form:option value="Amritsar" label="${Amritsar}" />
						</form:select>
					</div>

					<div class="input-group">
						<spring:message code="EditStudent.dob" text="Date of Birth" />
						<form:input path="dob" type='date' />
						<form:errors path="dob" cssClass="error" />
					</div>

					<div class="input-group">
						<spring:message code="EditStudent.smssubscribe"
							text="SMS Subscription" />
						<form:checkbox path="smssubscribe" />
					</div>

					<div class="input-group">
						<spring:message code="EditStudent.sports" text="Sports" />
						<spring:message code="EditStudent.cricket" var="Cricket" />
						<form:checkbox path="sports" value="Cricket" />${Cricket}
						<spring:message code="EditStudent.football" var="Football" />
						<form:checkbox path="sports" value="Football" />
						${Football}
						<spring:message code="EditStudent.hockey" var="Hockey" />
						<form:checkbox path="sports" value="Hockey" />${Hockey}
					</div>
					<spring:message code="EditStudent.save" var="save" />
					<input class="btn btn-primary" type="submit" value="${save }" />

				</form:form>

			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

</body>
</html>