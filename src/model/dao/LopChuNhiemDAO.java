/**
 * LopChuNhiemDAO.java
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

import model.bean.LopChuNhiem;

public class LopChuNhiemDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static LopChuNhiemDAO instance;
	public static LopChuNhiemDAO getInstance() {
		if (instance == null)
			instance = new LopChuNhiemDAO();
		return instance;
	}
	
	public ArrayList<LopChuNhiem> getAll() throws SQLException {
		ArrayList<LopChuNhiem> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spLopChuNhiem_GetAll}");
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			LopChuNhiem lcn;
			while (rs.next()) {
				lcn = new LopChuNhiem();
				lcn.setMaGV(rs.getLong("MaGV"));
				lcn.setTenGV(rs.getString("TenGV"));
				lcn.setMaLop(rs.getLong("MaLop"));
				lcn.setTenLop(rs.getString("TenLop"));
				lcn.setSiSo(rs.getInt("SiSo"));
				lcn.setNienKhoa(rs.getString("NienKhoa"));
				
				list.add(lcn);
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
	
	public void add(LopChuNhiem lcn) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spLopChuNhiem_Add(?,?,?)}");
			cstmt.setLong(1, lcn.getMaLop());
			cstmt.setLong(2, lcn.getMaGV());
			cstmt.setString(3, lcn.getNienKhoa());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void edit(LopChuNhiem lcn) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spLopChuNhiem_Edit(?,?,?)}");
			cstmt.setLong(1, lcn.getMaLop());
			cstmt.setLong(2, lcn.getMaGV());
			cstmt.setString(3, lcn.getNienKhoa());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void remove(long maLop, long maGV) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spLopChuNhiem_Remove(?,?)}");
			cstmt.setLong(1, maLop);
			cstmt.setLong(2, maGV);
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