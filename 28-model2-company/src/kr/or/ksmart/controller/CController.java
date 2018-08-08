package kr.or.ksmart.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ksmart.Inter.CActionInterFace;
import kr.or.ksmart.action.PLoginAction;
import kr.or.ksmart.forward.CActionFoward;

@WebServlet("/CController")
public class CController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CController() {
        super();
        
    }
    /*최상위 경로부터 프로젝트 경로까지의 문자 수를 구해서 프로젝트 경로 내의 경로만을 추출해 내서 포워드,리다이렉트를 결정하는 분기문을
     * 포함하는 메소드.
     * */
    protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("02 doPro 실행완료");
    	request.setCharacterEncoding("euc-kr");
    	//전체 경로 문자 대입
		String RequestURI=request.getRequestURI();
		//프로젝트까지의 경로 추출후 대입
		String contextPath=request.getContextPath();
		//추출된 프로젝트까지의 경로 문자의 숫자만큼 전체 경로에서 잘라내어 대입
		String command=RequestURI.substring(contextPath.length());
		
		System.out.println(RequestURI + "<-- RequestURI MController.java");
		System.out.println(contextPath + "<-- contextPath BoardFrontController.java");
		System.out.println(contextPath.length() + "<-- contextPath.length() BoardFrontController.java");
		System.out.println(command + "<-- command BoardFrontController.java");
		//ActionForward -> 포워드, 리다이렉트의 선택 저장, 선택 후 이동할 경로 정보 저장
		CActionFoward forward = null;
		CActionInterFace action = null;
		
		//입력된 경로가 /c_main.engineer면 이 분기문이 실행됨.
		if(command.equals("/c_main.engineer")) {
			System.out.println("04_01_/c_main.engineer");
			//포워드 객체 생성해서 리다이렉트 변수에 false 저장.
			forward = new CActionFoward();
			forward.setRedirect(false);
			//경로 값에 c_main.jsp 저장하고 분기 종료
			forward.setPath("c_main.jsp");
		//입력된 경로가 /Plogin/p_login_pro.engineer면 이 분기문이 실행됨.
		} else if (command.equals("/Plogin/p_login_pro.engineer")) {
			System.out.println("04_02_/Plogin/p_login_pro.engineer");
			//action 변수에 PLoginAction 객체 생성후 주소값 대입 
			action = new PLoginAction();
			try {
				//PLoginAction 객체 내의 execute 메소드 호출 후 리턴되는 객체 forward 변수에 대입.
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				
				RequestDispatcher dispatcher=
					request.getRequestDispatcher(forward.getPath());
				System.out.println(forward.getPath() + "<--- forward.getPath()[jsp 경로]  BoardFrontController.java");
				System.out.println();
				dispatcher.forward(request, response);
			}
		}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("01 doGet 실행완료");
		doPro(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("01 doPost 실행완료");
		doPro(request,response);
	}

}
