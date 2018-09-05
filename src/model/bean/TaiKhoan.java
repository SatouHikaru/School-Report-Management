/**
 * TaiKhoan
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

public class TaiKhoan {
	
	private String tenDangNhap;
	private String matKhau;
	private boolean daKhoa;
	
	public TaiKhoan(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
		
	}
	
	public TaiKhoan(String tenDangNhap, String matKhau) {
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
	}
	
	public TaiKhoan(String tenDangNhap, String matkhau, boolean daKhoa) {
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matkhau;
		this.daKhoa = daKhoa;
	}
	
	public String getTenDangNhap() {
		return tenDangNhap;
	}
	
	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	
	public String getMatKhau() {
		return matKhau;
	}
	
	public void setMatKhau(String matkhau) {
		this.matKhau = matkhau;
	}

	public boolean getDaKhoa() {
		return daKhoa;
	}

	public void setDaKhoa(boolean daKhoa) {
		this.daKhoa = daKhoa;
	}
	
}