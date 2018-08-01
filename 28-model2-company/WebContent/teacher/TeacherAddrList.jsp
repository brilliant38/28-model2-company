<!-- 2018.07.09 ���ؿ�-->


<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

		<title>Teacher Address List</title>		
	</head>
	<body>
			<%
					// TeacherAddrDao ��ü ����
					TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
					
					// teacherList.jsp�� ���� ���� ���� teacherNo ���� ������ ����
					int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
					
					// teacherNo ���� ���� ���� �׽�Ʈ
					System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
						
					// selectTeacherAddress �޼��带 ȣ���ϰ� ���Ϲ��� TeacherAddr��ü�� ���� ���� teacherAddr ��ü ���������� ���� 
					ArrayList<TeacherAddr> arrayListTeacherAddr = teacherAddrDao.selectTeacherAddress(teacherNo);		
				%>
				<h1>Teacher Address</h1>
				<br><br><br>
				<table id="entityListTable" border="1" >
					<thead>
						<tr>
							<th style="width:70px">�ּ� ��ȣ</th>
							<th>���� ��ȣ</th>
							<th>���� �ּ�</th>
					
						</tr>
					</thead>
						<%
							System.out.println(arrayListTeacherAddr.size() + "<== size");
							for(int i = 0; i < arrayListTeacherAddr.size(); i++){
						%>
							<tr>
								<td><%= arrayListTeacherAddr.get(i).getTeacherAddrNo() %></td>
							<td><%= arrayListTeacherAddr.get(i).getTeacherNo() %></td>
							<td><%= arrayListTeacherAddr.get(i).getTeacherAddrContent() %></td>

						</tr>
					<%
						}
					%>
				</table>
				<br>
				
					<a id="buttonToList" href="<%= request.getContextPath() %>./teacher/TeacherList.jsp">�������</a>
		
	</body>
</html>