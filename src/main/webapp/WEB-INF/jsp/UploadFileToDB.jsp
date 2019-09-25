	<!-- Header File Navbar  -->
	<%@ include file = "header.jsp" %>
	<!-- Header File Navbar End -->
	<form:form method="POST" action="uploadFileToDB" enctype="multipart/form-data">
		<spring:message code="uploadFileToDB.selectFile" /> <input type="file" name="file"><br /> 
		<spring:message code="uploadFileToDB.fileName" /> <input type="text" name="name"><br /> <br /> 
		<input type="submit" value="Upload">
		<spring:message code="uploadFileToDB.upload"/>
	</form:form>	
<!-- Footer File -->
	<%@ include file = "footer.jsp" %>
	<!-- Footer File End -->