<!-- 2018-07-03 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>DeleteMemberAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			int memberNo = Integer.parseInt(request.getParameter("no")); //List ���������� �Ѿ�� ȸ�� ��ȣ ����
			
			MemberDao memberdao = new MemberDao();
			memberdao.deleteMember(memberNo); // ȸ����ȣ �Է��Ͽ� ȸ�� ���� �� 1�� ���� �޼ҵ� ȣ��
			
			response.sendRedirect("./MemberList.jsp"); // List �������� ����
		%>
	</body>
</html>