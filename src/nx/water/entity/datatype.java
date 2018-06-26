package nx.water.entity;

public class datatype {
	private int DATATYPE_ID;
	private String DATATYPE_NAME;
	private String DATATYPE_DESC;
	private String DATATYPE_UNIT;

	public int getDATATYPE_ID() {
		return DATATYPE_ID;
	}

	public void setDATATYPE_ID(int dATATYPE_ID) {
		DATATYPE_ID = dATATYPE_ID;
	}

	public String getDATATYPE_NAME() {
		return DATATYPE_NAME;
	}

	public void setDATATYPE_NAME(String dATATYPE_NAME) {
		DATATYPE_NAME = dATATYPE_NAME;
	}

	public String getDATATYPE_DESC() {
		return DATATYPE_DESC;
	}

	public void setDATATYPE_DESC(String dATATYPE_DESC) {
		DATATYPE_DESC = dATATYPE_DESC;
	}

	public String getDATATYPE_UNIT() {
		return DATATYPE_UNIT;
	}

	public void setDATATYPE_UNIT(String dATATYPE_UNIT) {
		DATATYPE_UNIT = dATATYPE_UNIT;
	}

	@Override
	public String toString() {
		return "datatype [DATATYPE_ID=" + DATATYPE_ID + ", DATATYPE_NAME=" + DATATYPE_NAME + ", DATATYPE_DESC="
				+ DATATYPE_DESC + ", DATATYPE_UNIT=" + DATATYPE_UNIT + "]";
	}

}
