<!-- 2018.07.10 ���ؿ�-->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher Score List</title>
	</head>
	<body>
	
	
				<%
					// TeacherScoreDao ��ü ����
					TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
				
					// teacherList.jsp�� ���� ���� ���� teacherNo ���� ������ ����
					int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
					
					// teacherNo ���� ���� ���� �׽�Ʈ
					System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
					
					// selectTeacherAddress �޼��带 ȣ���ϰ� ���Ϲ��� TeacherAddr��ü�� ���� ���� teacherAddr ��ü ���������� ���� 
					TeacherAndScore teacherAndTeacherScore = teacherScoreDao.selectTeacherAndTeacherScore(teacherNo);		
				%>
				<h1>Teacher Score List</h1>
				<br><br><br>
				<table id="entityListTable" border="1">
					<thead>
						<tr>
							<th>���� ��ȣ</th>
							<th>���� �̸�</th>
							<th>����</th>
							<th>����</th>
						</tr>
					</thead>
					<tr>
						<td><%= teacherAndTeacherScore.getTeacher().getTeacherNo() %></td>
						<td><%= teacherAndTeacherScore.getTeacher().getTeacherName() %></td>
						<td><%= teacherAndTeacherScore.getTeacherScore().getScore() %></td>
						<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>./teacher/UpdateTeacherScoreForm.jsp?teacherNo=<%= teacherAndTeacherScore.getTeacher().getTeacherNo() %>">������ư</a>
					</tr>
				</table>
				<br>
			
					<a id="buttonToList" href="<%= request.getContextPath() %>./teacher/TeacherList.jsp">�������</a>
				
	
	</body>
</html>