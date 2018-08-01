<!-- 2018-07-11 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberList</title>
	</head>
	<body>
		
		<%	
			request.setCharacterEncoding("euc-kr");
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //������ Ŭ�� ������ �������� �ѱ��� ������ null�� ó���Ѵ�.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String Ÿ������ �Ѿ�� "currentPage" ������ Ÿ���� int�� ��ȯ�Ͽ� �����Ѵ�.
			}    
 
			int pagePerRow = 5;
			
			
			String searchWord = request.getParameter("searchWord");
			System.out.println(searchWord + " : 01 searchWord check");
			
			MemberDao memberDao = new MemberDao();
			ArrayList<Member> list = memberDao.selectMemberByPage(currentPage, pagePerRow);
			System.out.println(list + " : 02 list check");
			
			ArrayList<Member> searchList = memberDao.searchMemberList(currentPage, pagePerRow, searchWord);
			System.out.println(searchList + " : 03 searchList check");
			
			int RowNumber = list.get(0).getRowNumber();
			
			int lastPage = ((RowNumber-1) / pagePerRow) +1 ; // rowNumber-1�� ���� �������� ���� ������ ���� ������ �������� �ѹ�.
			
			if(searchList.size() > 0) {
				RowNumber = searchList.get(0).getRowNumber();
			}
		%>
		<h1>Member List</h1>
		<br>
		<form action="./MemberList.jsp" method="post">
			<div>
				�̸� :
				<input type="text" name="searchWord">
				<button type="submit">�˻�</button>
			</div>
		</form>
		<br><br>
		<table border="1">
			<tr>
				<th>ȸ�� ��ȣ</th>
				<th>ȸ�� �̸�</th>
				<th>ȸ�� ����</th>
				<th>�ּ� �Է�</th>
				<th>���� �Է�</th>
				<th>���� ����</th>
				<th>����</th>
				<th>����</th>
			</tr>
			
		<%
			if (searchList.size() == 0) {
				for(int i=0; i<list.size(); i++) {
		%>
					<tr>
						<td><%=list.get(i).getMemberNo()%></td>
						<td><a href="./MemberAddrList.jsp?no=<%=list.get(i).getMemberNo()%>"><%=list.get(i).getMemberName()%></a></td>
						<td><%=list.get(i).getMemberAge()%></td>
						<td><a href="./InsertMemberAddrForm.jsp?no=<%=list.get(i).getMemberNo()%>">�ּ� �Է�</a></td>
						<td><a href="./InsertMemberScoreForm.jsp?no=<%=list.get(i).getMemberNo()%>">���� �Է�</a></td>
						<td><a href="./MemberScoreList.jsp?no=<%=list.get(i).getMemberNo()%>">���� ����</a></td>
						<td><a href="./UpdateMemberForm.jsp?no=<%=list.get(i).getMemberNo()%>">����</a></td>
						<td><a href="./DeleteMemberAction.jsp?no=<%=list.get(i).getMemberNo()%>">����</a></td>
					</tr>
		<%
				}
			} else if (searchList.size() > 0) {
				for (int p=0; p<searchList.size(); p++) {
		%>
					<tr>
						<td><%=searchList.get(p).getMemberNo()%></td>
						<td><a href="./MemberAddrList.jsp?no=<%=searchList.get(p).getMemberNo()%>"><%=searchList.get(p).getMemberName()%></a></td>
						<td><%=searchList.get(p).getMemberAge()%></td>
						<td><a href="./InsertMemberAddrForm.jsp?no=<%=searchList.get(p).getMemberNo()%>">�ּ� �Է�</a></td>
						<td><a href="./InsertMemberScoreForm.jsp?no=<%=searchList.get(p).getMemberNo()%>">���� �Է�</a></td>
						<td><a href="./MemberScoreList.jsp?no=<%=searchList.get(p).getMemberNo()%>">���� ����</a></td>
						<td><a href="./UpdateMemberForm.jsp?no=<%=searchList.get(p).getMemberNo()%>">����</a></td>
						<td><a href="./DeleteMemberAction.jsp?no=<%=searchList.get(p).getMemberNo()%>">����</a></td>
					</tr>
		<%
				}
			}
		%>
		</table>
		<br>
		<div>
			<a href="./InsertMemberForm.jsp">Member ���� �Է�</a>
		</div>
		<br><br>
		<span><%=currentPage%> / <%=lastPage %></span><br><br>
		<%
			if(currentPage>1) { //currentPage ���� 1���� Ŭ���� ����
		%>
				<a href="./MemberList.jsp?currentPage=<%=currentPage-1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage-1�� ���� ���� --> 
		<%
			}
		
			if(currentPage<lastPage) { //���� ������ �ѹ��� ������ ������ �ѹ����� �۾��������� ����.
		%>
				<a href="./MemberList.jsp?currentPage=<%=currentPage+1%>">����</a> <!-- ���� ������ ��ư Ŭ���� "currentPage"������ currentPage+1�� ���� ���� -->
		<%
			}
		%>
		<br>
		<div>
		<a href = "../index.jsp">����ȭ��</a>
		</div>
		
	</body>
</html>