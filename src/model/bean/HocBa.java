/**
 * HocBa
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

public class HocBa {
	
	private long maHB;
	private String maHS;
	private String nienKhoa;
	private String tenHS;
	
	public HocBa() {
		
	}

	public HocBa(long maHB, String maHS, String nienKhoa) {
		this.maHB = maHB;
		this.maHS = maHS;
		this.nienKhoa = nienKhoa;
	}

	public long getMaHB() {
		return maHB;
	}

	public void setMaHB(long maHB) {
		this.maHB = maHB;
	}

	public String getMaHS() {
		return maHS;
	}

	public void setMaHS(String maHS) {
		this.maHS = maHS;
	}

	public String getNienKhoa() {
		return nienKhoa;
	}

	public void setNienKhoa(String nienKhoa) {
		this.nienKhoa = nienKhoa;
	}

	public String getTenHS() {
		return tenHS;
	}

	public void setTenHS(String tenHS) {
		this.tenHS = tenHS;
	}

}