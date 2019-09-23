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
	<!-- Header File Navbar  -->
	<%@ include file = "header.jsp" %>
	<!-- Header File Navbar End -->
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
