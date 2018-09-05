/**
 * ChiTietHocBa
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

import java.util.ArrayList;

public class ChiTietHocBa {
	private int maLop, maNH, maHK;	
	
	private String maHS, hocLuc = "",  hanhKiem = "", nhanXet = "";
	private int ngayNghi;
	private float diemCaNam;	
	
	private ArrayList<ChiTietHocBa> dsChiTiet = new ArrayList<>();

	public ArrayList<ChiTietHocBa> getDsChiTiet() {
		return dsChiTiet;
	}


	public ChiTietHocBa(String maHS, String hocLuc, String hanhKiem, int ngayNghi, String nhanXet, float diemCaNam,
			String tenHS, int maLop, ArrayList<KetQuaHocTap> kqHT) {
		super();
		this.maHS = maHS;
		this.hocLuc = hocLuc;
		this.hanhKiem = hanhKiem;
		this.ngayNghi = ngayNghi;
		this.nhanXet = nhanXet;
		this.diemCaNam = diemCaNam;
		this.tenHS = tenHS;
		this.kqHT = kqHT;
		this.maLop = maLop;
	}
	
	public ChiTietHocBa(String maHS, String hocLuc, String hanhKiem, int ngayNghi, String nhanXet, float diemCaNam,
			String tenHS, int maLop) {
		super();
		this.maHS = maHS;
		this.hocLuc = hocLuc;
		this.hanhKiem = hanhKiem;
		this.ngayNghi = ngayNghi;
		this.nhanXet = nhanXet;
		this.diemCaNam = diemCaNam;
		this.tenHS = tenHS;
		this.maLop = maLop;
	}
	
	public int getMaHK() {
		return maHK;
	}

	public void setMaHK(int maHK) {
		this.maHK = maHK;
	}

	
	public int getMaNH() {
		return maNH;
	}

	public void setMaNH(int maNH) {
		this.maNH = maNH;
	}

	public int getMaLop() {
		return maLop;
	}

	public void setMaLop(int maLop) {
		this.maLop = maLop;
	}

	public float getDiemCaNam() {
		return diemCaNam;
	}

	public void setDiemCaNam(float diemCaNam) {
		this.diemCaNam = diemCaNam;
	}

	private String tenHS;
	private ArrayList<KetQuaHocTap> kqHT = null;

	public ChiTietHocBa() {
		kqHT = new ArrayList<>();
	}

	public String getMaHS() {
		return maHS;
	}

	public void setMaHS(String maHS) {
		this.maHS = maHS;
	}

	public String getHocLuc() {
		return hocLuc;
	}

	public void setHocLuc(String hocLuc) {
		this.hocLuc = hocLuc;
	}

	public String getHanhKiem() {
		return hanhKiem;
	}

	public void setHanhKiem(String hanhKiem) {
		this.hanhKiem = hanhKiem;
	}

	public int getNgayNghi() {
		return ngayNghi;
	}

	public void setNgayNghi(int ngayNghi) {
		this.ngayNghi = ngayNghi;
	}

	public String getNhanXet() {
		return nhanXet;
	}

	public void setNhanXet(String nhanXet) {
		this.nhanXet = nhanXet;
	}

	public String getTenHS() {
		return tenHS;
	}

	public void setTenHS(String tenHS) {
		this.tenHS = tenHS;
	}

	public ArrayList<KetQuaHocTap> getKqHT() {
		return kqHT;
	}

	public void setKqHT(ArrayList<KetQuaHocTap> kqHT) {
		this.kqHT = kqHT;
	}
}