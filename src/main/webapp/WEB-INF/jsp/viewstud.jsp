
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
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
</head>
<body>
	<!-- Navbar Started -->
	<nav class="navbar navbar-default">
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
					<li><a href="studentform">Add Student <span class="sr-only">(current)</span></a></li>
					<li><a href="viewstud">View Students </a></li>
					<li><a href="viewstuddatatable">View Students(Data Table Approch) </a></li>
					<li><a href="uploadFile">Upload File </a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- Navbar Ended -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- Navbar Ended -->

	Language :
	<a href="?language=en">English</a>|
	<a href="?language=hi">HINDI</a>


	<h2>
		<spring:message code="viewPage.heading" text="Student List"/>
	</h2>
	<table border="2" width="100%" cellpadding="2">
		<tr>
			<th><spring:message code="viewPage.id" text="ID"/></th>
			<th><spring:message code="viewPage.name" text="Name"/></th>
			<th><spring:message code="viewPage.standard" text="Standard"/></th>
			<th><spring:message code="viewPage.gender" text="Gender"/></th>
			<th><spring:message code="viewPage.city" text="City"/></th>
			<th><spring:message code="viewPage.dob" text="Date Of Birth"/></th>
			<th><spring:message code="viewPage.smssubscribe" text="SMS Subscribe"/></th>
			<th><spring:message code="viewPage.sports" text="Sports"/></th>
			<th><spring:message code="viewPage.edit" text="Edit"/></th>
			<th><spring:message code="viewPage.delete" text="Delete"/></th>
		</tr>
		<c:forEach var="stud" items="${list}">
			<tr>
				<td>${stud.id}</td>
				<td>${stud.name}</td>
				<td>${stud.standard}</td>
				<td>${stud.gender}</td>
				<td>${stud.city }</td>
				<td>${stud.dob}</td>
				<td>${stud.smssubscribe}</td>
				<td><c:forEach var="s" items="${stud.sports}">
						<c:if test="${s != ''}">
							<li>${s}</li>
						</c:if>

					</c:forEach></td>
				<td><a href="studentedit/${stud.id}">Edit</a></td>
				<td><a href="deletestud/${stud.id}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
</body>
</html>