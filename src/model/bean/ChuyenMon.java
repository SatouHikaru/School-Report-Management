package model.bean;

public class ChuyenMon {
	private long maGV, maMH;
		
	public ChuyenMon(long maGV, long maMH) {
		super();
		this.maGV = maGV;
		this.maMH = maMH;
	}
	
	public long getMaGV() {
		return maGV;
	}
	public void setMaGV(long maGV) {
		this.maGV = maGV;
	}
	public long getMaMH() {
		return maMH;
	}
	public void setMaMH(long maMH) {
		this.maMH = maMH;
	}
}
