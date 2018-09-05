/**
 * HoatDongLienLacBO.java
 *
 * Version 1.0
 *
 * Date: 07-08-2018
 *
 * Copyright
 *
 * Modification Logs:
 * DATE           AUTHOR             DESCRIPTION
 * -----------------------------------
 * 07-08-2018     HCD-Fresher137     Create
 */

package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.HoatDongLienLac;
import model.dao.HoatDongLienLacDAO;

public class HoatDongLienLacBO {

	private static HoatDongLienLacBO instance;
	public static HoatDongLienLacBO getInstance() {
		if (instance == null)
			instance = new HoatDongLienLacBO();
		return instance;
	}
	
	public ArrayList<HoatDongLienLac> getAll() throws SQLException {
		return HoatDongLienLacDAO.getInstance().getAll();
	}
	
	public HoatDongLienLac getById(long maTN) throws SQLException {
		return HoatDongLienLacDAO.getInstance().getById(maTN);
	}
	
	public void add(HoatDongLienLac l) throws SQLException {
		HoatDongLienLacDAO.getInstance().add(l);
	}
	
	public void edit(HoatDongLienLac l) throws SQLException {
		HoatDongLienLacDAO.getInstance().edit(l);
	}
	
	public void remove(long maTN) throws SQLException {
		HoatDongLienLacDAO.getInstance().remove(maTN);
	}
	
}