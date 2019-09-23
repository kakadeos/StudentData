<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>

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
	<!-- Header File Navbar  -->
	<%@ include file = "header.jsp" %>
	<!-- Header File Navbar End -->
	
	<table>
		<tr>
			<th>File Name</th>
			<th>File Preview</th>
			<th>Download</th>
		</tr>
		<c:forEach var="fileName" items="${fileList}">
			<tr>
				<c:out value="${fileName}"/>
				<td>${fileName}</td>
				<td><img alt="No Image found"
					src="<spring:url value='/upload_images/${fileName}'/>" height="100"
					width="100"></td>
				<td><a href='downloadFile/${fileName}' download>Click Here</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>