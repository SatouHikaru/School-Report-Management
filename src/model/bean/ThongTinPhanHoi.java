/**
 * ThongTinPhanHoi
 *
 * Version 1.0
 *
 * Date: 08-08-2018
 *
 * Copyright
 *
 * Modification Logs:
 * DATE           AUTHOR             DESCRIPTION
 * -----------------------------------
 * 08-08-2018     HCD-Fresher137     Create
 */

package model.bean;

import java.sql.Date;

public class ThongTinPhanHoi {

	private long idPH;
	private String tieuDe;
	private String noiDung;
	private String email;
	private String dienThoai;
	private String nguoiPhanHoi;
	private Date ngayGui;
	
	public ThongTinPhanHoi() {
		
	}

	public ThongTinPhanHoi(long idPH, String tieuDe, String noiDung, String email, String dienThoai,
			String nguoiPhanHoi, Date ngayGui) {
		this.idPH = idPH;
		this.tieuDe = tieuDe;
		this.noiDung = noiDung;
		this.email = email;
		this.dienThoai = dienThoai;
		this.nguoiPhanHoi = nguoiPhanHoi;
		this.ngayGui = ngayGui;
	}

	public long getIdPH() {
		return idPH;
	}

	public String getTieuDe() {
		return tieuDe;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public String getEmail() {
		return email;
	}

	public String getDienThoai() {
		return dienThoai;
	}

	public String getNguoiPhanHoi() {
		return nguoiPhanHoi;
	}

	public Date getNgayGui() {
		return ngayGui;
	}

	public void setIdPH(long idPH) {
		this.idPH = idPH;
	}

	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}

	public void setNguoiPhanHoi(String nguoiPhanHoi) {
		this.nguoiPhanHoi = nguoiPhanHoi;
	}

	public void setNgayGui(Date ngayGui) {
		this.ngayGui = ngayGui;
	}
	
}