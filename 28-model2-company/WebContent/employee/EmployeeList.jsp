<!-- 2018-07-11 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployeeDao"%>
<%@ page import = "service.Employee" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>EmployeeList</title>
	</head>
	<body>
		<h1>Employee List</h1>
		<br>
		<form action="./EmployeeList.jsp" method="post">
			<div>
				�̸� :
				<input type="text" name="searchWord">
				<button type="submit">�˻�</button>
			</div>
		</form>
		<br><br>
		<table border="1">
			<tr>
				<th>���� ��ȣ</th>
				<th>���� �̸�</th>
				<th>���� ����</th>
				<th>�ּ� �Է�</th>
				<th>���� �Է�</th>
				<th>���� ����</th>
				<th>����</th>
				<th>����</th>
			</tr>
			
		<%
	        
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { 
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String Ÿ������ �Ѿ�� "currentPage" ������ Ÿ���� int�� ��ȯ�Ͽ� �����Ѵ�.
			}    
			
			int pagePerRow = 5;
			
			EmployeeDao employeeDao = new EmployeeDao();
			ArrayList<Employee> list = employeeDao.selectEmployeeByPage(currentPage, pagePerRow);
			System.out.println(list + " : 01 list check");
			
			int rowNumber = employeeDao.selectRowNumber();
			/*	������ �������� ��ȣ ���ϱ�(�������� �� ������ �� ���� ���� -1���� �������� ������ ���� ���� ���� �򿡴ٰ� 1�� ���Ѵ�.)
				��) (�� �� ���� (25 - 1) / �������� ������ ���Ǽ� 5 = 5) +1 = ������ �������� ��ȣ�� 5 --> �� ������ PPR�� �� ������ ������ ��
				��) (�� �� ���� (27 - 1) / �������� ������ ���Ǽ� 5 = 5) +1 = ������ �������� ��ȣ�� 6 --> �� ������ PPR�� �� ������ �������� ���� ��
			*/
			int lastPage = ((rowNumber - 1) / pagePerRow) + 1 ;
			System.out.println(rowNumber + " : rowNumber called");
			System.out.println(pagePerRow + " : pagePerRow called");
			System.out.println(lastPage + " : lastPage called");
			
			for(int i=0; i<list.size(); i++) {
		%>
				<tr>
					<td><%=list.get(i).getEmployeeNo()%></td>
					<td><a href="./EmployeeAddrList.jsp?no=<%=list.get(i).getEmployeeNo()%>"><%=list.get(i).getEmployeeName()%></a></td>
					<td><%=list.get(i).getEmployeeAge()%></td>
					<td><a href="./InsertEmployeeAddrForm.jsp?no=<%=list.get(i).getEmployeeNo()%>">�ּ� �Է�</a></td>
					<td><a href="./InsertEmployeeScoreForm.jsp?no=<%=list.get(i).getEmployeeNo()%>">���� �Է�</a></td>
					<td><a href="./EmployeeScoreList.jsp?no=<%=list.get(i).getEmployeeNo() %>">���� ����</a></td>
					<td><a href="./UpdateEmployeeForm.jsp?no=<%=list.get(i).getEmployeeNo()%>">����</a></td>
					<td><a href="./DeleteEmployeeAction.jsp?no=<%=list.get(i).getEmployeeNo()%>">����</a></td>
				</tr>
		<%
			}
		%>
		</table>
		<br>
		<div>
			<a href="./InsertEmployeeForm.jsp">Employee ���� �Է�</a>
		</div>
		<br><br>
		<span><%=currentPage%> / <%=lastPage %></span><br><br>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
			<a href="./EmployeeList.jsp?currentPage=<%=currentPage-1%>">&lt; ���� </a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
 			
			if(currentPage<lastPage) { /* ���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����. */
		%>
				<a href="./EmployeeList.jsp?currentPage=<%=currentPage+1%>">���� &gt;</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			} 
		%>
		<br>
		<a href = "../index.jsp">����ȭ��</a>
	</body>
</html>