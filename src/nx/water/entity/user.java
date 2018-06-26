package nx.water.entity;

public class user {
	private String USER_ID;
	private String USER_NAME;
	private String USER_PSW;
	private String USER_ROLE;
	private String USER_DESC;
	private String PGROUP_ID;
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getUSER_PSW() {
		return USER_PSW;
	}
	public void setUSER_PSW(String uSER_PSW) {
		USER_PSW = uSER_PSW;
	}
	public String getUSER_ROLE() {
		return USER_ROLE;
	}
	public void setUSER_ROLE(String uSER_ROLE) {
		USER_ROLE = uSER_ROLE;
	}
	public String getUSER_DESC() {
		return USER_DESC;
	}
	public void setUSER_DESC(String uSER_DESC) {
		USER_DESC = uSER_DESC;
	}
	public String getPGROUP_ID() {
		return PGROUP_ID;
	}
	public void setPGROUP_ID(String pGROUP_ID) {
		PGROUP_ID = pGROUP_ID;
	}
	@Override
	public String toString() {
		return "user [USER_ID=" + USER_ID + ", USER_NAME=" + USER_NAME + ", USER_PSW=" + USER_PSW + ", USER_ROLE="
				+ USER_ROLE + ", USER_DESC=" + USER_DESC + ", PGROUP_ID=" + PGROUP_ID + "]";
	}
	public user(String uSER_ID, String uSER_NAME, String uSER_PSW, String uSER_ROLE, String uSER_DESC,
			String pGROUP_ID) {
		super();
		USER_ID = uSER_ID;
		USER_NAME = uSER_NAME;
		USER_PSW = uSER_PSW;
		USER_ROLE = uSER_ROLE;
		USER_DESC = uSER_DESC;
		PGROUP_ID = pGROUP_ID;
	}
	public user() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
   
	

}
