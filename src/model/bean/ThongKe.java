/**
 * ThongKe.java
 *
 * Version 1.0
 *
 * Date: 15-08-2018
 *
 * Copyright
 *
 * Modification Logs:
 * DATE           AUTHOR             DESCRIPTION
 * -----------------------------------
 * 15-08-2018     HCD-Fresher137     Create
 */

package model.bean;

import java.time.LocalDate;

public abstract class ThongKe {

	private String tenHS;
	private boolean gioiTinh;
	private LocalDate ngaySinh;
	private String lop;
	
	public ThongKe() {
		
	}

	public ThongKe(String tenHS, boolean gioiTinh, LocalDate ngaySinh, String lop) {
		this.tenHS = tenHS;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.lop = lop;
	}

	public String getTenHS() {
		return tenHS;
	}

	public void setTenHS(String tenHS) {
		this.tenHS = tenHS;
	}

	public boolean isGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public LocalDate getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(LocalDate ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getLop() {
		return lop;
	}

	public void setLop(String lop) {
		this.lop = lop;
	}
	
}