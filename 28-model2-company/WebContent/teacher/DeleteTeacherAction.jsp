<!-- *2018-07-12 ���ؿ�* -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>DeleteTeacherAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo")); //List ���������� �Ѿ�� ȸ�� ��ȣ ����
			
			TeacherDao teacherdao = new TeacherDao();
			teacherdao.deleteTeacher(teacherNo); // ȸ����ȣ �Է��Ͽ� ȸ�� ���� �� 1�� ���� �޼ҵ� ȣ��
			
			response.sendRedirect("./teacher/TeacherList.jsp"); // List �������� ����
		%>
	</body>
</html>