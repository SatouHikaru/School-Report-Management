/**
 * HoatDongLienLac
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

import java.sql.Date;

public class HoatDongLienLac {
	private long maTN;
	private String noiDung;
	private String hinhThucGui;
	private Date ngayGui;
	private long maPH;
	private String tenPH;
	
	public HoatDongLienLac() {
		
	}
	
	public HoatDongLienLac(long maTN, String noiDung, String hinhThucGui, Date ngayGui, long maPH) {
		this.maTN = maTN;
		this.noiDung = noiDung;
		this.hinhThucGui = hinhThucGui;
		this.ngayGui = ngayGui;
		this.maPH = maPH;
	}
	
	public long getMaTN() {
		return maTN;
	}
	
	public void setMaTN(long maTN) {
		this.maTN = maTN;
	}
	
	public String getNoiDung() {
		return noiDung;
	}
	
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	
	public String getHinhThucGui() {
		return hinhThucGui;
	}
	
	public void setHinhThucGui(String hinhThucGui) {
		this.hinhThucGui = hinhThucGui;
	}
	
	public Date getNgayGui() {
		return ngayGui;
	}
	
	public void setNgayGui(Date ngayGui) {
		this.ngayGui = ngayGui;
	}
	
	public long getMaPH() {
		return maPH;
	}
	
	public void setMaPH(long maPH) {
		this.maPH = maPH;
	}

	public String getTenPH() {
		return tenPH;
	}

	public void setTenPH(String tenPH) {
		this.tenPH = tenPH;
	}

}