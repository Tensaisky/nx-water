package nx.water.entity;

public class rmd {
	private int PGROUP_ID;
	private int RTU_ID ; 
	private int DATATYPE_ID;
	private String RMD_TIME;
	private double RMD_VALUE;
	public int getPGROUP_ID() {
		return PGROUP_ID;
	}
	public void setPGROUP_ID(int pGROUP_ID) {
		PGROUP_ID = pGROUP_ID;
	}
	public int getRTU_ID() {
		return RTU_ID;
	}
	public void setRTU_ID(int rTU_ID) {
		RTU_ID = rTU_ID;
	}
	public int getDATATYPE_ID() {
		return DATATYPE_ID;
	}
	public void setDATATYPE_ID(int dATATYPE_ID) {
		DATATYPE_ID = dATATYPE_ID;
	}
	public String getRMD_TIME() {
		return RMD_TIME;
	}
	public void setRMD_TIME(String rMD_TIME) {
		RMD_TIME = rMD_TIME;
	}
	public double getRMD_VALUE() {
		return RMD_VALUE;
	}
	public void setRMD_VALUE(double rMD_VALUE) {
		RMD_VALUE = rMD_VALUE;
	}
	@Override
	public String toString() {
		return "rmd [PGROUP_ID=" + PGROUP_ID + ", RTU_ID=" + RTU_ID + ", DATATYPE_ID=" + DATATYPE_ID + ", RMD_TIME="
				+ RMD_TIME + ", RMD_VALUE=" + RMD_VALUE + "]";
	}
	
}
