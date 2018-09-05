/**
 * NamHocHocKy
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

public class NamHocHocKy {

	private long maNH;
	private int maHK;
	
	public NamHocHocKy(long maNH, int maHK) {
		this.maNH = maNH;
		this.maHK = maHK;
	}

	public long getMaNH() {
		return maNH;
	}

	public void setMaNH(long maNH) {
		this.maNH = maNH;
	}

	public int getMaHK() {
		return maHK;
	}

	public void setMaHK(int maHK) {
		this.maHK = maHK;
	}
	
}