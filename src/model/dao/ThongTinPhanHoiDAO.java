/**
 * ThongTinPhanHoiDAO.java
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

import model.bean.ThongTinPhanHoi;

public class ThongTinPhanHoiDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static ThongTinPhanHoiDAO instance;
	public static ThongTinPhanHoiDAO getInstance() {
		if (instance == null)
			instance = new ThongTinPhanHoiDAO();
		return instance;
	}
	
	public ArrayList<ThongTinPhanHoi> getAll() throws SQLException {
		ArrayList<ThongTinPhanHoi> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spThongTinPhanHoi_GetAll}");
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			ThongTinPhanHoi ttph;
			while (rs.next()) {
				ttph = new ThongTinPhanHoi();
				ttph.setIdPH(rs.getLong("IdPH"));
				ttph.setTieuDe(rs.getString("TieuDe"));
				ttph.setNoiDung(rs.getString("NoiDung"));
				ttph.setEmail(rs.getString("Email"));
				ttph.setDienThoai(rs.getString("DienThoai"));
				ttph.setNguoiPhanHoi(rs.getString("NguoiPhanHoi"));
				ttph.setNgayGui(rs.getDate("NgayGui"));
				
				list.add(ttph);
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
	
	public ThongTinPhanHoi getById(long idPH) throws SQLException {
		ThongTinPhanHoi ttph = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spThongTinPhanHoi_GetById(?)}");
			cstmt.setLong("IdPH", idPH);
			rs = cstmt.executeQuery();
			ttph = new ThongTinPhanHoi();
			while (rs.next()) {
				ttph.setIdPH(idPH);
				ttph.setTieuDe(rs.getString("TieuDe"));
				ttph.setNoiDung(rs.getString("NoiDung"));
				ttph.setEmail(rs.getString("Email"));
				ttph.setDienThoai(rs.getString("DienThoai"));
				ttph.setNguoiPhanHoi(rs.getString("NguoiPhanHoi"));
				ttph.setNgayGui(rs.getDate("NgayGui"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}
		
		return ttph;
	}
	
	public void add(ThongTinPhanHoi ttph) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spThongTinPhanHoi_Add(?,?,?,?,?,?)}");
			cstmt.setString(1, ttph.getTieuDe());
			cstmt.setString(2, ttph.getNoiDung());
			cstmt.setString(3, ttph.getEmail());
			cstmt.setString(4, ttph.getDienThoai());
			cstmt.setString(5, ttph.getNguoiPhanHoi());
			cstmt.setDate(6, ttph.getNgayGui());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void edit(ThongTinPhanHoi ttph) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spThongTinPhanHoi_Add(?,?,?,?,?,?,?)}");
			cstmt.setLong(1, ttph.getIdPH());
			cstmt.setString(2, ttph.getTieuDe());
			cstmt.setString(3, ttph.getNoiDung());
			cstmt.setString(4, ttph.getEmail());
			cstmt.setString(5, ttph.getDienThoai());
			cstmt.setString(6, ttph.getNguoiPhanHoi());
			cstmt.setDate(7, ttph.getNgayGui());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public void remove(long idPH) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spThongTinPhanHoi_Remove(?)}");
			cstmt.setLong(1, idPH);
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