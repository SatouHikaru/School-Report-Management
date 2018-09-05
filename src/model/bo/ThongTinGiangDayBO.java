/**
 * ThongTinGiangDay.java
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

import model.bean.ThongTinGiangDay;
import model.dao.ThongTinGiangDayDAO;

public class ThongTinGiangDayBO {

	private static ThongTinGiangDayBO instance;
	public static ThongTinGiangDayBO getInstance() {
		if (instance == null)
			instance = new ThongTinGiangDayBO();
		return instance;
	}
	
	public ArrayList<ThongTinGiangDay> getAll() throws SQLException {
		return ThongTinGiangDayDAO.getInstance().getAll();
	}
	
	public ThongTinGiangDay getById(long maGV, long maMH) throws SQLException {
		return ThongTinGiangDayDAO.getInstance().getById(maGV, maMH);
	}
	
	public void add(ThongTinGiangDay ttgd) throws SQLException {
		ThongTinGiangDayDAO.getInstance().add(ttgd);
	}
	
	public void edit(ThongTinGiangDay ttgd) throws SQLException {
		ThongTinGiangDayDAO.getInstance().edit(ttgd);
	}
	
	public void remove(ThongTinGiangDay ttgd) throws SQLException {
		ThongTinGiangDayDAO.getInstance().remove(ttgd);
	}
	
}