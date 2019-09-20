<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8" />
<title>Spring Boot + JPA + Datatables</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/datatable.js"></script> --%>
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
					<li><a href="studentform">Add Student <span
							class="sr-only">(current)</span></a></li>
					<li><a href="viewstud">View Students </a></li>
					<li><a href="viewstuddatatable">View Students(Data Table
							Approch) </a></li>
					<li><a href="uploadFile">Upload File </a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<h1>Student Table</h1>
	<table id="StudentTable" class="display">
		<!-- Header Table -->
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Standard</th>
				<th>Gender</th>
				<th>City</th>
				<th>Date of Birth</th>
				<th>SMS Service</th>
			</tr>
		</thead>
		<!-- BODY -->


		<!-- Footer Table -->
		<tfoot>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Standard</th>
				<th>Gender</th>
				<th>City</th>
				<th>Date of Birth</th>
				<th>SMS Service</th>
			</tr>
		</tfoot>
	</table>
	<script type="text/javascript">
		$(document).ready(function() {
			var data = eval('${studentList}');
			var table = $('#StudentTable').DataTable({
				"aaData" : data,
				"aoColumns" : [ {
					"mData" : "id"
				}, {
					"mData" : "name"
				}, {
					"mData" : "standard"
				}, {
					"mData" : "gender"
				}, {
					"mData" : "city"
				}, {
					"mData" : "dob"
				}, {
					"mData" : "smssubscribe"
				} ],
				"paging" : false
			});
		});
	</script>
</body>
</html>
