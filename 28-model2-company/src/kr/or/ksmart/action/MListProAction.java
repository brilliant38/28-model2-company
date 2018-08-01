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
		System.out.println("05_02_����Ʈ execute_MListProAction.java_�Է�ó��");
		//1�ܰ� : �Է� �����Ͱ� ������, �޾Ƽ� Ȯ���Ѵ�.(�������.)
		//2�ܰ� : DTO�Ǵ� VO�� ���� �����Ѵ�. (�ʿ�ÿ���)
		//3�ܰ� : DAO ��ü���� ����Ʈ �޼��� ȣ��
		
		//4�ܰ� : �޼��� ȣ�� �� ���� ���� �޴´�.
		Mdao dao = new Mdao();
		ArrayList<Member> getalm = dao.mAllSelect();
		
		//5�ܰ� : request ��ü ���� ���� ��(ArrayList ��ü �ּҰ�) �� ����
		request.setAttribute("getalm", getalm);
		
		//6�ܰ� : MActionForward���� ������ ��ü�� ������ ���� �� ��� ����
		MActionForward mf = new MActionForward();
		mf.setRedirect(false);
		mf.setPath("/mlist/m_list.jsp");
		
		//7�ܰ� : MActionForward���� ������ ��ü �ּҰ� ����
		return mf;
	}
}
