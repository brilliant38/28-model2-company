<!--  28�� ���ؼ�  2018-07-13 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@page import="service.StudentScoreDao"%>
<%@page import="service.Student"%>
<%@page import="service.StudentDao"%>
<%@page import="service.StudentAndScore" %>
<%@page import="java.util.ArrayList"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>StudentrListAboveAvg</h3>
	<%
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int PagePerRow = 5;
		
		StudentScoreDao studentScoreDao = new StudentScoreDao();
		int scoreAvg = studentScoreDao.selectScoreAvg();
		System.out.println(scoreAvg + "<-scoreAvg");
		
		ArrayList<StudentAndScore> list =  studentScoreDao.selectStudentListAboveAvg(currentPage, PagePerRow);
		
		int lastPage = (list.get(0).getStudent().getRowNumber()-1) / PagePerRow; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
		
	%>
	<div>
		��� : <%=scoreAvg %>
	</div>
		<table border ="1">
			<thead>
				<tr>
					<th>STUDENT_NO</th>
					<th>STUDENT_NAME</th>
					<th>STUDENT_SCORE</th>
				</tr>
			</thead>
		<tbody>
			<%
				for(int i=0; i<list.size();i++) {
					
			%>
					<tr>
						<td><%=list.get(i).getStudent().getStudent_no()%></td>
						<td><%=list.get(i).getStudent().getStudent_name()%></td>
						<td><%=list.get(i).getStudentScore().getScore()%></td>
					</tr>
				<% 
				}
				%>
		</tbody>
		</table>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
			<a href="./StudentListAboveAverage.jsp?currentPage=<%=currentPage-1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
			
			if ((list.get(0).getStudent().getRowNumber()-1) % PagePerRow !=0) { // rowNumber-1�� ���� �������� ���� ������ �������� 1�� �ƴҶ�
				lastPage++;
			}
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
		%>
			<a href="./StudentListAboveAverage.jsp?currentPage=<%=currentPage+1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			} 
		%>
		<br><br>
		<a href = "./index.jsp">����ȭ��</a>
</body>
</html>