/**
 * GiaoVienBO
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

package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import common.LopCuaGiaoVien;
import model.bean.GiaoVien;
import model.bean.HocSinh;
import model.bean.MonHoc;
import model.dao.GiaoVienDAO;

public class GiaoVienBO {

	private static GiaoVienBO instance;
	public static GiaoVienBO getInstance() {
		if (instance == null)
			instance = new GiaoVienBO();
		return instance;
	}
	
	public ArrayList<GiaoVien> getAll(String term, long maMH) throws SQLException {
		return GiaoVienDAO.getInstance().getAll(term, maMH);
	}
	
	public ArrayList<LopCuaGiaoVien> getLopByGiaoVien(long maGV, int maHK, long maNH) throws SQLException{
		return GiaoVienDAO.getInstance().getLopByGiaoVien(maGV, maHK, maNH);
	}
	
	public ArrayList<HocSinh> getHocSinhByGiaoVien(long maLop, long maNH, long maMH, int maHK) throws SQLException{
		return GiaoVienDAO.getInstance().getHocSinhByGiaoVien(maLop, maNH, maMH, maHK);
	}
	
	public ArrayList<MonHoc> getMonHoc(int maGV) throws SQLException{
		return GiaoVienDAO.getInstance().getMonHoc(maGV);
	}
	
	public GiaoVien getById(long maGV) throws SQLException {
		return GiaoVienDAO.getInstance().getById(maGV);
	}
	
	public void add(GiaoVien gv) throws SQLException {
		GiaoVienDAO.getInstance().add(gv);
	}
	
	public void edit(GiaoVien gv) throws SQLException {
		GiaoVienDAO.getInstance().edit(gv);
	}
	
	public void remove(long maGV) throws SQLException {
		GiaoVienDAO.getInstance().remove(maGV);
	}
	
	public long getAccount(String tenGV) throws SQLException {
		return GiaoVienDAO.getInstance().getAccount(tenGV);
	}
	
	public long getID(String tenDangNhap) throws SQLException {
		return GiaoVienDAO.getInstance().getID(tenDangNhap);
	}
	
}