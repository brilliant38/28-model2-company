<!-- 2018-07-12 ���ؿ� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Score Form</title>
		
	</head>
	<body>
	
				<%
					// teacherScoreList.jsp�� ���� �Ѱܹ��� teacherNo ���� ������ ���� �� �׽�Ʈ
					int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
					System.out.println("teacherNo from teacherScoreList.jsp : " + teacherNo);
					
					// Ư�� �޼��带 ȣ���ϱ� ���� teacherScoreDao ��ü ����
					TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
					
					// selectTeacherAndTeacherScore �޼��带 ȣ���ϰ� teacherAndTeacherScore ��ü�� �������� ���� �޾� ������ ����.
					TeacherAndScore teacherAndTeacherScore = teacherScoreDao.selectTeacherAndTeacherScore(teacherNo);
				%>
				<h1>Update TeacherScore</h1>
				<form action="<%= request.getContextPath() %>./teacher/UpdateTeacherScoreAction.jsp" method="post"> 
					<table border="1">
						<tr>
							<td>���� ��ȣ : </td>
							<td><input type="text" name="teacherNo" value="<%= teacherAndTeacherScore.getTeacher().getTeacherNo() %>" readonly>
						</tr>
						<tr>
							<td>���� �̸� : </td>
							<td><input type="text" name="teacherName" value="<%= teacherAndTeacherScore.getTeacher().getTeacherName() %>" readonly>
						</tr>
						<tr>
							<td>���� ���� : </td>
							<td><input type="text" name="teacherScore" value="<%= teacherAndTeacherScore.getTeacherScore().getScore() %>">
						</tr>
						<tr>
							<td colspan="2"><button>����</button></td>
						</tr>
					</table>
				</form>
		
	</body>
</html>