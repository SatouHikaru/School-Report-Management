package model.bo;

import java.sql.SQLException;

import model.dao.LopNamHocDAO;

public class LopNamHocBO {
	private static LopNamHocBO instance;
	public static LopNamHocBO getInstance() {
		if (instance == null)
			instance = new LopNamHocBO();
		return instance;
	}
	
	public void add(long maLop, String[] namHoc) throws NumberFormatException, SQLException {

		if (namHoc == null || namHoc.length <= 0) {
			LopNamHocDAO.getInstance().removeByMaLop(maLop);
			return;
		}

		for (String cm : namHoc) {
			LopNamHocDAO.getInstance().add((int)maLop, Integer.parseInt(cm));
		}
	}

	public void edit(long maLop, String[] chuyenMon) throws NumberFormatException, SQLException {

		if (chuyenMon == null || chuyenMon.length <= 0 ) {
			LopNamHocDAO.getInstance().removeByMaLop(maLop);
			return;
		}

		StringBuilder chuyenMonStr = new StringBuilder();
		for (int i = 0; i < chuyenMon.length; i++) {
			chuyenMonStr = chuyenMonStr.append("("+maLop+"," + chuyenMon[i] + ")" + (i < chuyenMon.length -1 ? "," : ""));
		}

		LopNamHocDAO.getInstance().edit(maLop, chuyenMonStr.toString());
	}
}
