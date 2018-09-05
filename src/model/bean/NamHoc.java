/**
 * NamHoc
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

public class NamHoc {

	private long maNH;
	private String namHoc;
	
	public NamHoc() {
		
	}

	public NamHoc(long maNH, String namHoc) {
		this.maNH = maNH;
		this.namHoc = namHoc;
	}

	public long getMaNH() {
		return maNH;
	}
	
	public void setMaNH(long maNH) {
		this.maNH = maNH;
	}
	
	public String getNamHoc() {
		return namHoc;
	}
	
	public void setNamHoc(String namHoc) {
		this.namHoc = namHoc;
	}
	
}