/**
 * HocBaBO.java
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

import model.bean.HocBa;
import model.dao.HocBaDAO;

public class HocBaBO {

	private static HocBaBO instance;
	public static HocBaBO getInstance() {
		if (instance == null)
			instance = new HocBaBO();
		return instance;
	}
	
	public ArrayList<HocBa> get() throws SQLException {
		return HocBaDAO.getInstance().get();
	}
	
	public void add(HocBa hb) throws SQLException {
		HocBaDAO.getInstance().add(hb);
	}
	
	public void edit(HocBa hb) throws SQLException {
		HocBaDAO.getInstance().edit(hb);
	}
	
	public void remove(long maHB) throws SQLException {
		HocBaDAO.getInstance().remove(maHB);
	}
	
}