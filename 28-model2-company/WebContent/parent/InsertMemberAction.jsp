<!-- 2018-07-02 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Member" %>
<%@ page import = "service.MemberDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberInsertAction</title>
	</head>
	<body>
		<% 
			request.setCharacterEncoding("euc-kr"); //�޴� ���� ������ euc-kr�� ���ڵ�
			
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			System.out.println(name + " : name check");
			System.out.println(age + " : age check");
			//���۵Ǵ� �� üũ
			
			Member member = new Member(); // Member ��ü ����
			member.setMemberName(name);
			member.setMemberAge(age);
			
			MemberDao memberdao = new MemberDao(); //Memberdao ��ü ����
			int result = memberdao.insertMember(member);
			System.out.println("DB�� ȸ�� �Ѹ��� �߰��Ǿ����ϴ�.");
			
			response.sendRedirect("./InsertMemberForm.jsp"); //memberInsert.jsp �������� �����̷�Ʈ
		%>
	</body>
</html>