package common;

public class Utilities {
	public static float tinhDiem(int heSo, String chuoiDiem) {
		if(chuoiDiem.isEmpty() || chuoiDiem == null)
			return 0;
		String[] cotDiemArr = chuoiDiem.trim().split(";");
		float tongDiem = 0F;
		for (int i = 0; i < cotDiemArr.length; i++) {
			tongDiem += Float.parseFloat(cotDiemArr[i]) * heSo;
		}
		return tongDiem / (cotDiemArr.length * heSo);
	}
	
	public static String xetDanhHieu(String hocLuc, String hanhKiem) {
		if (hanhKiem.equalsIgnoreCase("Khá")) {
			if (hocLuc.equalsIgnoreCase("Xuất sắc"))
				return "Giỏi";
			else if (hocLuc.equalsIgnoreCase("Giỏi"))
				return "Khá";
			else if (hocLuc.equalsIgnoreCase("Khá"))
				return "Khá";
		} else if (hanhKiem.equalsIgnoreCase("Tốt")) {
			if (hocLuc.equalsIgnoreCase("Xuất sắc"))
				return "Xuất sắc";
			else if (hocLuc.equalsIgnoreCase("Giỏi"))
				return "Giỏi";
			else if (hocLuc.equalsIgnoreCase("Khá"))
				return "Khá";
		}
		
		return "Không có danh hiệu";
	}
	
	public static String xetHanhKiem(String ki1, String ki2) {
		float hk1 = layBacHanhKiem(ki1);
		float hk2 = layBacHanhKiem(ki2);
		float hanhKiem = (hk1 + hk2 * 2) / 3;
		return layHanhKiem(Math.round(hanhKiem));
	}
	
	public static float layBacHanhKiem(String hanhKiem) {
		if(hanhKiem.isEmpty()) return -99;
		if ("Kém".equals(hanhKiem))
			return 1;
		else if ("Yếu".equals(hanhKiem))
			return 2;
		else if ("Trung bình".equals(hanhKiem))
			return 3;
		else if ("Khá".equals(hanhKiem))
			return 4;
		else if ("Tốt".equals(hanhKiem))
			return 5;
		return -99;
	}
	
	public static String layHanhKiem(float bacHK) {
		if (bacHK == 1)
			return "Kém";
		else if (bacHK == 2)
			return "Yếu";
		else if (bacHK == 3)
			return "Trung bình";
		else if (bacHK == 4)
			return "Khá";
		else if (bacHK == 5)
			return "Tốt";
		return "Chưa xét";
	}	
}
