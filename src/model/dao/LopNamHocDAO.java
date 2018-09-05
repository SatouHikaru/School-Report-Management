package model.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LopNamHocDAO {
	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static LopNamHocDAO instance;

	public static LopNamHocDAO getInstance() {
		if (instance == null)
			instance = new LopNamHocDAO();
		return instance;
	}
	
	public void add(int maLop, int maNH) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spLopNH_Add(?,?)}");
			cstmt.setLong(1, maLop);
			cstmt.setLong(2, maNH);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void edit(long maLop, String namHoc) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spLopNH_Edit(?,?)}");
			cstmt.setLong(1, maLop);
			cstmt.setString(2, namHoc);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}

	public void removeByMaLop(long maLop) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spLopNH_DeleteByMaLop(?)}");
			cstmt.setLong(1, maLop);
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
