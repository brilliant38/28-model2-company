package kr.or.ksmart.Inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ksmart.forward.CActionFoward;

public interface CActionInterFace {
	public CActionFoward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
