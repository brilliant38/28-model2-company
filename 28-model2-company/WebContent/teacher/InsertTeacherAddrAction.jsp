<!-- 2018.07.09 ���ؿ�-->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Teacher Address Action</title>
	</head>
	<body>
		<%
			// ���ڵ� ��� ����
			request.setCharacterEncoding("euc-kr");
		
			//TeacherAddr, TeacherAddrDao ��ü ���� 
			TeacherAddr teacherAddr = new TeacherAddr();
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			
			// insertTeacherAddrForm.jsp�� ���� �޾ƿ� teacherNo, teacherAddressContent���� ������ ������ ����
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			String teacherAddressContent = request.getParameter("teacherAddressContent");
			
			// teacherNo ���� ���� ���� �׽�Ʈ
			System.out.println("teacherNo, InsertTeacherAddrForm.jsp = > InsertTeacherAddrAction.jsp : " + teacherNo);
			System.out.println("teacherAddressContent, InsertTeacherAddrForm.jsp = > InsertTeacherAddrAction.jsp : " + teacherAddressContent);
			
			// teacherAddr ��ü ������ ��� ������ ������ ���� ����
			teacherAddr.setTeacherNo(teacherNo);
			teacherAddr.setTeacherAddrContent(teacherAddressContent);
			
			// insertTeacherAddress �޼��带 ���� ���ڵ� ����
			teacherAddrDao.insertTeacherAddress(teacherAddr);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "./teacher/TeacherAddrList.jsp?teacherNo=" + teacherNo);
		%>
	</body>
</html>