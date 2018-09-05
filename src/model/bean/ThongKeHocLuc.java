/**
 * ThongKeHocLuc.java
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

public class ThongKeHocLuc extends ThongKe {

	private int maHL;
	private String hocLuc;
	private int soLuong;

	public ThongKeHocLuc() {
		
	}
	
	public ThongKeHocLuc(int maHL, String hocLuc, int soLuong) {
		this.maHL = maHL;
		this.hocLuc = hocLuc;
		this.soLuong = soLuong;
	}
	
	public ThongKeHocLuc(String tenHS, boolean gioiTinh, LocalDate ngaySinh, String lop,
						 String hocLuc) {
		super(tenHS, gioiTinh, ngaySinh, lop);
		this.hocLuc = hocLuc;
	}
	
	public int getMaHL() {
		return maHL;
	}

	public void setMaHL(int maHL) {
		this.maHL = maHL;
	}
	
	public String getHocLuc() {
		return hocLuc;
	}

	public void setHocLuc(String hocLuc) {
		this.hocLuc = hocLuc;
	}
	
	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
}