
<!-- Header File Navbar  -->
<%@ include file="header.jsp"%>
<!-- Header File Navbar End -->

Language :
<a href="?language=en">English</a>
|
<a href="?language=hi">HINDI</a>


<h2>
	<spring:message code="viewPage.heading" text="Student List" />
</h2>
<table border="2" width="100%" cellpadding="2">
	<tr>
		<th><spring:message code="viewPage.id" text="ID" /></th>
		<th><spring:message code="viewPage.name" text="Name" /></th>
		<th><spring:message code="viewPage.standard" text="Standard" /></th>
		<th><spring:message code="viewPage.gender" text="Gender" /></th>
		<th><spring:message code="viewPage.city" text="City" /></th>
		<th><spring:message code="viewPage.dob" text="Date Of Birth" /></th>
		<th><spring:message code="viewPage.smssubscribe"
				text="SMS Subscribe" /></th>
		<th><spring:message code="viewPage.sports" text="Sports" /></th>
		<th><spring:message code="viewPage.edit" text="Edit" /></th>
		<th><spring:message code="viewPage.delete" text="Delete" /></th>
	</tr>
	<c:forEach var="stud" items="${list}">
		<tr>
			<td>${stud.id}</td>
			<td>${stud.name}</td>
			<td>${stud.standard}</td>
			<td>${stud.gender}</td>
			<td>${stud.city }</td>
			<td>${stud.dob}</td>
			<td>${stud.smssubscribe}</td>
			<td><c:forEach var="s" items="${stud.sports}">
					<c:if test="${s != ''}">
						<li>${s}</li>
					</c:if>

				</c:forEach></td>
			<td><a href="studentedit/${stud.id}">Edit</a></td>
			<td><a href="deletestud/${stud.id}">Delete</a></td>
		</tr>
	</c:forEach>
</table>
<br />
<!-- Footer File -->
<%@ include file="footer.jsp"%>
<!-- Footer File End -->