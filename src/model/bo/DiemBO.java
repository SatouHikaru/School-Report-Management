/**
 * DiemBO.java
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

import model.bean.Diem;
import model.bean.HocKy;
import model.bean.Lop;
import model.bean.MonHoc;
import model.bean.NamHoc;
import model.dao.DiemDAO;

public class DiemBO {
	
	private static DiemBO instance;
	public static DiemBO getInstance() {
		if (instance == null)
			instance = new DiemBO();
		return instance;
	}
	
	public ArrayList<Diem> getAll() throws SQLException {
		return DiemDAO.getInstance().getAll();
	}
	
	public Diem getById(long maHS, long maMH) throws SQLException {
		return DiemDAO.getInstance().getById(maHS, maMH);
	}
	
	public void add(Diem diem) throws SQLException {
		DiemDAO.getInstance().add(diem);
	}
	
	public void add(String maHS, ArrayList<MonHoc> dsMH, ArrayList<HocKy> dsHK, ArrayList<Lop> dsLop, ArrayList<NamHoc> dsNH) throws SQLException {
		DiemDAO.getInstance().add(maHS, dsMH, dsHK, dsLop, dsNH);
	}
	
	public void add(String maHS, long maMH, int maHK) throws SQLException {
		DiemDAO.getInstance().add(maHS, maMH, maHK);
	}
	
	public void edit(Diem diem) throws SQLException {
		DiemDAO.getInstance().edit(diem);
	}
	
	public void remove(Diem diem) throws SQLException {
		DiemDAO.getInstance().remove(diem);
	}
	
}