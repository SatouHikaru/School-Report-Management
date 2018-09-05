/**
 * HocKyBO.java
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

import model.bean.HocKy;
import model.dao.HocKyDAO;

public class HocKyBO {

	private static HocKyBO instance;
	public static HocKyBO getInstance() {
		if (instance == null)
			instance = new HocKyBO();
		return instance;
	}
	
	public ArrayList<HocKy> getAll() throws SQLException {
		return HocKyDAO.getInstance().getAll();
	}
	
	public HocKy getById(int maHK) throws SQLException {
		return HocKyDAO.getInstance().getById(maHK);
	}
	
	public void add(HocKy hk) throws SQLException {
		HocKyDAO.getInstance().add(hk);
	}
	
	public void edit(HocKy hk) throws SQLException {
		HocKyDAO.getInstance().edit(hk);
	}
	
	public void remove(int maHK) throws SQLException {
		HocKyDAO.getInstance().remove(maHK);
	}
	
}