<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Employee" %>
<%@ page import = "service.EmployeeAddr" %>
<%@ page import = "service.EmployeeAddrDao" %>
<!DOCTYPE html>
	<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>InsertEmployeeAddrAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr"); //�޴� ���� ������ euc-kr�� ���ڵ�
			
			int no = Integer.parseInt(request.getParameter("no"));
			String address = request.getParameter("address");
			System.out.println(no + " : name check");
			System.out.println(address + " : address check");
			
			//���۵Ǵ� �� üũ
			EmployeeAddr employeeAddr = new EmployeeAddr(); // Member ��ü ����
			employeeAddr.setEmployeeNo(no);
			employeeAddr.setEmployeeAddrContent(address);
			
			EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao(); //Memberdao ��ü ����
			employeeAddrDao.insertEmployeeAddr(employeeAddr);
			System.out.println("DB�� ���� �ּ� 1���� �߰��Ǿ����ϴ�.");
			
			response.sendRedirect("./EmployeeList.jsp"); //InsertMemberAddrForm.jsp �������� �����̷�Ʈ
		%>
	</body>
</html>