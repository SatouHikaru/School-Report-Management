package common;

public class LopCuaGiaoVien {
	private long maLop, maNamHoc;
	public long getMaNamHoc() {
		return maNamHoc;
	}
	public void setMaNamHoc(long maNamHoc) {
		this.maNamHoc = maNamHoc;
	}
	private String tenLop, namHoc;
	
	public long getMaLop() {
		return maLop;
	}
	public void setMaLop(long maLop) {
		this.maLop = maLop;
	}
	public String getTenLop() {
		return tenLop;
	}
	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}
	public String getNamHoc() {
		return namHoc;
	}
	public void setNamHoc(String namHoc) {
		this.namHoc = namHoc;
	}
}
