/**
 * LopChuNhiem
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

public class LopChuNhiem {
	
	private long maGV;
	private long maLop;
	private int siSo;
	private String nienKhoa;
	private String tenLop;
	private String tenGV;
	
	public LopChuNhiem() {
		
	}
	
	public LopChuNhiem(long maGV, long maLop, int siSo, String nienKhoa) {
		this.maGV = maGV;
		this.maLop = maLop;
		this.siSo = siSo;
		this.nienKhoa = nienKhoa;
	}
	
	public long getMaGV() {
		return maGV;
	}
	
	public void setMaGV(long maGV) {
		this.maGV = maGV;
	}
	
	public long getMaLop() {
		return maLop;
	}
	
	public void setMaLop(long maLop) {
		this.maLop = maLop;
	}
	
	public int getSiSo() {
		return siSo;
	}

	public void setSiSo(int siSo) {
		this.siSo = siSo;
	}

	public String getNienKhoa() {
		return nienKhoa;
	}
	
	public void setNienKhoa(String nienKhoa) {
		this.nienKhoa = nienKhoa;
	}

	public String getTenLop() {
		return tenLop;
	}

	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}

	public String getTenGV() {
		return tenGV;
	}

	public void setTenGV(String tenGV) {
		this.tenGV = tenGV;
	}

}