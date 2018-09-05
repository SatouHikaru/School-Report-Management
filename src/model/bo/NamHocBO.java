/**
 * NamHocBO.java
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

import model.bean.NamHoc;
import model.dao.NamHocDAO;

public class NamHocBO {

	private static NamHocBO instance;
	public static NamHocBO getInstance() {
		if (instance == null)
			instance = new NamHocBO();
		return instance;
	}
	
	public ArrayList<NamHoc> getAll() throws SQLException {
		return NamHocDAO.getInstance().getAll();
	}
	
	public ArrayList<NamHoc> getAllByClass(int maLop) throws SQLException {
		return NamHocDAO.getInstance().getAllByClass(maLop);
	}
	
	public void add(NamHoc nh) throws SQLException {
		NamHocDAO.getInstance().add(nh);
	}
	
	public void edit(NamHoc nh) throws SQLException {
		NamHocDAO.getInstance().edit(nh);
	}
	
	public void remove(long maNH) throws SQLException {
		NamHocDAO.getInstance().remove(maNH);
	}
	
}