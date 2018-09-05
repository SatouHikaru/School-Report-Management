/**
 * DiemDAO
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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Diem;
import model.bean.HocKy;
import model.bean.Lop;
import model.bean.MonHoc;
import model.bean.NamHoc;

public class DiemDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;

	private static DiemDAO instance;

	public static DiemDAO getInstance() {
		if (instance == null)
			instance = new DiemDAO();
		return instance;
	}

	public ArrayList<Diem> getAll() throws SQLException {
		ArrayList<Diem> list = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spDiem_GetAll}");
			rs = cstmt.executeQuery();
			list = new ArrayList<>();
			Diem diem;
			while (rs.next()) {
				diem = new Diem();
				diem.setMaMH(rs.getLong("MaMH"));
				diem.setMaHS(rs.getString("MaHS"));
				diem.setMaNH(rs.getLong("MaNH"));
				diem.setMaHK(rs.getInt("MaHK"));
				diem.setMaLop(rs.getLong("MaLop"));
				diem.setDiemMieng(rs.getString("DiemMieng"));
				diem.setDiem15Phut(rs.getString("Diem15Phut"));
				diem.setDiem1Tiet(rs.getString("Diem1Tiet"));
				diem.setDiemThi(rs.getFloat("DiemThi"));
				diem.setDiemTongKet(rs.getFloat("DiemTK"));

				list.add(diem);
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

	public Diem getById(long maHS, long maMH) throws SQLException {
		Diem diem = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spDiem_GetById(?,?)}");
			cstmt.setLong(1, maHS);
			cstmt.setLong(1, maMH);
			rs = cstmt.executeQuery();
			diem = new Diem();
			while (rs.next()) {
				diem.setTenHS(rs.getString("TenHS"));
				diem.setTenMH(rs.getString("TenMH"));
				diem.setHocKy(rs.getInt("TenHK"));
				diem.setTenGV(rs.getString("TenGV"));
				diem.setDiemTongKet(rs.getFloat("DiemTK"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			rs.close();
			cstmt.close();
			db.closeConnection();
		}

		return diem;
	}

	public void add(Diem diem) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spDiem_Add(?,?,?,?,?)}");
			cstmt.setString("MaHS", diem.getMaHS());
			cstmt.setLong("MaMH", diem.getMaMH());
			cstmt.setInt("MaHK", diem.getMaHK());
			cstmt.setLong("MaGV", diem.getMaGV());
			cstmt.setFloat("DiemTK", diem.getDiemTongKet());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}
	
	public Diem getDiemHocSinh(String maHS, long maMH, int maHK, long maNH, long maLop) throws SQLException {
		Diem d  = new Diem();;
		try {
			cstmt = db.getConnection().prepareCall("{call spDiem_GetDiemHocSinh(?,?,?,?,?)}");
			cstmt.setString("MaHS", maHS);
			cstmt.setLong("MaMH", maMH);
			cstmt.setInt("MaHK", maHK);
			cstmt.setLong("MaNH", maNH);
			cstmt.setLong("MaLop", maLop);
			rs = cstmt.executeQuery();
			while(rs.next()) {
				d = new Diem();
				d.setDiem15Phut(rs.getString("Diem15Phut"));
				d.setDiem1Tiet(rs.getString("Diem1Tiet"));
				d.setDiemMieng(rs.getString("DiemMieng"));
				d.setDiemThi(rs.getFloat("DiemThi"));
				d.setDiemTongKet(rs.getFloat("DiemTK"));
			}
			return d;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
			return d;
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}

	public void add(String maHS, long maMH, int maHK) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spDiem_ThemDiem(?,?,?)}");
			cstmt.setString("MaHS", maHS);
			cstmt.setLong("MaMH", maMH);
			cstmt.setInt("MaHK", maHK);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}

	public void add(String maHS, ArrayList<MonHoc> dsMH, ArrayList<HocKy> dsHK, ArrayList<Lop> dsLop, ArrayList<NamHoc> dsNH) throws SQLException {
		PreparedStatement ps = null;
		try {
			db.getConnection().setAutoCommit(false); 
			String query = "INSERT INTO Diem (MaHS, MaMH, MaHK, MaLop, MaNH) VALUES (?, ?, ?, ?, ?)";
			ps = db.getConnection().prepareStatement(query);
			for (MonHoc mh : dsMH) {
				ps.setString(1, maHS);
				ps.setLong(2, mh.getMaMH());
				for (HocKy hk : dsHK) {
					ps.setInt(3, hk.getMaHK());
					for (Lop lop : dsLop) {
						ps.setLong(4, lop.getMaLop());
						for (NamHoc nh : dsNH) {
							ps.setLong(5, nh.getMaNH());
							ps.addBatch();
						}
					}					
				}				
			}
			
			ps.executeBatch();
			db.getConnection().commit(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			if (ps != null)
				ps.close();
			db.closeConnection();
		}
	}

	public void edit(Diem diem) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spDiem_Edit(?,?,?,?,?,?,?,?,?,?,?)}");
			cstmt.setString(1, diem.getMaHS());
			cstmt.setLong(2, diem.getMaMH());
			cstmt.setInt(3, diem.getMaHK());
			cstmt.setLong(4, diem.getMaGV());
			cstmt.setString(5, diem.getDiemMieng());
			cstmt.setString(6, diem.getDiem15Phut());
			cstmt.setString(7, diem.getDiem1Tiet());
			cstmt.setFloat(8, diem.getDiemThi());
			cstmt.setFloat(9, diem.getDiemTongKet());
			cstmt.setLong(10, diem.getMaLop());
			cstmt.setLong(11, diem.getMaNH());
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	}

	public void remove(Diem diem) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spDiem_Remove(?,?,?,?)}");
			cstmt.setString("MaHS", diem.getMaHS());
			cstmt.setLong("MaMH", diem.getMaMH());
			cstmt.setInt("MaHK", diem.getMaHK());
			cstmt.setLong("MaGV", diem.getMaGV());
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