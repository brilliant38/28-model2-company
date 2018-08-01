package kr.or.ksmart.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ksmart.Inter.CActionInterFace;
import kr.or.ksmart.forward.CActionFoward;

@WebServlet("/CController")
public class CController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CController() {
        super();
        
    }
    protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("02 doPro 호출 완료");
    	request.setCharacterEncoding("euc-kr");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		
		System.out.println(RequestURI + "<-- RequestURI MController.java");
		System.out.println(contextPath + "<-- contextPath BoardFrontController.java");
		System.out.println(contextPath.length() + "<-- contextPath.length() BoardFrontController.java");
		System.out.println(command + "<-- command BoardFrontController.java");
		CActionFoward forward = null;
		CActionInterFace action = null;
		
		if(command.equals("/c_main.engineer")) {
			System.out.println("04_01_/Min/m_insert_form.ksmart");
			forward = new CActionFoward();
			forward.setRedirect(false);
			forward.setPath("c_main.jsp");
		}
		
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				
				RequestDispatcher dispatcher=
					request.getRequestDispatcher(forward.getPath());
				System.out.println(forward.getPath() + "<--- forward.getPath()[jsp 이동경로]  BoardFrontController.java");
				System.out.println();
				dispatcher.forward(request, response);
			}
		}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("01 doGet 호출 완료");
		doPro(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("01 doPost 호출 완료");
		doPro(request,response);
	}

}
