/**
 * TaiKhoanDAO
 *
 * Version 1.0
 *
 * Date: 2018-08-06
 *
 * Modification Logs:
 * DATE		   AUTHOR		DESCRIPTION
 *--------------------------------------
 * 2018-08-06	Naa		Create
 */

package model.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.TaiKhoan;

public class TaiKhoanDAO {
	Database db = new Database();
	CallableStatement cstmt = null;
	ResultSet rs = null;
	
	private static TaiKhoanDAO instance;
	public static TaiKhoanDAO getInstance() {
		if (instance == null)
			instance = new TaiKhoanDAO();
		return instance;
	}
	
	public boolean login(TaiKhoan account) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spLogin(?,?)}");
			cstmt.setString(1, account.getTenDangNhap());
			cstmt.setString(2, account.getMatKhau());
			rs = cstmt.executeQuery();
			rs.next();
			if (rs.getRow() > 0)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return false;
	}
	
	public void changePassword(TaiKhoan account) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spChangePassword(?,?)}");
			cstmt.setString(1, account.getTenDangNhap());
			cstmt.setString(2, account.getMatKhau());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}

	public ArrayList<String> getRole(TaiKhoan account) throws SQLException {
		ArrayList<String> roles = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spRole(?)}");
			cstmt.setString(1, account.getTenDangNhap());
			rs = cstmt.executeQuery();
			roles = new ArrayList<>();
			while (rs.next())
				roles.add(rs.getString("TenVT"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			if (rs != null)
				rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return roles;
	}

	public void add(TaiKhoan taiKhoan) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spTaiKhoan_Add(?,?)}");
			cstmt.setString(1, taiKhoan.getTenDangNhap());
			cstmt.setString(2, taiKhoan.getMatKhau());
			rs = cstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}

	public String getPassword(String oldPassword) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spTaiKhoan_GetPassword(?)}");
			cstmt.setString(1, oldPassword);
			rs = cstmt.executeQuery();
			rs.next();
			return rs.getString("MatKhau");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			if (rs != null)
				rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return "";
	}
	
}