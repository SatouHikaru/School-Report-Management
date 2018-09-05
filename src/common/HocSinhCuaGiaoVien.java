package common;

import model.bean.Diem;
import model.bean.HocSinh;
import model.bean.MonHoc;

public class HocSinhCuaGiaoVien {
	
	private HocSinh hocSinh;
	
	private Diem diem;
		
	public Diem getDiem() {
		
		return diem;
	}
	public void setDiem(Diem diem) {
		if(this.diem == null)
			this.diem = new Diem();
		this.diem = diem;
	}
	public HocSinh getHocSinh() {		
		return hocSinh;
	}
	public void setHocSinh(HocSinh hocSinh) {
		if(this.hocSinh == null)
			this.hocSinh = new HocSinh();
		this.hocSinh = hocSinh;
	}
	
}
