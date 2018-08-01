<!-- 2018.07.10 ���ؿ�-->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>TeacherListAboveAverage</title>
		</head>
	<body>
		<h3>TeacherListAboveAverage</h3>
		<%
			
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //������ Ŭ�� ������ �������� �ѱ��� ������ null�� ó���Ѵ�.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String Ÿ������ �Ѿ�� "currentPage" ������ Ÿ���� int�� ��ȯ�Ͽ� �����Ѵ�.
			}    
			
			int pagePerRow = 5;//�������� ǥ���� ���� ���� ���Ѵ�.
			
			TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
			int scoreAverage =teacherScoreDao.selectScoreAverage();
			
			ArrayList<TeacherAndScore> list =  teacherScoreDao.selectTeacherListAboveAverage(currentPage, pagePerRow);
			
		%>
		<div>
			��� : <%=scoreAverage %>
		</div>
		<table  border="1">
			<thead>
			<tr>
				<th>Teacher_No</th>
				<th>Teacher_Name</th>
				<th>Teacher_Score</th>
			</tr>	
			</thead>
			<tbody>
			<%
				for(int i=0; i<list.size(); i++) {
			%>
					<tr>
						<td><%=list.get(i).getTeacher().getTeacherNo() %></td>
						<td><%=list.get(i).getTeacher().getTeacherName() %></td>
						<td><%=list.get(i).getTeacherScore().getScore() %></td>
					</tr>
			<%
				}
			%>
			</tbody>
		</table>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
			<a href="./teacher/TeacherListAboveAverage.jsp?currentPage=<%=currentPage-1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
			int lastPage = (list.get(0).getTeacher().getRowNumber()-1) / pagePerRow; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
			
			if ((list.get(0).getTeacher().getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1�� ���� �������� ���� ������ �������� 1�� �ƴҶ�
				lastPage++;
			}
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
		%>
			<a href="./teacher/TeacherListAboveAverage.jsp?currentPage=<%=currentPage+1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			} 
		%>
		<br><br>
		<a href = "./index.jsp">����ȭ������..</a>
	</body>
</html>