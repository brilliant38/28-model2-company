<!-- 2018-07-03 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertMemberForm</title>
	</head>
	<body>
		<form action="./InsertMemberAction.jsp" method="post">
			<h2>Member ���� �Է�</h2>
			<div>
				�̸� : <input type="text" name="name" size="10px"> 
				<br>
				���� : <input type="text" name="age" size="10px">
				<br>
			</div>
			<div>
				<input type="submit" value="�Է�" id="btn">
			</div>
		</form>
		<br>
		<a href = "./MemberList.jsp">�������</a>
	</body>
</html>