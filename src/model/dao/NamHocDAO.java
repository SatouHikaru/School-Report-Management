/**
 * NamHocDAO
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

import model.bean.NamHoc;

public class NamHocDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static NamHocDAO instance;
	public static NamHocDAO getInstance() {
		if (instance == null)
			instance = new NamHocDAO();
		return instance;
	}
	
	public ArrayList<NamHoc> getAll() throws SQLException {
		ArrayList<NamHoc> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spNamHoc_GetAll}");
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			NamHoc nh;
			while (rs.next()) {
				nh = new NamHoc();
				nh.setMaNH(rs.getLong("MaNH"));
				nh.setNamHoc(rs.getString("TenNH"));
				
				list.add(nh);
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
	
	public ArrayList<NamHoc> getAllByClass(int maLop) throws SQLException {
		ArrayList<NamHoc> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spNamHoc_TheoLop(?)}");
			cstmt.setInt(1, maLop);
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			NamHoc nh;
			while (rs.next()) {
				nh = new NamHoc();
				nh.setMaNH(rs.getLong("MaNH"));
				nh.setNamHoc(rs.getString("TenNH"));
				
				list.add(nh);
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
	
	public void add(NamHoc nh) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spNamHoc_Add(?)}");
			cstmt.setString(1, nh.getNamHoc());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void edit(NamHoc nh) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spNamHoc_Edit(?,?)}");
			cstmt.setLong(1, nh.getMaNH());
			cstmt.setString(2, nh.getNamHoc());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void remove(long maNH) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spNamHoc_Remove(?)}");
			cstmt.setLong(1, maNH);
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