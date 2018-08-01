<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
response.sendRedirect(request.getContextPath()+"/c_main.engineer");

/* RequestDispatcher dispatcher=
request.getRequestDispatcher(request.getContextPath()+"/Min/m_insert_form.ksmart");
System.out.println(request.getContextPath()+"/Min/m_insert_form.ksmart" + "<--- forward.getPath()[jsp 이동경로]  BoardFrontController.java");
System.out.println();
dispatcher.forward(request, response); */

//response.sendRedirect(request.getContextPath()+"/board/BoardWrite.bo");
%>