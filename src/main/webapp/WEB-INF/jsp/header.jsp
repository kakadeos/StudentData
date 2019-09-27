<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
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
	
</head>

<style>
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: grey;
  color: white;
  text-align: center;
}

.error {
	color: red;
}
</style>

<body>
<!-- Navbar Started -->
<nav class="navbar  navbar-inverse">
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
				<li><a href="studentform"><spring:message code="header.addStudent" /> <span class="sr-only">(current)</span></a></li>
				<li><a href="viewstud"> <spring:message code="header.viewStudents" /></a></li>
				<li><a href="viewstuddatatable"> <spring:message code="header.viewDataTable" /></a></li>
				<li><a href="uploadFile"> <spring:message code="header.uploadFile" /></a></li>
				<li><a href="viewFiles"> <spring:message code="header.viewServerFile" /></a></li>
				<li><a href="uploadFileToDB"> <spring:message code="header.UploadToDB" /></a></li>
				<li><a href="viewDatabaseFiles"> <spring:message code="header.viewDBFiles" /></a></li>
				<li><a href="uploadFileUsingAJAX"> <spring:message code="header.uploadFileAJAX" /></a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="?language=en"><spring:message code="header.english" /></a></li>
				<li> <a href="?language=hi"><spring:message code="header.hindi" /></a></li>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
		
	</div>
	<!-- /.container-fluid -->
</nav>
<!-- Navbar Ended -->