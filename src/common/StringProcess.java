/**
 * StringProcess
 *
 * Version 1.0
 *
 * Date: 10-08-2018
 *
 * Copyright
 *
 * Modification Logs:
 * DATE           AUTHOR             DESCRIPTION
 * -----------------------------------
 * 10-08-2018     HCD-Fresher137     Create
 */

package common;

import java.text.DecimalFormat;
import java.text.Normalizer;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.regex.Pattern;

public class StringProcess {
	
	private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	
	/**
	 * Ham tra ve gioi tinh: 1 = Nam, 0 = Nu
	 * @param val
	 * @return String
	 */
	public static String getGender(boolean gender) {
		if(gender)
			return "Nam";
		return "Nữ";
	}
	
	/**
	 * Ham tra ve ten tai khoan khong dau
	 * @param s
	 * @return String
	 */
	public static String removeAccent(String s) {
		String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		return pattern.matcher(temp).replaceAll("");
	}

	public static String ifNullIsEmpty(String input) {		
		return input == null ? "" : input;
	}
	
	public static long ifNullToLong(String input) {		
		return input == null ? 0 : Long.parseLong(input);
	}
	
	public static int ifNullToInt(String input) {		
		return input == null ? 0 : Integer.parseInt(input);
	}
	
	public static String toFriendlyDateFormat(LocalDate input) {		
		return input.format(formatter);
	}

	public static long ifNullTo1(String input) {
		return input == null ? 1 : Integer.parseInt(input);
	}
	
	public static String showTextIfMarkIsEmpty(String input) {
		return input.isEmpty()? "Chưa nhập điểm" : input;
	}
	
	public static int ifEmptyToNumber(String input, int number) {
		return input.isEmpty()? number : Integer.parseInt(input);
	}	
	
	public static String formatMarkHTML(String input) {
		return input != null ? input.replace(";", " | ") : "";
	}	
	
	public static String formatMark(float input) {
		DecimalFormat frmt = new DecimalFormat("0.0");
		return frmt.format(input);
	}	
	
	public static String xetHocLuc(float diemTB) {
		// < 3,5: kem
		// < 5 yeu
		// < 6.5 TB
		// < 8 Kha
		// < 9 Gioi
		// Xuat Xac
		if(diemTB > 10 && diemTB < 0) {
			return "";
		}
		
		if(diemTB >= 9 && diemTB <= 10) {
			return "Xuất sắc";
		}
		if(diemTB >= 8 && diemTB <9) {
			return "Giỏi";
		}
		if(diemTB >= 6.5 && diemTB < 8) {
			return "Khá";
		}
		if(diemTB >= 5 && diemTB < 6.5) {
			return "Trung bình";
		}
		if(diemTB >= 3.5 && diemTB < 5) {
			return "Yếu";
		}
		
		return "Kém";
	}
	
}