/**
 * MonHocBO
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

import model.bean.MonHoc;
import model.dao.MonHocDAO;

public class MonHocBO {

	private static MonHocBO instance;
	public static MonHocBO getInstance() {
		if (instance == null)
			instance = new MonHocBO();
		return instance;
	}
	
	public ArrayList<MonHoc> getAll() throws SQLException {
		return MonHocDAO.getInstance().getAll();
	}
	
	public MonHoc getById(long maMH) throws SQLException {
		return MonHocDAO.getInstance().getById(maMH);
	}
	
	public void add(MonHoc mh) throws SQLException {
		MonHocDAO.getInstance().add(mh);
	}
	
	public void edit(MonHoc mh) throws SQLException {
		MonHocDAO.getInstance().edit(mh);
	}
	
	public void remove(long maMH) throws SQLException {
		MonHocDAO.getInstance().remove(maMH);
	}
	
}