<!-- Header File Navbar  -->
<%@ include file="header.jsp"%>
<!-- Header File Navbar End -->
<h2>
	<spring:message code="viewDBFiles.heading" text="DB File List" />
</h2>
<table border="2" width="100%" cellpadding="2">
	<tr>
		<th><spring:message code="viewDBFiles.id" text="ID" /></th>
		<th><spring:message code="viewDBFiles.filename" text="File Name" /></th>
		<th><spring:message code="viewDBFiles.filecontenttype" text="File Type" /></th>
		<th><spring:message code="viewDBFiles.download" text="Download" /></th>
	</tr>
	<c:forEach var="file" items="${list}">
		<tr>
			<td>${file.id}</td>
			<td>${file.fileName}</td>
			<td>${file.fileContentType}</td>
			<td><a href="downloadFile/${file.id}">
				<spring:message code="viewDBFiles.clickhere" text="Click Here"/>
			</a></td>
		</tr>
	</c:forEach>
</table>
<br />
<!-- Footer File -->
<%@ include file="footer.jsp"%>
<!-- Footer File End -->