/**
 * LopDAO
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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Lop;

public class LopDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;

	private static LopDAO instance;

	public static LopDAO getInstance() {
		if (instance == null)
			instance = new LopDAO();
		return instance;
	}

	public ArrayList<Lop> getAll() throws SQLException {
		ArrayList<Lop> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spLop_GetAll}");
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			Lop l;
			while (rs.next()) {
				l = new Lop();
				l.setMaLop(rs.getLong("MaLop"));
				l.setTenLop(rs.getString("TenLop"));
				l.setSiSo(rs.getInt("SiSo"));

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

	public Lop getById(long maLop) throws SQLException {
		Lop l = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spLop_GetById(?)}");
			cstmt.setLong("MaLop", maLop);
			rs = cstmt.executeQuery();
			l = new Lop();
			while (rs.next()) {
				l.setMaLop(maLop);
				l.setTenLop(rs.getString("TenLop"));
				l.setTenNamHoc(rs.getString("LopNH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}

		return l;
	}

	public ArrayList<Lop> getByYear(long maNH) throws SQLException {
		ArrayList<Lop> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spLop_GetByYear(?)}");
			cstmt.setLong("MaNH", maNH);
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			Lop l;
			while (rs.next()) {
				l = new Lop();
				l.setMaLop(rs.getLong("MaLop"));
				l.setTenLop(rs.getString("TenLop"));
				l.setSiSo(rs.getInt("SiSo"));
				l.setNamHoc(rs.getLong("MaNH"));

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

	public long add(Lop l) throws SQLException {
		Lop lop = new Lop();
		try {
			cstmt = db.getConnection().prepareCall("{call spLop_Add(?)}");
			cstmt.setString("TenLop", l.getTenLop());
			rs = cstmt.executeQuery();
			if (rs.next()) {
				lop.setMaLop(rs.getInt("MaLop"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			rs.close();
			db.closeConnection();
		}
		return lop.getMaLop();
	}

	public void edit(Lop l) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spLop_Edit(?,?)}");
			cstmt.setLong("MaLop", l.getMaLop());
			cstmt.setString("TenLop", l.getTenLop());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}

	public void remove(long maLop) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spLop_Remove(?)}");
			cstmt.setLong("MaLop", maLop);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}

	public ArrayList<Lop> getLopCuaHocSinh(String maHS) throws SQLException {
		ArrayList<Lop> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spLop_CuaHocSinh(?)}");
			cstmt.setString(1, maHS);
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			Lop l;
			while (rs.next()) {
				l = new Lop();
				l.setMaLop(rs.getLong("MaLop"));
				l.setTenLop(rs.getString("TenLop"));
				l.setSiSo(rs.getInt("SiSo"));

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

}