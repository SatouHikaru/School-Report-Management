/*
* (C) Copyright 2017 
*
* Version 1.0
*
* Date: 2018-08-06
*
* Modification Logs:
* DATE		   AUTHOR		DESCRIPTION
*--------------------------------------
* 2018-08-06	Naa		Create
*/
package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.TaiKhoan;
import model.dao.TaiKhoanDAO;

public class TaiKhoanBO {

	private static TaiKhoanBO instance;
	public static TaiKhoanBO getInstance() {
		if (instance == null)
			instance = new TaiKhoanBO();
		return instance;
	}
	
	public boolean login(TaiKhoan account) throws SQLException {
		return TaiKhoanDAO.getInstance().login(account);
	}
	
	public void changePassword(TaiKhoan account) throws SQLException {
		TaiKhoanDAO.getInstance().changePassword(account);
	}

	public ArrayList<String> getRole(TaiKhoan account) throws SQLException {
		return TaiKhoanDAO.getInstance().getRole(account);
	}

	public void add(TaiKhoan taiKhoan) throws SQLException {
		TaiKhoanDAO.getInstance().add(taiKhoan);
	}

	public String getPassword(String userName) throws SQLException {
		return TaiKhoanDAO.getInstance().getPassword(userName);
	}
	
}