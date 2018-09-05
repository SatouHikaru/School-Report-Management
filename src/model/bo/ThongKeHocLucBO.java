/**
 * ThongKeHocLucBO.java
 *
 * Version 1.0
 *
 * Date: 16-08-2018
 *
 * Copyright
 *
 * Modification Logs:
 * DATE           AUTHOR             DESCRIPTION
 * -----------------------------------
 * 16-08-2018     HCD-Fresher137     Create
 */

package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.ThongKeHocLuc;
import model.dao.ThongKeHocLucDAO;

public class ThongKeHocLucBO {

	private static ThongKeHocLucBO instance;
	public static ThongKeHocLucBO getInstance() {
		if (instance == null)
			instance = new ThongKeHocLucBO();
		return instance;
	}
	
	public ArrayList<ThongKeHocLuc> getAll(long maNH, long maLop, int maHK, String maHL) throws SQLException {
		return ThongKeHocLucDAO.getInstance().getAll(maNH, maLop, maHK, maHL);
	}
	
	public int demSoHocSinhGioi(long maNH, long maLop, int maHK) throws SQLException {
		return ThongKeHocLucDAO.getInstance().demSoHocSinhGioi(maNH, maLop, maHK);
	}
	
	public int demSoHocSinhKha(long maNH, long maLop, int maHK) throws SQLException {
		return ThongKeHocLucDAO.getInstance().demSoHocSinhKha(maNH, maLop, maHK);
	}
	
	public int demSoHocSinhTrungBinh(long maNH, long maLop, int maHK) throws SQLException {
		return ThongKeHocLucDAO.getInstance().demSoHocSinhTrungBinh(maNH, maLop, maHK);
	}
	
	public int demSoHocSinhYeu(long maNH, long maLop, int maHK) throws SQLException {
		return ThongKeHocLucDAO.getInstance().demSoHocSinhYeu(maNH, maLop, maHK);
	}
	
	public int demSoHocSinhKem(long maNH, long maLop, int maHK) throws SQLException {
		return ThongKeHocLucDAO.getInstance().demSoHocSinhKem(maNH, maLop, maHK);
	}
	
}