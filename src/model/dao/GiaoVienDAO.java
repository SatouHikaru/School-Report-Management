/**
 * GiaoVienDAO.java
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
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.LopCuaGiaoVien;
import model.bean.Diem;
import model.bean.GiaoVien;
import model.bean.HocSinh;
import model.bean.MonHoc;

public class GiaoVienDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static GiaoVienDAO instance;
	public static GiaoVienDAO getInstance() {
		if (instance == null)
			instance = new GiaoVienDAO();
		return instance;
	}
	
	public ArrayList<GiaoVien> getAll(String term, long maMH) throws SQLException {
		ArrayList<GiaoVien> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spGiaoVien_GetAll(?,?)}");
			cstmt.setString(1, term);
			cstmt.setLong(2, maMH);
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			GiaoVien gv;
			while (rs.next()) {
				gv = new GiaoVien();
				gv.setMaGV(rs.getLong("MaGV"));
				gv.setHoTen(rs.getString("TenGV"));
				gv.setGioiTinh(rs.getBoolean("GioiTinh"));
				gv.setNgaySinh(rs.getDate("NgaySinh").toLocalDate());
				gv.setDiaChi(rs.getString("DiaChi"));
				gv.setEmail(rs.getString("Email"));
				gv.setDienThoai(rs.getString("DienThoai"));
				gv.setChuyenMon(rs.getString("ChuyenMon"));
				
				list.add(gv);
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
	
	public ArrayList<LopCuaGiaoVien> getLopByGiaoVien(long maGV, int maHK, long maNH) throws SQLException {
		ArrayList<LopCuaGiaoVien> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spDiem_DanhSachLopCuaGiaoVien(?,?,?)}");
			cstmt.setLong(1, maGV);
			cstmt.setInt(2, maHK);
			cstmt.setLong(3, maNH);
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			LopCuaGiaoVien l;
			while (rs.next()) {
				l = new LopCuaGiaoVien();
				l.setMaLop(rs.getLong("MaLop"));
				l.setTenLop(rs.getString("TenLop"));
				l.setNamHoc(rs.getString("TenNH"));
				
				list.add(l);
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
	
	public GiaoVien getById(long maGV) throws SQLException {
		GiaoVien gv = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spGiaoVien_GetById(?)}");
			cstmt.setLong("MaGV", maGV);
			rs = cstmt.executeQuery();
			gv = new GiaoVien();
			while (rs.next()) {
				gv.setMaGV(maGV);
				gv.setHoTen(rs.getString("TenGV"));
				gv.setGioiTinh(rs.getBoolean("GioiTinh"));
				gv.setNgaySinh(rs.getDate("NgaySinh").toLocalDate());
				gv.setDienThoai(rs.getString("DienThoai"));
				gv.setEmail(rs.getString("Email"));
				gv.setDiaChi(rs.getString("DiaChi"));
				gv.setTaiKhoan(rs.getString("TaiKhoan"));
				gv.setChuyenMon(rs.getString("ChuyenMon"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return gv;
	}
	
	public void add(GiaoVien gv) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spGiaoVien_Add(?,?,?,?,?,?,?)}");
			cstmt.setString(1, gv.getHoTen());
			cstmt.setBoolean(2, gv.isGioiTinh());
			cstmt.setDate(3, Date.valueOf(gv.getNgaySinh()));
			cstmt.setString(4, gv.getDienThoai());
			cstmt.setString(5, gv.getEmail());
			cstmt.setString(6, gv.getDiaChi());
			cstmt.setString(7, gv.getTaiKhoan());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void edit(GiaoVien gv) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spGiaoVien_Edit(?,?,?,?,?,?,?)}");
			cstmt.setLong(1, gv.getMaGV());
			cstmt.setString(2, gv.getHoTen());
			cstmt.setBoolean(3, gv.isGioiTinh());
			cstmt.setDate(4, Date.valueOf(gv.getNgaySinh()));
			cstmt.setString(5, gv.getDienThoai());
			cstmt.setString(6, gv.getEmail());
			cstmt.setString(7, gv.getDiaChi());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void remove(long maGV) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spGiaoVien_Remove(?)}");
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

	public long getAccount(String tenGV) throws SQLException {
		int count = 0;
		try {
			cstmt = db.getConnection().prepareCall("{call spGiaoVien_GetAccount(?)}");
			cstmt.setString(1, tenGV);
			rs = cstmt.executeQuery();
			while (rs.next())
				count++;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return count;
	}
	
	public long getID(String tenDangNhap) throws SQLException {
		GiaoVien gv = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spGiaoVien_GetID(?)}");
			cstmt.setString(1, tenDangNhap);
			rs = cstmt.executeQuery();
			rs.next();
			gv = new GiaoVien();
			gv.setMaGV(rs.getLong("MaGV"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return gv.getMaGV();
	}

	public ArrayList<HocSinh> getHocSinhByGiaoVien(long maLop, long maNH, long maMH, int maHK) throws SQLException {
		ArrayList<HocSinh> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spDiem_HocSinh(?,?)}");
			cstmt.setLong(1, maLop);
			cstmt.setLong(2, maNH);
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			HocSinh hocSinh;
			while (rs.next()) {
				hocSinh = new HocSinh();	
				hocSinh.setMaHS(rs.getString("MaHS"));
				hocSinh.setHoTen(rs.getString("TenHS"));
				
				Diem diem = DiemDAO.getInstance().getDiemHocSinh(hocSinh.getMaHS(), maMH, maHK, maNH, maLop);
						
				hocSinh.setDiem(diem);															
				
				list.add(hocSinh);
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

	public ArrayList<MonHoc> getMonHoc(int maGV) throws SQLException {
		ArrayList<MonHoc> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spMonHoc_TheoGV(?)}");
			cstmt.setInt(1, maGV);
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			MonHoc monHoc;
			while (rs.next()) {
				monHoc = new MonHoc();	
				monHoc.setMaMH(rs.getInt("MaMH"));
				monHoc.setTenMH(rs.getString("TenMH"));
				
				list.add(monHoc);
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
}