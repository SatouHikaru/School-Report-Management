/**
 * HocSinhBO
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

package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.HocKy;
import model.bean.HocSinh;
import model.bean.Lop;
import model.bean.MonHoc;
import model.bean.NamHoc;
import model.dao.HocSinhDAO;

public class HocSinhBO {

	private static HocSinhBO instance;

	public static HocSinhBO getInstance() {
		if (instance == null)
			instance = new HocSinhBO();
		return instance;
	}

	public ArrayList<HocSinh> getAll(String term, long maLop, long maNH) throws SQLException {
		return HocSinhDAO.getInstance().getAll(term, maLop, maNH);
	}

	public HocSinh getById(String maHS) throws SQLException {
		return HocSinhDAO.getInstance().getById(maHS);
	}

	public ArrayList<HocSinh> getByClass(long maLop) throws SQLException {
		return HocSinhDAO.getInstance().getByClass(maLop);
	}

	public void add(HocSinh hs) throws SQLException {
		HocSinhDAO.getInstance().add(hs);
	}

	public String addAndGetMaHS(HocSinh hs) throws SQLException {
		return HocSinhDAO.getInstance().addAndGetId(hs);
	}

	/**
	 * Hàm thêm học sinh vào bảng điểm, không thêm điểm
	 * 
	 * @return boolean
	 * @throws SQLException
	 */
	public void addDiem(String maHS) throws SQLException {

		ArrayList<MonHoc> dsMH = MonHocBO.getInstance().getAll();
		ArrayList<HocKy> dsHK = HocKyBO.getInstance().getAll();
		ArrayList<NamHoc> dsNH = NamHocBO.getInstance().getAll();
		ArrayList<Lop> dsLop = LopBO.getInstance().getAll();

		DiemBO.getInstance().add(maHS, dsMH, dsHK, dsLop, dsNH);

	}

	public void addDiem() throws SQLException {

		ArrayList<MonHoc> dsMH = MonHocBO.getInstance().getAll();
		ArrayList<HocKy> dsHK = HocKyBO.getInstance().getAll();
		ArrayList<NamHoc> dsNH = NamHocBO.getInstance().getAll();
		ArrayList<Lop> dsLop = LopBO.getInstance().getAll();
		ArrayList<HocSinh> dsHS = HocSinhBO.getInstance().getAll("", 0, 0);
		
		for (HocSinh hocSinh : dsHS) {
			DiemBO.getInstance().add(hocSinh.getMaHS(), dsMH, dsHK, dsLop, dsNH);
		}
	}

	public void edit(HocSinh hs) throws SQLException {
		HocSinhDAO.getInstance().edit(hs);
	}

	public void remove(String maHS) throws SQLException {
		HocSinhDAO.getInstance().remove(maHS);
	}

	public ArrayList<HocSinh> getHocSinh(long maPH) throws SQLException {
		return HocSinhDAO.getInstance().getHocSinh(maPH);
	}

	public long getPhuHuynh(String maHS) throws SQLException {
		return HocSinhDAO.getInstance().getPhuHuynh(maHS);
	}

}