<!-- 2018-07-03 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertEmployeeForm</title>
	</head>
	<body>
		<form action="./InsertEmployeeAction.jsp" method="post">
			<h2>Employee ���� �Է�</h2>
			<div>
				�̸� : <input type="text" name="name" size="10px">
				<br>
				���� : <input type="text" name="age" size="10px">
				<br>
			</div>
			<div>
				<input type="submit" value="�Է�">
			</div>
		</form>
		<br>
		<a href = "./EmployeeList.jsp">�������</a>
	</body>
</html>