/**
 * Diem
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

import java.text.DecimalFormat;

import common.Utilities;

public class Diem {

	private String maHS;
	private long maMH, maLop, maNH;
	private int maHK;
	private long maGV;
	private float diemTongKet, diemThi;
	private String tenHS;
	private String tenMH;
	private int hocKy;
	private String tenGV;

	private String diemMieng = "", diem15Phut = "", diem1Tiet = "";

	public long getMaLop() {
		return maLop;
	}

	public void setMaLop(long maLop) {
		this.maLop = maLop;
	}

	public long getMaNH() {
		return maNH;
	}

	public void setMaNH(long maNH) {
		this.maNH = maNH;
	}
	
	public float getDiemThi() {
		return diemThi;
	}

	public void setDiemThi(float diemThi) {
		this.diemThi = diemThi;
	}

	public String getDiemMieng() {
		return diemMieng;
	}

	public void setDiemMieng(String diemMieng) {
		this.diemMieng = diemMieng;
	}

	public String getDiem15Phut() {
		return diem15Phut;
	}

	public void setDiem15Phut(String diem15Phut) {
		this.diem15Phut = diem15Phut;
	}

	public String getDiem1Tiet() {
		return diem1Tiet;
	}

	public void setDiem1Tiet(String diem1Tiet) {
		this.diem1Tiet = diem1Tiet;
	}

	public Diem() {

	}

	public Diem(String maHS, long maMH, long maGV, int maHK, float diemTongKet) {
		this.maHK = maHK;
		this.maMH = maMH;
		this.maHS = maHS;
		this.maGV = maGV;
		this.diemTongKet = diemTongKet;
	}

	public String getMaHS() {
		return maHS;
	}

	public void setMaHS(String maHS) {
		this.maHS = maHS;
	}

	public long getMaMH() {
		return maMH;
	}

	public void setMaMH(long maMH) {
		this.maMH = maMH;
	}

	public int getMaHK() {
		return maHK;
	}

	public void setMaHK(int maHK) {
		this.maHK = maHK;
	}

	public long getMaGV() {
		return maGV;
	}

	public void setMaGV(long maGV) {
		this.maGV = maGV;
	}
	
	public int getSoCotDiem(String chuoiDiem) {
		String[] cotDiemArr = chuoiDiem.trim().split(";");
		return cotDiemArr.length;
	}

	public float getDiemTongKet() {
		float diemMieng = Utilities.tinhDiem(1, this.diemMieng);
		float diem15Phut = Utilities.tinhDiem(1, this.diem15Phut);
		float diem1Tiet = Utilities.tinhDiem(2, this.diem1Tiet);

		this.diemTongKet = 
				(diemMieng + diem15Phut + diem1Tiet + (this.diemThi * 3))
				/ 6;
		DecimalFormat frmt = new DecimalFormat("#.0");
		
		return Float.parseFloat(frmt.format(this.diemTongKet));
	}
	public void setDiemTongKet(float diemTongKet) {
		this.diemTongKet = diemTongKet;
	}

	public String getTenHS() {
		return tenHS;
	}

	public void setTenHS(String tenHS) {
		this.tenHS = tenHS;
	}

	public String getTenMH() {
		return tenMH;
	}

	public void setTenMH(String tenMH) {
		this.tenMH = tenMH;
	}

	public int getHocKy() {
		return hocKy;
	}

	public void setHocKy(int hocKy) {
		this.hocKy = hocKy;
	}

	public String getTenGV() {
		return tenGV;
	}

	public void setTenGV(String tenGV) {
		this.tenGV = tenGV;
	}

}