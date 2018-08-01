<!-- 2018-07-11 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployeeScoreDao" %>
<%@ page import = "service.EmployeeAndScore" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>EmployeeListAboveAverage</title>
	</head>
	<body>
		<h3>Employee List Above Average</h3>
		<%	
			request.setCharacterEncoding("euc-kr");
			String searchWord = request.getParameter("searchWord");
			if (searchWord == null) {
				searchWord = "";
			}
			
			EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
			int AverageScore = employeeScoreDao.averageScore();
			
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int pagePerRow = 3;
			
			ArrayList<EmployeeAndScore> list = employeeScoreDao.selectEmployeeAndScored(currentPage, pagePerRow, searchWord);
		%>
		<div>
			��� : <%=AverageScore %>
		</div>
		<table border="1">
			<thead>
				<tr>
					<th>Employee_No</th>
					<th>Employee_Name</th>
					<th>Employee_Score</th>
				</tr>
			</thead>
			<%
				for(int i=0; i<list.size(); i++) {
			%>
					<tr>
						<td><%=list.get(i).getEmployeeScore().getEmployeeNo() %></td>
						<td><%=list.get(i).getEmployee().getEmployeeName() %></td>
						<td><%=list.get(i).getEmployeeScore().getScore() %></td>
					</tr>
			<% 
				}
			%>
		</table>
		<%
			if(currentPage > 1) {
		%>
				<a href="./EmployeeListAboveAverage.jsp?currentPage=<%=currentPage-1 %>">����</a>
		<%
			}
			// ������ �������� ���� ����. ex) ���� ������ 53���϶� �������� ������ ���� ������ 5����� ������ �������� ���ڴ� 
			int lastPage = ((list.get(0).getEmployee().getRowNumber() - 1) / pagePerRow) + 1 ; 
			System.out.println(lastPage + ": ������ �������� ����");
			
			if (list.get(0).getEmployee().getRowNumber() % pagePerRow != 0) {
				lastPage++;
			}
			if(currentPage<lastPage) {
		%>
				<a href="./EmployeeListAboveAverage.jsp?currentPage=<%=currentPage+1 %>">����</a>
		<%		
			}
		%>
		<br><br>
		<div>
			<a href = "../index.jsp">����ȭ��</a>
		</div>
	</body>
</html>


























