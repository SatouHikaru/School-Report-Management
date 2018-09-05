/**
 * ThongKeHanhKiem.java
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

public class ThongKeHanhKiem extends ThongKe {

	private int maRL;
	private String hanhKiem;
	private int soLuong;

	public ThongKeHanhKiem() {
		super();
	}

	public ThongKeHanhKiem(int maRL, String hanhKiem, int soLuong) {
		this.maRL = maRL;
		this.hanhKiem = hanhKiem;
		this.soLuong = soLuong;
	}
	
	public ThongKeHanhKiem(String tenHS, boolean gioiTinh, LocalDate ngaySinh, String lop,
						   String hanhKiem) {
		super(tenHS, gioiTinh, ngaySinh, lop);
		this.hanhKiem = hanhKiem;
	}

	public int getMaRL() {
		return maRL;
	}

	public void setMaRL(int maRL) {
		this.maRL = maRL;
	}
	
	public String getHanhKiem() {
		return hanhKiem;
	}

	public void setHanhKiem(String hanhKiem) {
		this.hanhKiem = hanhKiem;
	}
	
	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
}