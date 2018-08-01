<!-- 2012-07-13 �̱���-->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Employee Score List</title>
	</head>
	<body>
		<h1>Employee Score List</h1>
		<br><br><br>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			
			EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
			ArrayList<EmployeeAndScore> list = employeeScoreDao.selectEmployeeAndEmployeeScore(no);
		%>
		
		<table border="1">
			<tr>
				<th>���� ��ȣ</th>
				<th>���� �̸�</th>
				<th>����</th>
			</tr>
			<tr>
		<%
			for(int i=0; i<list.size(); i++) {
				
		%>
				<td><%=list.get(i).getEmployeeScore().getEmployeeNo() %></td>
				<td><%=list.get(i).getEmployee().getEmployeeName()%></td>
				<td><%=list.get(i).getEmployeeScore().getScore() %></td>
		<%
			}
		%>		
			</tr>
		</table>
		<br>
		<a href="./EmployeeList.jsp">�������</a>
	</body>
</html>