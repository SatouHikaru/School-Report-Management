/**
 * ChiTietHocBaDAO
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

import model.bean.ChiTietHocBa;
import model.bean.KetQuaHocTap;

public class ChiTietHocBaDAO {

	Database db = new Database();
	CallableStatement cstmt;
	ResultSet rs;
	
	private static ChiTietHocBaDAO instance;
	public static ChiTietHocBaDAO getInstance() {
		if (instance == null)
			instance = new ChiTietHocBaDAO();
		return instance;
	}
	
	
	public ArrayList<KetQuaHocTap> ketQuaHocTap(String maHS, int maLop, int maNH) throws SQLException {
		ArrayList<KetQuaHocTap>  list  = null;
		try {
			cstmt = db.getConnection().prepareCall("{call spGetHocBa(?,?,?)}");
			cstmt.setString(1, maHS);
			cstmt.setInt(2, maLop);
			cstmt.setInt(3, maNH);
			list = new ArrayList<>();
			KetQuaHocTap model = null; 
			rs = cstmt.executeQuery();
			while (rs.next()) {
				model = new KetQuaHocTap();
				model.setTenMH(rs.getString("TenMH"));
				model.setHk1(rs.getFloat("HK1"));
				model.setHk2(rs.getFloat("HK2"));
				model.setCaNam(rs.getFloat("CaNam"));
				list.add(model);
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
	
	public void capNhat(ChiTietHocBa model) throws SQLException {
		try {
			cstmt = db.getConnection().prepareCall("{call spHocBa_CapNhat(?,?,?,?,?,?,?,?,?)}");
			cstmt.setString(1, model.getMaHS());
			cstmt.setInt(2, model.getMaLop());
			cstmt.setInt(3, model.getMaNH());
			cstmt.setString(4, model.getHocLuc());
			cstmt.setString(5, model.getHanhKiem());
			cstmt.setString(6, model.getNhanXet());
			cstmt.setInt(7, model.getNgayNghi());
			cstmt.setFloat(8, model.getDiemCaNam());
			cstmt.setInt(9, model.getMaHK());
			
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			db.closeConnection();
		}
	} 
	
	public ChiTietHocBa getChiTietHocBa(String maHS, int maLop, int maNH) throws SQLException {
		ChiTietHocBa hocBa = new ChiTietHocBa();
		try {
			cstmt = db.getConnection().prepareCall("{call spChiTietHocBa_Get(?,?,?)}");
			cstmt.setString(1, maHS);
			cstmt.setInt(2, maLop);
			cstmt.setInt(3, maNH);
			rs = cstmt.executeQuery();
			ChiTietHocBa model = null;
			while(rs.next()) {
				model = new ChiTietHocBa();
				model.setDiemCaNam(rs.getFloat("DiemCaNam"));
				model.setHanhKiem(rs.getString("HanhKiem"));
				model.setHocLuc(rs.getString("HocLuc"));
				model.setNhanXet(rs.getString("NhanXet"));
				model.setNgayNghi(rs.getInt("SoNgayNghi"));
				model.setMaHK(rs.getInt("MaHK"));
				
				hocBa.getDsChiTiet().add(model);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The system has encountered an unexpected problem, sincerely sorry!!!\n");
		} finally {
			cstmt.close();
			rs.close();
			db.closeConnection();
		}
		return hocBa;
	}
	
}