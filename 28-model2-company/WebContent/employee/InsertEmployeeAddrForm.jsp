<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Employee Addr Form</title>
	</head>
	<body>
	<h1>Employee Address</h1>
		<br><br><br>
		<form action="./InsertEmployeeAddrAction.jsp" method="post">
			<table border="1">
				<tr>
					<td>�ּ� : </td>
					<td><input type="text" name="address" size="17"></td>
				</tr>
								<tr>
					<td colspan="2">
						<input type="hidden" name="no" size="17" value="<%=request.getParameter("no")%>" readonly>
						<input type="submit" value="���">
					</td>
				</tr>
			</table>
		</form>
		<br>
		<a href="./EmployeeList.jsp">EmployeeList�� �̵�</a>
	</body>
</html>