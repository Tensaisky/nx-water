package nx.water.entity;

public class test {
	private String time; 
	private double PH; 
	private double CON;
	private double DO; 
	private double TUR;
	private double TEMP;
	private double COD;
	private double NH4;
	private double PO4;
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public double getPH() {
		return PH;
	}
	public void setPH(double pH) {
		PH = pH;
	}
	public double getCON() {
		return CON;
	}
	public void setCON(double cON) {
		CON = cON;
	}
	public double getDO() {
		return DO;
	}
	public void setDO(double dO) {
		DO = dO;
	}
	public double getTUR() {
		return TUR;
	}
	public void setTUR(double tUR) {
		TUR = tUR;
	}
	public double getTEMP() {
		return TEMP;
	}
	public void setTEMP(double tEMP) {
		TEMP = tEMP;
	}
	public double getCOD() {
		return COD;
	}
	public void setCOD(double cOD) {
		COD = cOD;
	}
	public double getNH4() {
		return NH4;
	}
	public void setNH4(double nH4) {
		NH4 = nH4;
	}
	public double getPO4() {
		return PO4;
	}
	public void setPO4(double pO4) {
		PO4 = pO4;
	}
	@Override
	public String toString() {
		return "test [time=" + time + ", PH=" + PH + ", CON=" + CON + ", DO=" + DO + ", TUR=" + TUR + ", TEMP=" + TEMP
				+ ", COD=" + COD + ", NH4=" + NH4 + ", PO4=" + PO4 + "]";
	}
   
    
	
}
