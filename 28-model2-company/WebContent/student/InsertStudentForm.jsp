<!-- 2018-07-13 ���ؼ� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�л� insert ȭ��</title>
	</head>
	<body>
		<form action="./InsertStudentAction.jsp" method="post">
			<h2>Student ���� �Է�</h2>
			<div>
				�̸� : <input type="text" id="studentName" name="studentName" size="10px"> 
				<span id="teacherNameHelper"></span><br>
				���� : <input type="text" id="studentAge" name="studentAge" size="10px">
				<span id="teacherAgeHelper"></span><br>
			</div>
			<div>
			<input type="submit" value="�Է�" id="btn">
			</div>
		</form>
		<script type="text/javascript" src="script/InserteacherOrAddr.js" charset="utf-8"></script>
	</body>
</html>