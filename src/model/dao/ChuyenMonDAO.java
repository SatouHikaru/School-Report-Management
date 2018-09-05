package model.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.ChuyenMon;

public class ChuyenMonDAO {
	
	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;

	private static ChuyenMonDAO instance;
	public static ChuyenMonDAO getInstance() {
		if (instance == null)
			instance = new ChuyenMonDAO();
		return instance;
	}

	public void add(ChuyenMon chuyenMon) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spChuyenMon_Add(?,?)}");
			cstmt.setLong(1, chuyenMon.getMaGV());
			cstmt.setLong(2, chuyenMon.getMaMH());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void edit(long maGV, String chuyenMon) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spChuyenMon_Edit(?,?)}");
			cstmt.setLong(1, maGV);
			cstmt.setString(2, chuyenMon);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}

	public void removeByMaGV(long maGV) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spChuyenMon_DeleteByMaGV(?)}");
			cstmt.setLong(1, maGV);
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
