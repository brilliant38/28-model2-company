<!-- 2018-07-13 ���ؼ� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertStudentAddrForm</title>
	</head>
	<body>
		<h1>Student Address</h1>
		<br><br><br>
		<form action="./InsertStudentAddrAction.jsp" method="post">
			<table border = "1">
				<tr>
					<td>�ּ� :</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="studentNo" value="<%= request.getParameter("studentNo") %>">
						<input type="submit" value="���">
			</table>
		</form>
			<br>
			<a href="<%= request.getContextPath() %>/StudentList.jsp">StudentList�� �̵�</a>
	</body>
</html>