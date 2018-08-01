<!-- 2018.07.10 ���ؿ�-->


<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		
		<title>Teacher List</title>
	</head>
	<body>
		
				<%
					// �ѱ��� �Է¹ޱ� ����
					request.setCharacterEncoding("euc-kr");
					
					// �˻�� ���޹޴� ����
					String searchValue = "";
					if(request.getParameter("searchValue") != null){
						searchValue = request.getParameter("searchValue");
					}
					
					System.out.println(searchValue);
					
					// ����¡ �˰���
					int rowPerPage = 5;
					int currentPage = 1;
					if(request.getParameter("currentPage") != null){
						currentPage = Integer.parseInt(request.getParameter("currentPage"));
					}
				
					// TeacherDao ��ü ����
					TeacherDao teacherDao = new TeacherDao();
					
					// teacherAddrDao ��ü ����
					TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
					
					
					// teacherScoreDao ��ü ����
					TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
					
					
					
					// selectTeacherByPage �޼��带 ���� ���ϵǴ� ���� ��(arrayListTeacher��ü�� ������)�� ����
					ArrayList<Teacher> arrayListTeacher = teacherDao.selectTeacherByPage(currentPage, rowPerPage, searchValue);
					
					// ������ ������
					int lastPage = teacherDao.countTotalRecordsBySearchValue(searchValue) / rowPerPage;
					if ((teacherDao.countTotalRecordsBySearchValue(searchValue) % rowPerPage) != 0){
						lastPage++;
					}
				%>
				<h1>Teacher List</h1><br>
				<div id="buttonForSearch">
					<form action="<%= request.getContextPath() %>./teacher/TeacherList.jsp" method="post">
						<label>�̸� :  
							<input type="text" name="searchValue">
						</label>
						<button>�˻�</button>
					</form>
				</div>
				<br><br>
				<table id="entityListTable" border="1">
					<thead>
						<tr>
							<th style="width:70px">���� ��ȣ</th>
							<th>���� �̸�</th>
							<th>���� ����</th>
							<th>�ּ� �Է�</th>							
							<th>���� �Է�</th>
							<th>���� ����</th>
							<th>�� ��</th>
							<th>�� ��</th>
						</tr>
					</thead>
					<% 
						// size() �޼���� ������ �ε��� ������ ��� ������ �������ش�.
						// ex) arrayListTeacher[17] ���� �����͸� ���� ���� ��� 18�� ����
						for(int i = 0; i < arrayListTeacher.size(); i++){
							// get�޼��带 ���� ������ ��ҿ� ����� Teacher ��ü�� �ҷ��´�.
							Teacher teacher = arrayListTeacher.get(i);
							
							// selectTeacherAddress �޼��带 ȣ���ϰ� ���Ϲ��� TeacherAddr��ü�� ���� ���� teacherAddr ��ü ���������� ���� 
							ArrayList<TeacherAddr> arrayListTeacherAddr = teacherAddrDao.selectTeacherAddress(teacher.getTeacherNo());
					%>
							<tr>
								<td><%= teacher.getTeacherNo() %></td>
								<%
									// �ش� ������ �ּ� ������ �����Ѵٸ�
									if(arrayListTeacherAddr.size() != 0){
								%>
										<td><a title="�ּ� ����" class="buttonToShowAddress" href="<%= request.getContextPath() %>./teacher/TeacherAddrList.jsp?teacherNo=<%= teacher.getTeacherNo() %>"><%= teacher.getTeacherName() %></a></td>
								<%	
									// �� ��
									} else {
								%>
										<td><%= teacher.getTeacherName() %></td>
								<%
									}
								%>
								<td><%= teacher.getTeacherAge() %></td>
								<td><a title="�ּ� �߰�" class="buttonToInsertAddress" href="<%= request.getContextPath() %>./teacher/InsertTeacherAddrForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">�ּ� �߰�</a></td>
								<%
									// �ش��ϴ� ������ ������ �������� �ʴ´ٸ� ���� �Է� ��ư�� ������
									TeacherAndScore teacherAndTeacherScore = teacherScoreDao.selectTeacherAndTeacherScore(teacher.getTeacherNo());
									if(teacherAndTeacherScore == null){
								%>
										<td><a title="���� �Է�" class="buttonToInsertScore" href="<%= request.getContextPath() %>./teacher/InsertTeacherScoreForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>"> �����Է�</a></td>
										<td></td>
								<%
							
									} else {
								%>
										<td></td>
										<td><a title="���� Ȯ��" class="buttonToShowScore" href="<%= request.getContextPath() %>./teacher/TeacherScoreList.jsp?teacherNo=<%= teacher.getTeacherNo() %>">��������</a></td>
								<%
									}
								%>
								<td><a title="���� ���� ����" class="buttonToUpdateEntity" href="<%= request.getContextPath() %>./teacher/UpdateTeacherForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">����</a></td>
								<td><a title="���� ���� ����" class="buttonToDeleteEntity" href="<%= request.getContextPath() %>./teacher/DeleteTeacherAction.jsp?teacherNo=<%= teacher.getTeacherNo() %>">����</a></td>
							</tr>
					<% 
						}
					%>
				</table>
				<br>
				<div id="addEntity">
					<a id="buttonToAddEntity" href="<%= request.getContextPath() %>./teacher/InsertTeacherForm.jsp">TeaCher ���� �Է�</a>
				</div>
				<br><br>
				<div id="page">
					<span><%= currentPage %> / <%= lastPage %></span>
				</div>
				<br>
				<div id="buttonForAnotherPage">
					<%
						if(currentPage > 1){
					%>
							<a id="buttonToPrevPage" href="<%= request.getContextPath() %>./teacher/TeacherList.jsp?currentPage=<%= currentPage - 1 %>&searchValue=<%= searchValue %>">&lt; ����</a>
					<%
						} else {
					%>
						
					<%
						}
						if(currentPage < lastPage){
					%>
							<a id="buttonToNextPage" href="<%= request.getContextPath() %>./teacher/TeacherList.jsp?currentPage=<%= currentPage + 1 %>&searchValue=<%= searchValue %>">���� &gt;</a>
					<%
						} else {
					%>
							
					<%
						}
					%>
				
				</div>
				<a href="./index.jsp">����ȭ������</a>
	
	</body>
</html>