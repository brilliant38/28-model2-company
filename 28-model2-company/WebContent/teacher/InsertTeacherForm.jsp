<!-- 2018-07-01 ���ؿ� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insert Teacher Form</title>
</head>
<body>
	<form action="./InsertTeacherAction.jsp" method="post" name="f">
		<h2>Teacher ���� �Է�</h2>
		<div>
			�̸� : <input type="text" id="teacherName" name="teacherName" size="10px"> 
			<span id="teacherNameHelper"></span><br>
			���� : <input type="text" id="teacherAge" name="teacherAge" size="10px">
			<span id="teacherAgeHelper"></span><br>
		</div>
		<div>
			<input type="submit" value="�Է�" id="btn">
		</div>
	</form>
	<script type="text/javascript" src="script./teacher/InserteacherOrAddr.js" charset="utf-8"></script>
</body>
</html>