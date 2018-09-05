/**
 * ThongTinGiangDay
 *
 * Version 1.0
 *
 * Date: 2018-08-06
 *
 * Modification Logs:
 * DATE		   AUTHOR		DESCRIPTION
 *--------------------------------------
 * 2018-08-06	Naa		Create
 */

package model.bean;

public class ThongTinGiangDay {
	
	private long maGV;
	private long maMH;
	private long maLop;
	private int maHK;
	private String tenGV;
	private String tenMH;
	private String tenLop;
	private String hocKy;
	
	public ThongTinGiangDay() {
		
	}
	
	public ThongTinGiangDay(long maGV, long maMH) {
		this.maGV = maGV;
		this.maMH = maMH;
	}
	
	public ThongTinGiangDay(long maGV, long maMH, long maLop, int maHK) {
		this.maGV = maGV;
		this.maMH = maMH;
		this.maLop = maLop;
		this.maHK = maHK;
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

	public long getMaLop() {
		return maLop;
	}

	public int getMaHK() {
		return maHK;
	}

	public void setMaLop(long maLop) {
		this.maLop = maLop;
	}

	public void setMaHK(int maHK) {
		this.maHK = maHK;
	}

	public String getTenGV() {
		return tenGV;
	}

	public void setTenGV(String tenGV) {
		this.tenGV = tenGV;
	}

	public String getTenMH() {
		return tenMH;
	}

	public void setTenMH(String tenMH) {
		this.tenMH = tenMH;
	}

	public String getTenLop() {
		return tenLop;
	}

	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}

	public String getHocKy() {
		return hocKy;
	}

	public void setHocKy(String hocKy) {
		this.hocKy = hocKy;
	}
	
}