/**
 * ChiTietHocBaBO
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

package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.ChiTietHocBa;
import model.bean.KetQuaHocTap;
import model.dao.ChiTietHocBaDAO;

public class ChiTietHocBaBO {
	
	private static ChiTietHocBaBO instance;
	public static ChiTietHocBaBO getInstance() {
		if (instance == null)
			instance = new ChiTietHocBaBO();
		return instance;
	}
	
	public ArrayList<KetQuaHocTap> xemHocBaTheoLop(String maHS, int maLop, int maNH) throws SQLException {
		return ChiTietHocBaDAO.getInstance().ketQuaHocTap(maHS, maLop, maNH);
	}
	
	public void capNhat(ChiTietHocBa model) throws SQLException {
		ChiTietHocBaDAO.getInstance().capNhat(model);
	}
	
	public ChiTietHocBa getChiTietHocBa(String maHS, int maLop, int maNH) throws SQLException {
		return ChiTietHocBaDAO.getInstance().getChiTietHocBa(maHS, maLop, maNH);
	}
	
}