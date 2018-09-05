/**
 * HocKy
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


public class HocKy {
	
	private int maHK;
	private String tenHK;
	
	public HocKy() {
		
	}
	
	public HocKy(int maHK, String tenHK) {
		this.maHK = maHK;
		this.tenHK = tenHK;
	}
	
	public int getMaHK() {
		return maHK;
	}
	
	public void setMaHK(int maHK) {
		this.maHK = maHK;
	}
	
	public String getTenHK() {
		return tenHK;
	}
	
	public void setTenHK(String tenHK) {
		this.tenHK = tenHK;
	}	

}