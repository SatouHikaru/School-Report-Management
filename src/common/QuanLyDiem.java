package common;

import java.util.ArrayList;

import model.bean.Diem;
import model.bean.HocSinh;
import model.bean.MonHoc;

public class QuanLyDiem {
	
	private HocSinh hocSinh1;

	private Diem diem;

	public Diem getDiem() {

		return diem;
	}

	public void setDiem(Diem diem) {
		if (this.diem == null)
			this.diem = new Diem();
		this.diem = diem;
	}

	public HocSinh getHocSinh() {
		return hocSinh1;
	}

	public void setHocSinh(HocSinh hocSinh) {
		if (this.hocSinh1 == null)
			this.hocSinh1 = new HocSinh();
		this.hocSinh1 = hocSinh;
	}
	
	ArrayList<HocSinhCuaGiaoVien> hocSinh = new ArrayList<>();
}
