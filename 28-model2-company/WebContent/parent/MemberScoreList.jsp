<!-- 2012-07-12 �̱���
MemberList.jsp���� ȸ�� ��ȣ�� �޾� ���� ������ ����ϴ� ������. -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Member Score List</title>
	</head>
	<body>
		<h1>Member Score List</h1>
		<br><br><br>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			ArrayList<MemberAndScore> list = memberScoreDao.selectMemberAndMemberScore(no);
		%>
		
		<table border="1">
			<tr>
				<th>ȸ�� ��ȣ</th>
				<th>ȸ�� �̸�</th>
				<th>����</th>
			</tr>
			<tr>
		<%
			for(int i=0; i<list.size(); i++) {
				
		%>
				<td><%=list.get(i).getMemberScore().getMemberNo() %></td>
				<td><%=list.get(i).getMember().getMemberName()%></td>
				<td><%=list.get(i).getMemberScore().getScore() %></td>
		<%
			}
		%>		
			</tr>
		</table>
		<br>
		<a href="./MemberList.jsp">�������</a>
	</body>
</html>