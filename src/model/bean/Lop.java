/**
 * Lop
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

public class Lop {
	
	private long maLop;
	private String tenLop;
	private int siSo;
	private long namHoc;
	private String tenNamHoc;
	
	public Lop() {
		
	}
	
	public Lop(long maLop, String tenLop, int siSo) {
		this.maLop = maLop;
		this.tenLop = tenLop;
		this.siSo = siSo;
	}
	
	public long getMaLop() {
		return maLop;
	}
	
	public void setMaLop(long maLop) {
		this.maLop = maLop;
	}
	
	public String getTenNamHoc() {
		return tenNamHoc;
	}
	
	public void setTenNamHoc(String tenNH) {
		this.tenNamHoc = tenNH;
	}
	
	public String getTenLop() {
		return tenLop;
	}
	
	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}
	
	public int getSiSo() {
		return siSo;
	}
	
	public void setSiSo(int siSo) {
		this.siSo = siSo;
	}
	
	public long getNamHoc() {
		return namHoc;
	}
	
	public void setNamHoc(long namHoc) {
		this.namHoc = namHoc;
	}

}