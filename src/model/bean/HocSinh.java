/**
 * HocSinh
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

public class HocSinh {
	
	private String maHS;
	private String hoTen;
	private boolean gioiTinh;
	private LocalDate ngaySinh;
	private String dienThoai;
	private String diaChi;
	private long maLop;
	private long maPH;
	private String tenLop;
	private String phuHuynh;
	
	private Diem diem;

	public Diem getDiem() {
		return diem;
	}

	public void setDiem(Diem diem) {
		this.diem = diem;
	}

	public HocSinh() {
		
	}
	
	public HocSinh(String maHS, String hoTen) {
		this.maHS = maHS;
		this.hoTen = hoTen;
	}
	
	public HocSinh(String hoTen, boolean gioiTinh, LocalDate ngaySinh, String dienThoai,
				   String diaChi, long maLop, long maPH) {
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.dienThoai = dienThoai;
		this.diaChi = diaChi;
		this.maLop = maLop;
		this.maPH = maPH;
	}
	
	public HocSinh(String maHS, String hoTen, boolean gioiTinh, LocalDate ngaySinh, String dienThoai,
				   String diaChi, long maLop, long maPH) {
		this.maHS = maHS;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.dienThoai = dienThoai;
		this.diaChi = diaChi;
		this.maLop = maLop;
		this.maPH = maPH;
	}
	
	public String getMaHS() {
		return maHS;
	}
	
	public void setMaHS(String maHS) {
		this.maHS = maHS;
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
	
	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public long getMaLop() {
		return maLop;
	}
	
	public void setMaLop(long maLop) {
		this.maLop = maLop;
	}

	public long getMaPH() {
		return maPH;
	}

	public void setMaPH(long maPH) {
		this.maPH = maPH;
	}
	
	public String getTenLop() {
		return tenLop;
	}

	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}

	public String getPhuHuynh() {
		return phuHuynh;
	}

	public void setPhuHuynh(String phuHuynh) {
		this.phuHuynh = phuHuynh;
	}
	
}