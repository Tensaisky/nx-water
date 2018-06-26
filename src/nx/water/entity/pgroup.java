package nx.water.entity;

public class pgroup {
	private int PGROUP_ID; 
	private String PGROUP_DESC;
	public int getPGROUP_ID() {
		return PGROUP_ID;
	}
	public void setPGROUP_ID(int pGROUP_ID) {
		PGROUP_ID = pGROUP_ID;
	}
	public String getPGROUP_DESC() {
		return PGROUP_DESC;
	}
	public void setPGROUP_DESC(String pGROUP_DESC) {
		PGROUP_DESC = pGROUP_DESC;
	}
	@Override
	public String toString() {
		return "pgroup [PGROUP_ID=" + PGROUP_ID + ", PGROUP_DESC=" + PGROUP_DESC + "]";
	} 
	
}
