package nx.water.entity;

public class position {
    private int id;
    private double jd;
    private double wd;
    private String address;
    private String phone;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getJd() {
		return jd;
	}
	public void setJd(double jd) {
		this.jd = jd;
	}
	public double getWd() {
		return wd;
	}
	public void setWd(double wd) {
		this.wd = wd;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "position [id=" + id + ", jd=" + jd + ", wd=" + wd + ", address=" + address + ", phone=" + phone + "]";
	}
	public position(int id, double jd, double wd, String address, String phone) {
		super();
		this.id = id;
		this.jd = jd;
		this.wd = wd;
		this.address = address;
		this.phone = phone;
	}
	public position() {
		super();
		// TODO Auto-generated constructor stub
	}
    
}
