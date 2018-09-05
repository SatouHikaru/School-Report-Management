/**
 * NamHocHocKyDAO.java
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

package model.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.NamHocHocKy;

public class NamHocHocKyDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static NamHocHocKyDAO instance;
	public static NamHocHocKyDAO getInstance() {
		if (instance == null)
			instance = new NamHocHocKyDAO();
		return instance;
	}
	
	public void add(NamHocHocKy nhhk) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spNamHocHocKy_Add(?,?)}");
			cstmt.setLong(1, nhhk.getMaNH());
			cstmt.setInt(2, nhhk.getMaHK());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void edit(NamHocHocKy nhhk) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spNamHocHocKy_Update(?,?)}");
			cstmt.setLong(1, nhhk.getMaNH());
			cstmt.setInt(2, nhhk.getMaHK());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void remove(NamHocHocKy nhhk) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spNamHocHocKy_Remove(?,?)}");
			cstmt.setLong(1, nhhk.getMaNH());
			cstmt.setInt(2, nhhk.getMaHK());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
}