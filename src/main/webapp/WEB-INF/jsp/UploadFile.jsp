	<!-- Header File Navbar  -->
	<%@ include file = "header.jsp" %>
	<!-- Header File Navbar End -->
	<form:form method="POST" action="uploadFile" enctype="multipart/form-data">
		File to upload: <input type="file" name="file"><br /> 
		Name: <input type="text" name="name"><br /> <br /> 
		<input type="submit" value="Upload"> Press here to upload the file!
	</form:form>	
<!-- Footer File -->
	<%@ include file = "footer.jsp" %>
	<!-- Footer File End -->