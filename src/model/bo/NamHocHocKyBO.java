/**
 * NamHocHocKyBO.java
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

import model.bean.NamHocHocKy;
import model.dao.NamHocHocKyDAO;

public class NamHocHocKyBO {

	private static NamHocHocKyBO instance;
	public static NamHocHocKyBO getInstance() {
		if (instance == null)
			instance = new NamHocHocKyBO();
		return instance;
	}
	
	public void add(NamHocHocKy nhhk) throws SQLException {
		NamHocHocKyDAO.getInstance().add(nhhk);
	}
	
	public void edit(NamHocHocKy nhhk) throws SQLException {
		NamHocHocKyDAO.getInstance().edit(nhhk);
	}
	
	public void remove(NamHocHocKy nhhk) throws SQLException {
		NamHocHocKyDAO.getInstance().remove(nhhk);
	}
	
}