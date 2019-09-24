<head>
<meta charset="utf-8" />
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
	<%@ include file="header.jsp"%>
	<!-- Header File Navbar End -->
	<h1><spring:message code="dataTable.studentTable" /></h1>
	<table id="StudentTable" class="display">
		<!-- Header Table -->
		<thead>
			<tr>
				<th><spring:message code="dataTable.id" /></th>
				<th><spring:message code="dataTable.name" /></th>
				<th><spring:message code="dataTable.standard" /></th>
				<th><spring:message code="dataTable.gender" /></th>
				<th><spring:message code="dataTable.city" /></th>
				<th><spring:message code="dataTable.dob" /></th>
				<th><spring:message code="dataTable.smssubscribe" /></th>
			</tr>
		</thead>
		<!-- BODY -->


		<!-- Footer Table -->
		<tfoot>
			<tr>
				<th><spring:message code="dataTable.id" /></th>
				<th><spring:message code="dataTable.name" /></th>
				<th><spring:message code="dataTable.standard" /></th>
				<th><spring:message code="dataTable.gender" /></th>
				<th><spring:message code="dataTable.city" /></th>
				<th><spring:message code="dataTable.dob" /></th>
				<th><spring:message code="dataTable.smssubscribe" /></th>
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

	<!-- Footer File -->
	<%@ include file="footer.jsp"%>
	<!-- Footer File End -->