<!--2018-07-12 �̱��� -->
<!--MemberList.jsp���������� �����Է� ��ũ�� Ŭ���ϸ�, �����ӷ� ����� ��µǸ鼭 ���� Action�������� �ѱ�� �� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Member Score</title>
	</head>
	<body>
		<h1>Member Score</h1>
		<br><br><br>
		<%
			Member member = new Member();
			member.setMemberNo(Integer.parseInt(request.getParameter("no")));
			
		%>
		<form action="./InsertMemberScoreAction.jsp" method="post">
			<table border="1">
				<tr>
					<td>���� : </td>
					<td><input type="text" name="score"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="no" value="<%= member.getMemberNo() %>">
						<input type="submit" value="���">
					</td>
				</tr>
			</table>
		</form>
		<br>
		<a href="./MemberList.jsp">MemberList�� �̵�</a>
	</body>
</html>