package vo;

public class RecommendVO {
	
	String userId,userIp; 
	int no;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserIp() {
		return userIp;
	}
	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public RecommendVO(String userId, String userIp, int no) {
		super();
		this.userId = userId;
		this.userIp = userIp;
		this.no = no;
	}
	
	public RecommendVO() {
		
	}
	
}
