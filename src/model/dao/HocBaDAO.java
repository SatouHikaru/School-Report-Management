/**
 * HocBaDAO.java
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
import java.util.ArrayList;

import model.bean.HocBa;

public class HocBaDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static HocBaDAO instance;
	public static HocBaDAO getInstance() {
		if (instance == null)
			instance = new HocBaDAO();
		return instance;
	}
	
	public ArrayList<HocBa> get() throws SQLException {
		ArrayList<HocBa> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spHocBa_Get}");
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			HocBa hb;
			while (rs.next()) {
				hb = new HocBa();
				hb.setMaHB(rs.getLong("MaHB"));
				hb.setTenHS(rs.getString("TenHS"));
				hb.setNienKhoa(rs.getString("NienKhoa"));
				
				list.add(hb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return list;
	}
	
	public void add(HocBa hb) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHocBa_Add(?,?)}");
			cstmt.setString(1, hb.getMaHS());
			cstmt.setString(2, hb.getNienKhoa());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void edit(HocBa hb) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHocBa_Edit(?,?,?)}");
			cstmt.setLong(1, hb.getMaHB());
			cstmt.setString(2, hb.getMaHS());
			cstmt.setString(3, hb.getNienKhoa());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void remove(long maHB) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHocBa_Remove(?)}");
			cstmt.setLong(1, maHB);
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