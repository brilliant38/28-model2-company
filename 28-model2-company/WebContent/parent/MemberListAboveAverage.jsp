<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberListAboveAverage</title>
	</head>
	<body>
		<h3>Member List Above Average</h3>
		<%
			
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //������ Ŭ�� ������ �������� �ѱ��� ������ null�� ó���Ѵ�.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String Ÿ������ �Ѿ�� "currentPage" ������ Ÿ���� int�� ��ȯ�Ͽ� �����Ѵ�.
			}    
			
			int pagePerRow = 5;//�������� ǥ���� ���� ���� ���Ѵ�.
			
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			int scoreAverage = memberScoreDao.selectScoreAverage();
			
			ArrayList<MemberAndScore> list =  memberScoreDao.selectMemberListAboveAverage(currentPage, pagePerRow);
			
		%>
		<div>
			��� : <%=scoreAverage %>
		</div>
		<table border="1">
			<thead>
				<tr>
					<th>Member_No</th>
					<th>Member_Name</th>
					<th>Member_Score</th>
				</tr>
			</thead>
			<tbody>
			<%
				for(int i=0; i<list.size(); i++) {
			%>
					<tr>
						<td><%=list.get(i).getMember().getMemberNo() %></td>
						<td><%=list.get(i).getMember().getMemberName() %></td>
						<td><%=list.get(i).getMemberScore().getScore() %></td>
					</tr>
			<%
				}
			%>
			</tbody>
		</table>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
			<a href="./MemberListAboveAverage.jsp?currentPage=<%=currentPage-1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
			int lastPage = (list.get(0).getMember().getRowNumber()-1) / pagePerRow; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
			
			if ((list.get(0).getMember().getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1�� ���� �������� ���� ������ �������� 1�� �ƴҶ�
				lastPage++;
			}
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
		%>
			<a href="./MemberListAboveAverage.jsp?currentPage=<%=currentPage+1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			} 
		%>
		<br>
		<div>
			<a href = "../index.jsp">����ȭ��</a>
		</div>
	</body>
</html>