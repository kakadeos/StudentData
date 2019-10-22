
<!-- Header File Navbar  -->
<%@ include file="header.jsp"%>
<!-- Header File Navbar End -->

<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<h6 style="color: green">${message}</h6>
		<form:form method="POST" action="uploadFile?${_csrf.parameterName}=${_csrf.token}"
			enctype="multipart/form-data">
			<spring:message code="uploadFileToServer.selectFile" />
			<input type="file" name="file">
			<br />
			<spring:message code="uploadFileToServer.fileName" />
			<input type="text" name="name">
			<br />
			<br />
			<input type="submit" value="Upload">
			<spring:message code="uploadFileToServer.upload" />
		</form:form>
	</div>
	<div class="col-md-4"></div>
</div>

<!-- Footer File -->
<%@ include file="footer.jsp"%>
<!-- Footer File End -->