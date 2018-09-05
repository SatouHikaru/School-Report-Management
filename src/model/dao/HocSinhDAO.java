/**
 * HocSinhDAO
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
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.HocSinh;

public class HocSinhDAO {
	
	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static HocSinhDAO instance;
	public static HocSinhDAO getInstance() {
		if (instance == null)
			instance = new HocSinhDAO();
		return instance;
	}
	
	public ArrayList<HocSinh> getAll(String term, long maLop, long maNH) throws SQLException {
		ArrayList<HocSinh> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spHocSinh_GetAll(?,?,?)}");
			cstmt.setString(1, term);
			cstmt.setLong(2, maLop);
			cstmt.setLong(3, maNH);
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			HocSinh hs;
			while (rs.next()) {
				hs = new HocSinh();
				hs.setMaHS(rs.getString("MaHS"));
				hs.setHoTen(rs.getString("TenHS"));
				hs.setGioiTinh(rs.getBoolean("GioiTinh"));
				hs.setNgaySinh(rs.getDate("NgaySinh").toLocalDate());
				hs.setDienThoai(rs.getString("DienThoai"));
				hs.setDiaChi(rs.getString("DiaChi"));
				
				list.add(hs);
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
	
	public HocSinh getById(String maHS) throws SQLException {
		HocSinh hs = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spHocSinh_GetById(?)}");
			cstmt.setString("MaHS", maHS);
			rs = cstmt.executeQuery();
			hs = new HocSinh();
			while (rs.next()) {
				hs.setMaHS(rs.getString("MaHS"));
				hs.setHoTen(rs.getString("TenHS"));
				hs.setGioiTinh(rs.getBoolean("GioiTinh"));
				hs.setNgaySinh(rs.getDate("NgaySinh").toLocalDate());
				hs.setDienThoai(rs.getString("DienThoai"));
				hs.setDiaChi(rs.getString("DiaChi"));
				//hs.setMaLop(rs.getLong("MaLop"));
				hs.setTenLop(rs.getString("TenLop"));
				hs.setMaPH(rs.getLong("MaPH"));
//				hs.setPhuHuynh(rs.getString("TenPH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return hs;
	}
	
	public ArrayList<HocSinh> getByClass(long maLop) throws SQLException {
		ArrayList<HocSinh> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spDiem_HocSinhTheoLop(?)}");
			cstmt.setLong("MaLop", maLop);
			rs = cstmt.executeQuery();
			list = new ArrayList<HocSinh>();
			HocSinh hs;
			while (rs.next()) {
				hs = new HocSinh();
				hs.setMaHS(rs.getString("MaHS"));
				hs.setHoTen(rs.getString("TenHS"));
				
				list.add(hs);
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
	public void add(HocSinh hs) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHocSinh_Add(?,?,?,?,?,?,?)}");
			cstmt.setString("TenHS", hs.getHoTen());
			cstmt.setBoolean("GioiTinh", hs.isGioiTinh());
			cstmt.setDate("NgaySinh", Date.valueOf(hs.getNgaySinh()));
			cstmt.setString("DienThoai", hs.getDienThoai());
			cstmt.setString("DiaChi", hs.getDiaChi());
			cstmt.setLong("MaLop", hs.getMaLop());
			cstmt.setLong("MaPH", hs.getMaPH());
			cstmt.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public String addAndGetId(HocSinh hs) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHocSinh_Add(?,?,?,?,?,?,?)}");
			cstmt.setString("TenHS", hs.getHoTen());
			cstmt.setBoolean("GioiTinh", hs.isGioiTinh());
			cstmt.setDate("NgaySinh", Date.valueOf(hs.getNgaySinh()));
			cstmt.setString("DienThoai", hs.getDienThoai());
			cstmt.setString("DiaChi", hs.getDiaChi());
			cstmt.setLong("MaLop", hs.getMaLop());
			cstmt.setLong("MaPH", hs.getMaPH());
			
			rs = cstmt.executeQuery();	
			
			if(rs.next())
				return rs.getString(1);
			return "";
			
			
		} catch (SQLException e) {
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n" + e.getStackTrace());
			return "";
		} finally {
			cstmt.close();
			if (rs != null)
				rs.close();
			db.closeConnection();
		}
	}
	
	public void edit(HocSinh hs) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHocSinh_Edit(?,?,?,?,?,?,?,?)}");
			cstmt.setString("MaHS", hs.getMaHS());
			cstmt.setString("TenHS", hs.getHoTen());
			cstmt.setBoolean("GioiTinh", hs.isGioiTinh());
			cstmt.setDate("NgaySinh", Date.valueOf(hs.getNgaySinh()));
			cstmt.setString("DienThoai", hs.getDienThoai());
			cstmt.setString("DiaChi", hs.getDiaChi());
			cstmt.setLong("MaLop", hs.getMaLop());
			cstmt.setLong("MaPH", hs.getMaPH());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void remove(String maHS) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHocSinh_Remove(?)}");
			cstmt.setString("MaHS", maHS);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}

	public ArrayList<HocSinh> getHocSinh(long maPH) throws SQLException {
		ArrayList<HocSinh> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spPhuHuynh_GetHocSinh(?)}");
			cstmt.setLong(1, maPH);
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			HocSinh hs;
			while (rs.next()) {
				hs = new HocSinh();
				hs.setMaHS(rs.getString("MaHS"));
				hs.setHoTen(rs.getString("TenHS"));
				
				list.add(hs);
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

	public long getPhuHuynh(String maHS) throws SQLException {
		HocSinh hs = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spHocSinh_GetPhuHuynh(?)}");
			cstmt.setString(1, maHS);
			rs = cstmt.executeQuery();
			rs.next();
			hs = new HocSinh();
			hs.setMaHS(rs.getString("MaPH"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return hs.getMaPH();
	}
	
}