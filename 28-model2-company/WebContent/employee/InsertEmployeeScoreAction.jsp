<!-- ������ �Ѱܹ��� ��(����,ȸ���ڵ�)�� �޾Ƽ� MemberScore���� InsertMemberScore�޼ҵ带 ȣ���Ͽ� ���� ������ �Է��ϵ��� ����� ������ -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Employee Score Action</title>
	</head>
	<body>
		<%
			EmployeeScore employeeScore = new EmployeeScore();
			employeeScore.setEmployeeNo(Integer.parseInt(request.getParameter("no")));
			employeeScore.setScore(Integer.parseInt(request.getParameter("score")));
			
			EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
			employeeScoreDao.insertEmployeeScore(employeeScore);
			
			response.sendRedirect("./EmployeeList.jsp");
		%>
	</body>
</html>