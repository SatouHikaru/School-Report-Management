package model.bo;

import java.sql.SQLException;

import model.bean.ChuyenMon;
import model.dao.ChuyenMonDAO;

public class ChuyenMonBO {

	private static ChuyenMonBO instance;

	public static ChuyenMonBO getInstance() {
		if (instance == null)
			instance = new ChuyenMonBO();
		return instance;
	}

	public void add(long maGV, String[] chuyenMon) throws NumberFormatException, SQLException {

		if (chuyenMon.length <= 0) {
			ChuyenMonDAO.getInstance().removeByMaGV(maGV);
			return;
		}

		for (String cm : chuyenMon) {
			ChuyenMonDAO.getInstance().add(new ChuyenMon(maGV, Long.valueOf(cm)));
		}
	}

	public void edit(long maGV, String[] chuyenMon) throws NumberFormatException, SQLException {

		if (chuyenMon.length <= 0) {
			ChuyenMonDAO.getInstance().removeByMaGV(maGV);
			return;
		}

		StringBuilder chuyenMonStr = new StringBuilder();
		for (int i = 0; i < chuyenMon.length; i++) {
			chuyenMonStr = chuyenMonStr.append("("+maGV+"," + chuyenMon[i] + ")" + (i < chuyenMon.length -1 ? "," : ""));
		}

		ChuyenMonDAO.getInstance().edit(maGV, chuyenMonStr.toString());

	}

}
