/**
 * PhuHuynhDAO
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

import model.bean.PhuHuynh;

public class PhuHuynhDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;

	private static PhuHuynhDAO instance;

	public static PhuHuynhDAO getInstance() {
		if (instance == null)
			instance = new PhuHuynhDAO();
		return instance;
	}

	public ArrayList<PhuHuynh> getAll(String term, long maLop) throws SQLException {
		ArrayList<PhuHuynh> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spPhuHuynh_GetAll(?,?)}");
			cstmt.setString(1, term);
			cstmt.setLong(2, maLop);
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			PhuHuynh ph;
			while (rs.next()) {
				ph = new PhuHuynh();
				ph.setMaPH(rs.getLong("MaPH"));
				ph.setHoTen(rs.getString("TenPH"));
				ph.setGioiTinh(rs.getBoolean("GioiTinh"));
				ph.setNgaySinh(rs.getDate("NgaySinh").toLocalDate());
				ph.setDienThoai(rs.getString("DienThoai"));
				ph.setEmail(rs.getString("Email"));
				ph.setDiaChi(rs.getString("DiaChi"));

				list.add(ph);
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

	public PhuHuynh getById(long maPH) throws SQLException {
		PhuHuynh ph = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spPhuHuynh_GetById(?)}");
			cstmt.setLong("MaPH", maPH);
			rs = cstmt.executeQuery();
			ph = new PhuHuynh();
			while (rs.next()) {
				ph.setMaPH(maPH);
				ph.setHoTen(rs.getString("TenPH"));
				ph.setGioiTinh(rs.getBoolean("GioiTinh"));
				ph.setNgaySinh(rs.getDate("NgaySinh").toLocalDate());
				ph.setDienThoai(rs.getString("DienThoai"));
				ph.setEmail(rs.getString("Email"));
				ph.setDiaChi(rs.getString("DiaChi"));
				ph.setTaiKhoan(rs.getString("TaiKhoan"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}

		return ph;
	}

	public void add(PhuHuynh ph) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spPhuHuynh_Add(?,?,?,?,?,?)}");
			cstmt.setString("TenPH", ph.getHoTen());
			cstmt.setBoolean("GioiTinh", ph.isGioiTinh());
			cstmt.setDate("NgaySinh", Date.valueOf(ph.getNgaySinh()));
			cstmt.setString("DienThoai", ph.getDienThoai());
			cstmt.setString("Email", ph.getEmail());
			cstmt.setString("DiaChi", ph.getDiaChi());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}

	public long addAndGetId(PhuHuynh ph) throws SQLException {
		ResultSet rs = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spPhuHuynh_Add(?,?,?,?,?,?,?)}");
			cstmt.setString(1, ph.getHoTen());
			cstmt.setBoolean(2, ph.isGioiTinh());
			cstmt.setDate(3, Date.valueOf(ph.getNgaySinh()));
			cstmt.setString(4, ph.getDienThoai());
			cstmt.setString(5, ph.getEmail());
			cstmt.setString(6, ph.getDiaChi());
			cstmt.setString(7, ph.getTaiKhoan());
			rs = cstmt.executeQuery();
			if (rs.next()) {
				return rs.getLong(1);
			}
			return 0;

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
			return 0;
		} finally {
			cstmt.close();
			if (rs != null)
				rs.close();
			db.closeConnection();
		}
	}

	public void edit(PhuHuynh ph) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spPhuHuynh_Edit(?,?,?,?,?,?,?)}");
			cstmt.setLong(1, ph.getMaPH());
			cstmt.setString(2, ph.getHoTen());
			cstmt.setBoolean(3, ph.isGioiTinh());
			cstmt.setDate(4, Date.valueOf(ph.getNgaySinh()));
			cstmt.setString(5, ph.getDienThoai());
			cstmt.setString(6, ph.getEmail());
			cstmt.setString(7, ph.getDiaChi());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}

	public void remove(long maPH) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spPhuHuynh_Remove(?)}");
			cstmt.setLong("MaPH", maPH);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public long getID(String tenDangNhap) throws SQLException {
		PhuHuynh ph = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spPhuHuynh_GetID(?)}");
			cstmt.setString(1, tenDangNhap);
			rs = cstmt.executeQuery();
			rs.next();
			ph = new PhuHuynh();
			ph.setMaPH(rs.getLong("MaPH"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return ph.getMaPH();
	}

	public long getAccount(String tenPH) throws SQLException {
		PhuHuynh ph = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spPhuHuynh_GetAccount(?)}");
			cstmt.setString(1, tenPH);
			rs = cstmt.executeQuery();
			rs.next();
			ph = new PhuHuynh();
			ph.setMaPH(rs.getLong("MaPH"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			if (rs != null)
				rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return ph.getMaPH();
	}

	public String layTaiKhoan(String maPH) throws SQLException {
		PhuHuynh ph = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spPhuHuynh_LayTaiKhoan(?)}");
			cstmt.setString(1, maPH);
			rs = cstmt.executeQuery();
			rs.next();
			ph = new PhuHuynh();
			ph.setTaiKhoan(rs.getString("TaiKhoan"));
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			if (rs != null)
				rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return ph.getTaiKhoan();
	}

}