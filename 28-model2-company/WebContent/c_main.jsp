<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>메인화면</title>
	<style>
		table {
			border : 1px solid black ;
			border-collapse : collapse;
			border-top-left-radius: 2em; 
			border-top-right-radius: 2em; 
			border-bottom-right-radius: 2em; 
			border-bottom-left-radius: 2em;

		}
		th, td {
			border : 1px solid black ;
			border-collapse : collapse; 
		}
	</style>
	</head>
	<body>
		<h1>메인 화면</h1>
		<%
			String S_ID = (String)session.getAttribute("S_ID");
			String S_NAME = (String)session.getAttribute("S_NAME");
			if(S_NAME == null) {
		%>
				<form action="<%= request.getContextPath() %>/Clogin/C_login_pro.engineer" method="post">
					아이디: <input type="text" name="id">
					비  번: <input type="password" name="pw">
					<input type="submit" value="로그인버튼">
				</form>	<br>
				<a href="<%= request.getContextPath() %>/Clogin/C_insert_form.engineer">회원가입</a>
		<%
		
			} else {
		%>
				<%= S_NAME %>님 로그인중 
				<a href="<%= request.getContextPath() %>/Clogin/C_logout.engineer">로그아웃 </a><br><br>
				<table>
					<tr>
						<th>Teacher</th>
						<td><a href="<%= request.getContextPath() %>/teacher/C_teacher_list.engineer">선생님들</a></td>
					</tr>
					<tr>
						<th>Student</th>
						<td><a href="<%= request.getContextPath() %>/student/C_student_list.engineer">학생들</a></td>
					</tr>
					<tr>
						<th>Employee</th>
						<td><a href="<%= request.getContextPath() %>/employee/C_employee_list.engineer">직원들</a></td>
					</tr>
					<tr>
						<th>Parent</th>
						<td><a href="<%= request.getContextPath() %>/parent/C_parent_list.engineer">학부모들</a></td>
					</tr>
				</table>
		<%
			}
		%>
	</body>
</html>
