package nx.water.entity;

public class rtu {
	private int RTU_ID;
	private int RTU_PGROUP_ID;
	private int RTU_IS_VALID;
	private int RTU_STATE;
	private String RTU_DESC;
	private int RTU_VER;
	private int RTU_COM_TYPE;
	private String RTU_ADD1;
	private String RTU_ADD2;
	private double RTU_LONGITUDE;
	private double RTU_LATITUDE;
	

	public double getRTU_LONGITUDE() {
		return RTU_LONGITUDE;
	}

	public void setRTU_LONGITUDE(double rTU_LONGITUDE) {
		RTU_LONGITUDE = rTU_LONGITUDE;
	}

	public double getRTU_LATITUDE() {
		return RTU_LATITUDE;
	}

	public void setRTU_LATITUDE(double rTU_LATITUDE) {
		RTU_LATITUDE = rTU_LATITUDE;
	}

	public int getRTU_ID() {
		return RTU_ID;
	}

	public void setRTU_ID(int rTU_ID) {
		RTU_ID = rTU_ID;
	}

	public int getRTU_PGROUP_ID() {
		return RTU_PGROUP_ID;
	}

	public void setRTU_PGROUP_ID(int rTU_PGROUP_ID) {
		RTU_PGROUP_ID = rTU_PGROUP_ID;
	}

	public int getRTU_IS_VALID() {
		return RTU_IS_VALID;
	}

	public void setRTU_IS_VALID(int rTU_IS_VALID) {
		RTU_IS_VALID = rTU_IS_VALID;
	}

	public int getRTU_STATE() {
		return RTU_STATE;
	}

	public void setRTU_STATE(int rTU_STATE) {
		RTU_STATE = rTU_STATE;
	}

	public String getRTU_DESC() {
		return RTU_DESC;
	}

	public void setRTU_DESC(String rTU_DESC) {
		RTU_DESC = rTU_DESC;
	}

	public int getRTU_VER() {
		return RTU_VER;
	}

	public void setRTU_VER(int rTU_VER) {
		RTU_VER = rTU_VER;
	}

	public int getRTU_COM_TYPE() {
		return RTU_COM_TYPE;
	}

	public void setRTU_COM_TYPE(int rTU_COM_TYPE) {
		RTU_COM_TYPE = rTU_COM_TYPE;
	}

	public String getRTU_ADD1() {
		return RTU_ADD1;
	}

	public void setRTU_ADD1(String rTU_ADD1) {
		RTU_ADD1 = rTU_ADD1;
	}

	public String getRTU_ADD2() {
		return RTU_ADD2;
	}

	public void setRTU_ADD2(String rTU_ADD2) {
		RTU_ADD2 = rTU_ADD2;
	}

	@Override
	public String toString() {
		return "rtu [RTU_ID=" + RTU_ID + ", RTU_PGROUP_ID=" + RTU_PGROUP_ID + ", RTU_IS_VALID=" + RTU_IS_VALID
				+ ", RTU_STATE=" + RTU_STATE + ", RTU_DESC=" + RTU_DESC + ", RTU_VER=" + RTU_VER + ", RTU_COM_TYPE="
				+ RTU_COM_TYPE + ", RTU_ADD1=" + RTU_ADD1 + ", RTU_ADD2=" + RTU_ADD2 + ", RTU_LONGITUDE="
				+ RTU_LONGITUDE + ", RTU_LATITUDE=" + RTU_LATITUDE + "]";
	}

}
