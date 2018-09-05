/**
 * ThongTinGiangDayDAO.java
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

import model.bean.ThongTinGiangDay;

public class ThongTinGiangDayDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static ThongTinGiangDayDAO instance;
	public static ThongTinGiangDayDAO getInstance() {
		if (instance == null)
			instance = new ThongTinGiangDayDAO();
		return instance;
	}
	
	public ArrayList<ThongTinGiangDay> getAll() throws SQLException {
		ArrayList<ThongTinGiangDay> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spGiangDay_GetAll}");
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			ThongTinGiangDay ttgd;
			while (rs.next()) {
				ttgd = new ThongTinGiangDay();
				ttgd.setMaGV(rs.getLong("MaGV"));
				ttgd.setTenGV(rs.getString("TenGV"));
				ttgd.setMaMH(rs.getLong("MaMH"));
				ttgd.setTenMH(rs.getString("TenMH"));
				ttgd.setMaLop(rs.getLong("MaLop"));
				ttgd.setTenLop(rs.getString("TenLop"));
				ttgd.setMaHK(rs.getInt("MaHK"));
				ttgd.setHocKy(rs.getString("TenHK"));
				
				list.add(ttgd);
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
	
	public ThongTinGiangDay getById(long maGV, long maMH) throws SQLException {
		ThongTinGiangDay ttgd = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spGiangDay_GetById(?,?)}");
			cstmt.setLong(1, maGV);
			cstmt.setLong(2, maMH);
			rs = cstmt.executeQuery();
			ttgd = new ThongTinGiangDay();
			while (rs.next()) {
				ttgd.setMaGV(rs.getLong("MaGV"));
				ttgd.setTenGV(rs.getString("TenGV"));
				ttgd.setMaMH(rs.getLong("MaMH"));
				ttgd.setTenMH(rs.getString("TenMH"));
				ttgd.setMaLop(rs.getLong("MaLop"));
				ttgd.setTenLop(rs.getString("TenLop"));
				ttgd.setMaHK(rs.getInt("MaHK"));
				ttgd.setHocKy(rs.getString("TenHK"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return ttgd;
	}
	
	public void add(ThongTinGiangDay ttgd) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spGiangDay_Add(?,?)}");
			cstmt.setLong(1, ttgd.getMaGV());
			cstmt.setLong(2, ttgd.getMaMH());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void edit(ThongTinGiangDay ttgd) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spGiangDay_Edit(?,?,?,?)}");
			cstmt.setLong(1, ttgd.getMaGV());
			cstmt.setLong(2, ttgd.getMaMH());
			cstmt.setLong(3, ttgd.getMaLop());
			cstmt.setLong(4, ttgd.getMaHK());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void remove(ThongTinGiangDay ttgd) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spGiangDay_Remove(?,?)}");
			cstmt.setLong(1, ttgd.getMaGV());
			cstmt.setLong(2, ttgd.getMaMH());
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