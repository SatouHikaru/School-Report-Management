/**
 * HoatDongLienLacDAO
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

import model.bean.HoatDongLienLac;

public class HoatDongLienLacDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static HoatDongLienLacDAO instance;
	public static HoatDongLienLacDAO getInstance() {
		if (instance == null)
			instance = new HoatDongLienLacDAO();
		return instance;
	}
	
	public ArrayList<HoatDongLienLac> getAll() throws SQLException {
		ArrayList<HoatDongLienLac> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spHoatDongLienLac_GetAll}");
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			HoatDongLienLac hdll;
			while (rs.next()) {
				hdll = new HoatDongLienLac();
				hdll.setMaTN(rs.getLong("MaTN"));
				hdll.setNoiDung(rs.getString("NoiDung"));
				hdll.setHinhThucGui(rs.getString("HinhThucGui"));
				hdll.setNgayGui(rs.getDate("NgayGui"));
				hdll.setTenPH(rs.getString("TenPH"));
				
				list.add(hdll);
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
	
	public HoatDongLienLac getById(long maTN) throws SQLException {
		HoatDongLienLac hdll = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spHoatDongLienLac_GetById(?)}");
			cstmt.setLong("MaTN", maTN);
			rs = cstmt.executeQuery();
			hdll = new HoatDongLienLac();
			while (rs.next()) {
				hdll.setMaTN(maTN);
				hdll.setNoiDung(rs.getString("NoiDung"));
				hdll.setHinhThucGui(rs.getString("HinhThucGui"));
				hdll.setNgayGui(rs.getDate("NgayGui"));
				hdll.setTenPH(rs.getString("TenPH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return hdll;
	}
	
	public void add(HoatDongLienLac hdll) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHoatDongLienLac_Add(?,?,?,?)}");
			cstmt.setString(1, hdll.getNoiDung());
			cstmt.setString(2, hdll.getHinhThucGui());
			cstmt.setDate(3, hdll.getNgayGui());
			cstmt.setLong(4, hdll.getMaPH());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void edit(HoatDongLienLac hdll) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHoatDongLienLac_Edit(?,?,?,?,?)}");
			cstmt.setLong(1, hdll.getMaTN());
			cstmt.setString(2, hdll.getNoiDung());
			cstmt.setString(3, hdll.getHinhThucGui());
			cstmt.setDate(4, hdll.getNgayGui());
			cstmt.setLong(5, hdll.getMaPH());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void remove(long maTN) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHoatDongLienLac_Remove(?)");
			cstmt.setLong(1, maTN);
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