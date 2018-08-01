package kr.or.ksmart.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ksmart.Inter.MActionInterFace;
import kr.or.ksmart.dao.Mdao;
import kr.or.ksmart.dto.Member;
import kr.or.ksmart.forward.MActionForward;

public class MListProAction implements MActionInterFace {
	
	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("05_02_리스트 execute_MListProAction.java_입력처리");
		//1단계 : 입력 데이터가 있으면, 받아서 확인한다.(현재없다.)
		//2단계 : DTO또는 VO에 값을 세팅한다. (필요시에만)
		//3단계 : DAO 객체내의 리스트 메서드 호출
		
		//4단계 : 메서드 호출 후 리턴 값을 받는다.
		Mdao dao = new Mdao();
		ArrayList<Member> getalm = dao.mAllSelect();
		
		//5단계 : request 객체 내에 리턴 값(ArrayList 객체 주소값) 을 셋팅
		request.setAttribute("getalm", getalm);
		
		//6단계 : MActionForward통해 생성된 객체내 포워드 설정 및 경로 설정
		MActionForward mf = new MActionForward();
		mf.setRedirect(false);
		mf.setPath("/mlist/m_list.jsp");
		
		//7단계 : MActionForward통해 생성된 객체 주소값 리턴
		return mf;
	}
}
