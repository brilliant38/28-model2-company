<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployeeDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>DeleteEmployeeAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			int employeeNo = Integer.parseInt(request.getParameter("no")); //List ���������� �Ѿ�� ȸ�� ��ȣ ����
			
			EmployeeDao employeeDao = new EmployeeDao();
			employeeDao.deleteEmployee(employeeNo); // ȸ����ȣ �Է��Ͽ� ȸ�� ���� �� 1�� ���� �޼ҵ� ȣ��
			
			response.sendRedirect("./EmployeeList.jsp"); // List �������� ����
		%>
	</body>
</html>