<!-- Header File Navbar  -->
<%@ include file="header.jsp"%>
<!-- Header File Navbar End -->


<h2>
	<spring:message code="viewFiles.heading" />
</h2>
<table border="2" width="100%" cellpadding="2">
	<tr>
		<th><spring:message code="viewFiles.fileName" /></th>
		<th><spring:message code="viewFiles.filePreview" /></th>
		<th><spring:message code="viewFiles.download" /></th>
	</tr>
	<c:forEach var="fileName" items="${fileList}">
		<tr>
			<td>${fileName}</td>
			<td><img alt="No Image found"
				src="<spring:url value='/upload_images/${fileName}'/>" height="100"
				width="100"></td>
			<td><a href='downloadFile/${fileName}' download> <spring:message
						code="viewFiles.clickHere"></spring:message>
			</a></td>
		</tr>
	</c:forEach>
</table>



<!-- Footer File -->
<%@ include file="footer.jsp"%>
<!-- Footer File End -->