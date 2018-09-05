package model.bean;

public class KetQuaHocTap {
	private String tenMH;
	private float hk1, hk2, caNam;
	
	public String getTenMH() {
		return tenMH;
	}
	public void setTenMH(String tenMH) {
		this.tenMH = tenMH;
	}
	public float getHk1() {
		return hk1;
	}
	public void setHk1(float hk1) {
		this.hk1 = hk1;
	}
	public float getHk2() {
		return hk2;
	}
	public void setHk2(float hk2) {
		this.hk2 = hk2;
	}
	public float getCaNam() {
		return caNam;
	}
	public void setCaNam(float caNam) {
		this.caNam = caNam;
	}
	public KetQuaHocTap(String tenMH, float hk1, float hk2, float caNam) {
		super();
		this.tenMH = tenMH;
		this.hk1 = hk1;
		this.hk2 = hk2;
		this.caNam = caNam;
	}
	public KetQuaHocTap() {
		// TODO Auto-generated constructor stub
	}
	
	
	
}
