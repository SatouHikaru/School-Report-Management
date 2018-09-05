/**
 * MonHoc
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

public class MonHoc {
	
	private long maMH;
	private String tenMH;
		
	public MonHoc() {
		
	}
	
	public MonHoc(String tenMH) {
		this.tenMH = tenMH;
	}
	
	public MonHoc(long maMH, String tenMH) {
		this.maMH = maMH;
		this.tenMH = tenMH;
	}
	
	public long getMaMH() {
		return maMH;
	}
	
	public void setMaMH(long maMH) {
		this.maMH = maMH;
	}
	
	public String getTenMH() {
		return tenMH;
	}
	
	public void setTenMH(String tenMH) {
		this.tenMH = tenMH;
	}

}