<!-- 2018-07-02 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Employee" %>
<%@ page import = "service.EmployeeDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberInsertAction</title>
	</head>
	<body>
		<% 
			request.setCharacterEncoding("euc-kr"); //�޴� ���� ������ euc-kr�� ���ڵ�
			
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			System.out.println(name + " : name check");
			System.out.println(age + " : age check");
			//���۵Ǵ� �� üũ
			
			Employee employee = new Employee(); // Member ��ü ����
			employee.setEmployeeName(name);
			employee.setEmployeeAge(age);
			
			EmployeeDao employeedao = new EmployeeDao(); //Memberdao ��ü ����
			int result = employeedao.insertEmployee(employee);
			System.out.println("DB�� ����� �Ѹ��� �߰��Ǿ����ϴ�.");
			
			response.sendRedirect("./InsertEmployeeForm.jsp"); //memberInsert.jsp �������� �����̷�Ʈ
		%>
	</body>
</html>