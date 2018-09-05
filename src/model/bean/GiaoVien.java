/**
 * GiaoVien
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

import java.time.LocalDate;

import common.StringProcess;

public class GiaoVien {	
	private long maGV;
	private String hoTen;
	private boolean gioiTinh;
	private LocalDate ngaySinh;
	private String dienThoai;
	private String email;
	private String diaChi;
	private String taiKhoan;
	private String chuyenMon;
	
	public GiaoVien() {
		
	}

	public GiaoVien(long maGV, String hoTen, boolean gioiTinh, LocalDate ngaySinh,
					String dienThoai, String email, String diaChi) {
		this.maGV = maGV;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.dienThoai = dienThoai;
		this.email = email;
		this.diaChi = diaChi;
	}
	
	public GiaoVien(String hoTen, boolean gioiTinh, LocalDate ngaySinh, String dienThoai,
					String email, String diaChi, String taiKhoan) {
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.dienThoai = dienThoai;
		this.email = email;
		this.diaChi = diaChi;
		this.taiKhoan = taiKhoan;
	}

	public long getMaGV() {
		return maGV;
	}

	public void setMaGV(long maGV) {
		this.maGV = maGV;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public boolean isGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public LocalDate getNgaySinh() {
		return this.ngaySinh;
	}
	
	public String getFormattedNgaySinh() {
		return StringProcess.toFriendlyDateFormat(this.ngaySinh);
	}

	public void setNgaySinh(LocalDate ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getEmail() {
		return email;
	}

	public String getDienThoai() {
		return dienThoai;
	}

	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(String taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public String getChuyenMon() {
		return chuyenMon;
	}

	public void setChuyenMon(String chuyenMon) {
		this.chuyenMon = chuyenMon;
	}	

}