<!-- ������ �Ѱܹ��� ��(����,ȸ���ڵ�)�� �޾Ƽ� MemberScore���� InsertMemberScore�޼ҵ带 ȣ���Ͽ� ���� ������ �Է��ϵ��� ����� ������ -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Member Score Action</title>
	</head>
	<body>
		<%
			MemberScore memberScore = new MemberScore();
			memberScore.setMemberNo(Integer.parseInt(request.getParameter("no")));
			memberScore.setScore(Integer.parseInt(request.getParameter("score")));
			
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			memberScoreDao.insertMemberScore(memberScore);
			
			response.sendRedirect("./MemberList.jsp");
		%>
	</body>
</html>