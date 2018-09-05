/**
 * MonHocDAO
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

import model.bean.MonHoc;

public class MonHocDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static MonHocDAO instance;
	public static MonHocDAO getInstance() {
		if (instance == null)
			instance = new MonHocDAO();
		return instance;
	}
	
	public ArrayList<MonHoc> getAll() throws SQLException {
		ArrayList<MonHoc> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spMonHoc_GetAll}");
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			MonHoc mh;
			while (rs.next()) {
				mh = new MonHoc();
				mh.setMaMH(rs.getLong("MaMH"));
				mh.setTenMH(rs.getString("TenMH"));
				
				list.add(mh);
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
	
	public MonHoc getById(long maMH) throws SQLException {
		MonHoc mh = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spMonHoc_GetById(?)}");
			cstmt.setLong("MaMH", maMH);
			rs = cstmt.executeQuery();
			mh = new MonHoc();
			while (rs.next()) {
				mh.setMaMH(maMH);
				mh.setTenMH(rs.getString("TenMH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return mh;
	}
	
	public void add(MonHoc mh) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spMonHoc_Add(?)}");
			cstmt.setString("TenMH", mh.getTenMH());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void edit(MonHoc mh) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spMonHoc_Edit(?,?)}");
			cstmt.setLong("MaMH", mh.getMaMH());
			cstmt.setString("TenMH", mh.getTenMH());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void remove(long maMH) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spMonHoc_Remove(?)}");
			cstmt.setLong("MaMH", maMH);
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