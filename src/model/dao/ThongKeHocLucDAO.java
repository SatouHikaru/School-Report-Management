/**
 * ThongKeHocLucDAO
 *
 * Version 1.0
 *
 * Date: 15-08-2018
 *
 * Copyright
 *
 * Modification Logs:
 * DATE           AUTHOR             DESCRIPTION
 * -----------------------------------
 * 15-08-2018     HCD-Fresher137     Create
 */

package model.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.ThongKeHocLuc;

public class ThongKeHocLucDAO {
	
	Database db = new Database();
	CallableStatement cstmt = null;
	ResultSet rs = null;
	
	private static ThongKeHocLucDAO instance;
	public static ThongKeHocLucDAO getInstance() {
		if (instance == null)
			instance = new ThongKeHocLucDAO();
		return instance;
	}
	
	public ArrayList<ThongKeHocLuc> getAll(long maNH, long maLop, int maHK, String maHL) throws SQLException {
		ArrayList<ThongKeHocLuc> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spThongKeHocLuc_Get(?,?,?,?)}");
			cstmt.setLong(1, maNH);
			cstmt.setLong(2, maLop);
			cstmt.setInt(3, maHK);
			cstmt.setString(4, maHL);
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			ThongKeHocLuc thongKeHocLuc;
			while (rs.next()) {
				thongKeHocLuc = new ThongKeHocLuc();
				thongKeHocLuc.setTenHS(rs.getString("TenHS"));
				thongKeHocLuc.setGioiTinh(rs.getBoolean("GioiTinh"));
				thongKeHocLuc.setNgaySinh(rs.getDate("NgaySinh").toLocalDate());
				thongKeHocLuc.setLop(rs.getString("TenLop"));
				
				list.add(thongKeHocLuc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			if (rs != null)
				rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return list;
	}
	
	public int demSoHocSinhGioi(long maNH, long maLop, int maHK) throws SQLException {
		ThongKeHocLuc tkhl = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spThongKeHocLucGioi(?,?,?)}");
			cstmt.setLong(1, maNH);
			cstmt.setLong(2, maLop);
			cstmt.setInt(3, maHK);
			rs = cstmt.executeQuery();
			tkhl = new ThongKeHocLuc();
			while (rs.next())
				tkhl.setSoLuong(rs.getInt("SoLuong"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			if (rs != null)
				rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return tkhl.getSoLuong();
	}
	
	public int demSoHocSinhKha(long maNH, long maLop, int maHK) throws SQLException {
		ThongKeHocLuc tkhl = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spThongKeHocLucKha(?,?,?)}");
			cstmt.setLong(1, maNH);
			cstmt.setLong(2, maLop);
			cstmt.setInt(3, maHK);
			rs = cstmt.executeQuery();
			tkhl = new ThongKeHocLuc();
			while (rs.next())
				tkhl.setSoLuong(rs.getInt("SoLuong"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			if (rs != null)
				rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return tkhl.getSoLuong();
	}
	
	public int demSoHocSinhTrungBinh(long maNH, long maLop, int maHK) throws SQLException {
		ThongKeHocLuc tkhl = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spThongKeHocLucTrungBinh(?,?,?)}");
			cstmt.setLong(1, maNH);
			cstmt.setLong(2, maLop);
			cstmt.setInt(3, maHK);
			rs = cstmt.executeQuery();
			tkhl = new ThongKeHocLuc();
			while (rs.next())
				tkhl.setSoLuong(rs.getInt("SoLuong"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			if (rs != null)
				rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return tkhl.getSoLuong();
	}
	
	public int demSoHocSinhYeu(long maNH, long maLop, int maHK) throws SQLException {
		ThongKeHocLuc tkhl = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spThongKeHocLucYeu(?,?,?)}");
			cstmt.setLong(1, maNH);
			cstmt.setLong(2, maLop);
			cstmt.setInt(3, maHK);
			rs = cstmt.executeQuery();
			tkhl = new ThongKeHocLuc();
			while (rs.next())
				tkhl.setSoLuong(rs.getInt("SoLuong"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			if (rs != null)
				rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return tkhl.getSoLuong();
	}
	
	public int demSoHocSinhKem(long maNH, long maLop, int maHK) throws SQLException {
		ThongKeHocLuc tkhl = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spThongKeHocLucKem(?,?,?)}");
			cstmt.setLong(1, maNH);
			cstmt.setLong(2, maLop);
			cstmt.setInt(3, maHK);
			rs = cstmt.executeQuery();
			tkhl = new ThongKeHocLuc();
			while (rs.next())
				tkhl.setSoLuong(rs.getInt("SoLuong"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			if (rs != null)
				rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return tkhl.getSoLuong();
	}
	
}