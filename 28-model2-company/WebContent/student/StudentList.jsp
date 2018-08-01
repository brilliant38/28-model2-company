<!-- 28�� ���ؼ� 2018-07-13 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.StudentDao" %>
<%@ page import = "service.Student" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>studentList</title>
	</head>
	<body>
		
		<%	
			request.setCharacterEncoding("euc-kr");
			int currentPage = 1;
			if(request.getParameter("currentPage") !=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
		
			int pagePerRow = 5;
		
			String searchWord = request.getParameter("searchWord");
			System.out.println(searchWord + " : 01 searchWord check");
			
			if (request.getParameter("searchWord") == null) {
				searchWord = "";
			}
			
			Student student = new Student();
			StudentDao studentDao = new StudentDao();
			ArrayList<Student> list = studentDao.selectStudent(currentPage, pagePerRow);
			System.out.println( student + "<- student Ȯ��");
			System.out.println( studentDao + "<- selectStudentȮ��");
			
			ArrayList<Student> searchList = studentDao.searchStudentList(currentPage, pagePerRow, searchWord);
			System.out.println(searchList + " : 03 searchList check");

			int RowNumber = list.get(0).getRowNumber();
			System.out.println( RowNumber + "<- RowNumberȮ��");
			
			int lastPage = ((RowNumber-1) / pagePerRow) +1; 
			
			if(searchList.size() > 0) {
				RowNumber = searchList.get(0).getRowNumber();
			}
		%>
		<h1>Student List</h1>
		<br>
		<form action="./StudentList.jsp" method="post">
			<div>
				�̸� :
				<input type="text" name="searchWord">
				<button type="submit">�˻�</button>
			</div>
		</form>
			<br><br>
		<table  border="1">
			<tr>
				<th>�л���ȣ</th>
				<th>�л� �̸�</th>
				<th>�л� ����</th>
				<th>�ּ� �Է�</th>
				<th>���� �Է�</th>
				<th>���� ����</th>
				<th>���� </th>
				<th>����</th>
			</tr>
		<%
			if (searchList.size() == 0) {
				for(int i=0; i< list.size(); i++) {
				student =  list.get(i);
		%>
					
					<tr>
						<td><%=student.getStudent_no() %></td> 
						<td><a href="./StudentAddrList.jsp?no=<%=student.getStudent_no()%>"><%=student.getStudent_name()%></a></td>
						<td><%=student.getStudent_age()%></td>
						<td><a href="./InsertStudentAddrForm.jsp">�ּ��߰�</a></td>
						<td><a href="no=<%=student.getStudent_no()%>">���� �Է�</a></td>
						<td><a href="./StudentAndScoreList.jsp?no=<%=student.getStudent_no()%>">���� ����</a></td>
						<td><a href="./UpdateStudentForm.jsp?no=<%=student.getStudent_no() %>">����</a></td>
						<td><a href="./DeleteStudentAction.jsp?no=<%=student.getStudent_no() %>">����</a></td>
					</tr>
		<%
				}
			} else if (searchList.size() > 0) {
				for (int p=0; p<searchList.size(); p++) {
		%>	
					<tr>
						<td><%=searchList.get(p).getStudent_no()%></td>
						<td><a href="./StudentAddrList.jsp?no=<%=searchList.get(p).getStudent_no()%>"><%=searchList.get(p).getStudent_name()%></a></td>
						<td><%=searchList.get(p).getStudent_age()%></td>
						<td><a href="./InsertStudentAddrForm.jsp?no=<%=searchList.get(p).getStudent_no()%>">�ּ� �Է�</a></td>
						<td><a href="./InsertStudentScoreForm.jsp?no=<%=searchList.get(p).getStudent_no()%>">���� �Է�</a></td>
						<td><a href="./StudentScoreList.jsp?no=<%=searchList.get(p).getStudent_no()%>">���� ����</a></td>
						<td><a href="./UpdateStudentForm.jsp?no=<%=searchList.get(p).getStudent_no()%>">����</a></td>
						<td><a href="./DeleteStudentAction.jsp?no=<%=searchList.get(p).getStudent_no()%>">����</a></td>
					</tr>
		<%
				}
			}
		%>
			</table>
			<br>
		<div>
			<a href="./InsertStudentForm.jsp">Student ���� �Է�</a>
		</div>
		<br><br>
		<span><%=currentPage%> / <%=lastPage %></span><br><br>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
				<a href="./StudentList.jsp?currentPage=<%=currentPage-1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
		
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
		%>
				<a href="./StudentList.jsp?currentPage=<%=currentPage+1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			}
		%>
		<br>
		<div>
		<a href = "./index.jsp">����ȭ��</a>
		</div>
		
	</body>
</html>