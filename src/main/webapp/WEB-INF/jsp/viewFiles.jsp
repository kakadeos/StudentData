	<!-- Header File Navbar  -->
	<%@ include file = "header.jsp" %>
	<!-- Header File Navbar End -->
	
	<table border="2" width="100%" cellpadding="2">
		<tr>
			<th>File Name</th>
			<th>File Preview</th>
			<th>Download</th>
		</tr>
		<c:forEach var="fileName" items="${fileList}">
			<tr>
				<td>${fileName}</td>
				<td><img alt="No Image found"
					src="<spring:url value='/upload_images/${fileName}'/>" height="100"
					width="100"></td>
				<td><a href='downloadFile/${fileName}' download>Click Here</a></td>
			</tr>
		</c:forEach>
	</table>
<!-- Footer File -->
	<%@ include file = "footer.jsp" %>
	<!-- Footer File End -->