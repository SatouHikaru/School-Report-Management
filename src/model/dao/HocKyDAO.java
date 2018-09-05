/**
 * HocKyDAO
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

package model.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.HocKy;

public class HocKyDAO {
	
	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static HocKyDAO instance;
	public static HocKyDAO getInstance() {
		if (instance == null)
			instance = new HocKyDAO();
		return instance;
	}
	
	public ArrayList<HocKy> getAll() throws SQLException {
		ArrayList<HocKy> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spHocKy_GetAll}");
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			HocKy hk;
			while (rs.next()) {
				hk = new HocKy();
				hk.setMaHK(rs.getInt("MaHK"));
				hk.setTenHK(rs.getString("TenHK"));
				
				list.add(hk);
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
	
	public HocKy getById(int maHK) throws SQLException {
		HocKy hk = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spHocKy_GetById(?)}");
			cstmt.setLong("MaHK", maHK);
			rs = cstmt.executeQuery();
			hk = new HocKy();
			while (rs.next()) {
				hk.setMaHK(maHK);
				hk.setTenHK(rs.getString("TenHK"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return hk;
	}
	
	public void add(HocKy hk) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHocKy_Add(?,?)}");
			cstmt.setString("TenHK", hk.getTenHK());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void edit(HocKy hk) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHocKy_Edit(?,?,?)}");
			cstmt.setInt("MaHK", hk.getMaHK());
			cstmt.setString("TenHK", hk.getTenHK());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void remove(int maHK) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHocKy_Remove(?)}");
			cstmt.setInt("MaHK", maHK);
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