package kr.or.ksmart.forward;

public class CActionFoward {
	private boolean isRedirect;
	private String path;
	
	public CActionFoward() {
		this.isRedirect = false;
		this.path = null;
	}
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
