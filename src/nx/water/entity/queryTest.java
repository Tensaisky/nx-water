package nx.water.entity;

public class queryTest {
     private int starttime;
     private int endtime;
	public int getStarttime() {
		return starttime;
	}
	public void setStarttime(int starttime) {
		this.starttime = starttime;
	}
	public int getEndtime() {
		return endtime;
	}
	public void setEndtime(int endtime) {
		this.endtime = endtime;
	}
	@Override
	public String toString() {
		return "queryTest [starttime=" + starttime + ", endtime=" + endtime + "]";
	}
	public queryTest(int starttime, int endtime) {
		super();
		this.starttime = starttime;
		this.endtime = endtime;
	}
	public queryTest() {
		super();
		// TODO Auto-generated constructor stub
	}
     
}
