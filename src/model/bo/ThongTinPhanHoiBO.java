/**
 * ThongTinPhanHoiBO.java
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

import model.bean.ThongTinPhanHoi;
import model.dao.ThongTinPhanHoiDAO;

public class ThongTinPhanHoiBO {

	private static ThongTinPhanHoiBO instance;
	public static ThongTinPhanHoiBO getInstance() {
		if (instance == null)
			instance = new ThongTinPhanHoiBO();
		return instance;
	}
	
	public ArrayList<ThongTinPhanHoi> getAll() throws SQLException {
		return ThongTinPhanHoiDAO.getInstance().getAll();
	}
	
	public ThongTinPhanHoi getById(long idPH) throws SQLException {
		return ThongTinPhanHoiDAO.getInstance().getById(idPH);
	}
	
	public void add(ThongTinPhanHoi ttph) throws SQLException {
		ThongTinPhanHoiDAO.getInstance().add(ttph);
	}
	
	public void edit(ThongTinPhanHoi ttph) throws SQLException {
		ThongTinPhanHoiDAO.getInstance().edit(ttph);
	}
	
	public void remove(long idPH) throws SQLException {
		ThongTinPhanHoiDAO.getInstance().remove(idPH);
	}
	
}