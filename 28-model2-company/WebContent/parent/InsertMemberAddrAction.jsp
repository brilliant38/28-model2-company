<!-- 2018-07-03 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Member" %>
<%@ page import = "service.MemberAddr" %>
<%@ page import = "service.MemberAddrDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberInsertAction</title>
	</head>
	<body>
		<% 
			request.setCharacterEncoding("euc-kr"); //�޴� ���� ������ euc-kr�� ���ڵ�
			
			int no = Integer.parseInt(request.getParameter("no"));
			String address = request.getParameter("address");
			System.out.println(no + " : name check");
			System.out.println(address + " : address check");
			//���۵Ǵ� �� üũ
			MemberAddr memberaddr = new MemberAddr(); // Member ��ü ����
			memberaddr.setMemberNo(no);
			memberaddr.setMemberAddrContent(address);
			
			MemberAddrDao memberaddrdao = new MemberAddrDao(); //Memberdao ��ü ����
			memberaddrdao.insertMemberAddr(memberaddr);
			System.out.println("DB�� ȸ�� �ּ� 1���� �߰��Ǿ����ϴ�.");
			
			response.sendRedirect("./MemberList.jsp"); //InsertMemberAddrForm.jsp �������� �����̷�Ʈ
		%>
	</body>
</html>