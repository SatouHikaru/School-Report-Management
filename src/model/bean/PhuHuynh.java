/**
 * PhuHuynh
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

public class PhuHuynh {
	
	private long maPH;
	private String hoTen;
	private boolean gioiTinh;
	private LocalDate ngaySinh;
	private String dienThoai;
	private String email;
	private String diaChi;
	private String taiKhoan;
	private String gender;
	
	public PhuHuynh() {
		
	}
	
	public PhuHuynh(String hoTen, boolean gioiTinh, LocalDate ngaySinh, String dienThoai,
					String email, String diaChi, String taiKhoan) {
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.dienThoai = dienThoai;
		this.email = email;
		this.diaChi = diaChi;
		this.taiKhoan = taiKhoan;
	}
	
	public PhuHuynh(long maPH, String hoTen, boolean gioiTinh, LocalDate ngaySinh, String dienThoai,
					String email, String diaChi, String taiKhoan) {
		this.maPH = maPH;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.dienThoai = dienThoai;
		this.email = email;
		this.diaChi = diaChi;
		this.taiKhoan = taiKhoan;
	}

	public long getMaPH() {
		return maPH;
	}
	
	public void setMaPH(long maPH) {
		this.maPH = maPH;
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
		return ngaySinh;
	}
	
	public void setNgaySinh(LocalDate ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getDienThoai() {
		return dienThoai;
	}
	
	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}

	public String getEmail() {
		return email;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;		
	}
	
}