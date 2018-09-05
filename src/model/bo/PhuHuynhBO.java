/**
 * PhuHuynhBO.java
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

import model.bean.PhuHuynh;
import model.dao.PhuHuynhDAO;

public class PhuHuynhBO {

	private static PhuHuynhBO instance;
	public static PhuHuynhBO getInstance() {
		if (instance == null)
			instance = new PhuHuynhBO();
		return instance;
	}
	
	public ArrayList<PhuHuynh> getAll(String term, long maLop) throws SQLException {
		return PhuHuynhDAO.getInstance().getAll(term, maLop);
	}
	
	public PhuHuynh getById(long maPH) throws SQLException {
		return PhuHuynhDAO.getInstance().getById(maPH);
	}
	
	public void add(PhuHuynh ph) throws SQLException {
		PhuHuynhDAO.getInstance().add(ph);
	}
	
	public long addAndGetId(PhuHuynh ph) throws SQLException {
		return PhuHuynhDAO.getInstance().addAndGetId(ph);
	}
	
	public void edit(PhuHuynh ph) throws SQLException {
		PhuHuynhDAO.getInstance().edit(ph);
	}
	
	public void remove(long maPH) throws SQLException {
		PhuHuynhDAO.getInstance().remove(maPH);
	}
	
	public long getID(String tenDangNhap) throws SQLException {
		return PhuHuynhDAO.getInstance().getID(tenDangNhap);
	}

	public long getAccount(String tenPH) throws SQLException {
		return PhuHuynhDAO.getInstance().getAccount(tenPH);
	}

	public String layTaiKhoan(String maPH) throws SQLException {
		return PhuHuynhDAO.getInstance().layTaiKhoan(maPH);
	}
	
}