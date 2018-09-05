/**
 * LopChuNhiemBO.java
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

import model.bean.LopChuNhiem;
import model.dao.LopChuNhiemDAO;

public class LopChuNhiemBO {

	private static LopChuNhiemBO instance;
	public static LopChuNhiemBO getInstance() {
		if (instance == null)
			instance = new LopChuNhiemBO();
		return instance;
	}
	
	public ArrayList<LopChuNhiem> getAll() throws SQLException {
		return LopChuNhiemDAO.getInstance().getAll();
	}
	
	public void add(LopChuNhiem lcn) throws SQLException {
		LopChuNhiemDAO.getInstance().add(lcn);
	}
	
	public void edit(LopChuNhiem lcn) throws SQLException {
		LopChuNhiemDAO.getInstance().edit(lcn);
	}
	
	public void remove(long maLop, long maGV) throws SQLException {
		LopChuNhiemDAO.getInstance().remove(maLop, maGV);
	}
	
}