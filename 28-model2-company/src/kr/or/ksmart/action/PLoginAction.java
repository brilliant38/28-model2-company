package kr.or.ksmart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ksmart.Inter.CActionInterFace;
import kr.or.ksmart.dto.Parent;
import kr.or.ksmart.forward.CActionFoward;

public class PLoginAction implements CActionInterFace {

	@Override
	public CActionFoward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("05_01_execute_PLoginAction 실행완료");
		//1단계 : 입력 데이터가 있으면, 받아서 확인한다.(현재없다.)
		String pId = request.getParameter("id");
		String pPw = request.getParameter("pw");
		//2단계 : DTO또는 VO에 값을 세팅한다. (필요시에만)
		Parent parent = new Parent();
		parent.setOra_id(pId);
		parent.setOra_pw(pPw);
		//3단계 : DAO 객체내의 리스트 메서드 호출
		
		//4단계 : 메서드 호출 후 리턴 값을 받는다.
		//5단계 : request 객체 내에 리턴 값(ArrayList 객체 주소값) 을 셋팅
		//6단계 : MActionForward통해 생성된 객체내 포워드 설정 및 경로 설정
		//7단계 : MActionForward통해 생성된 객체 주소값 리턴
		return null;
	}

}

//1단계 : 입력 데이터가 있으면, 받아서 확인한다.(현재없다.)
//2단계 : DTO또는 VO에 값을 세팅한다. (필요시에만)
//3단계 : DAO 객체내의 리스트 메서드 호출
//4단계 : 메서드 호출 후 리턴 값을 받는다.
//5단계 : request 객체 내에 리턴 값(ArrayList 객체 주소값) 을 셋팅
//6단계 : MActionForward통해 생성된 객체내 포워드 설정 및 경로 설정
//7단계 : MActionForward통해 생성된 객체 주소값 리턴