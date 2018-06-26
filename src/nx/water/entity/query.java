package nx.water.entity;

public class query {
    private String pgroup;
    private String rtu;
    private String startTime;
    public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	private String endTime;
	public String getPgroup() {
		return pgroup;
	}
	public void setPgroup(String pgroup) {
		this.pgroup = pgroup;
	}
	public String getRtu() {
		return rtu;
	}
	public void setRtu(String rtu) {
		this.rtu = rtu;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	@Override
	public String toString() {
		return "query [pgroup=" + pgroup + ", rtu=" + rtu + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
    
    
}
