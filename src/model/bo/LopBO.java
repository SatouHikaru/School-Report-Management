/**
 * LopBO.java
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

import model.bean.Lop;
import model.dao.LopDAO;

public class LopBO {
	
	private static LopBO instance;
	public static LopBO getInstance() {
		if (instance == null)
			instance = new LopBO();
		return instance;
	}
	
	public ArrayList<Lop> getAll() throws SQLException {
		return LopDAO.getInstance().getAll();
	}
	
	public ArrayList<Lop> getLopCuaHocSinh(String maHS) throws SQLException {
		return LopDAO.getInstance().getLopCuaHocSinh(maHS);
	}
	
	public Lop getById(long maLop) throws SQLException {
		return LopDAO.getInstance().getById(maLop);
	}
	
	public ArrayList<Lop> getByYear(long maNH) throws SQLException {
		return LopDAO.getInstance().getByYear(maNH);
	}
	
	public long add(Lop l) throws SQLException {
		return LopDAO.getInstance().add(l);
	}
	
	public void edit(Lop l) throws SQLException {
		LopDAO.getInstance().edit(l);
	}
	
	public void remove(long maLop) throws SQLException {
		LopDAO.getInstance().remove(maLop);
	}
	
}