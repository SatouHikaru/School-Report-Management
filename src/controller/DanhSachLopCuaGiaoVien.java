package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.LopCuaGiaoVien;
import common.StringProcess;
import model.bean.HocKy;
import model.bean.HocSinh;
import model.bean.NamHoc;
import model.bean.TaiKhoan;
import model.bo.GiaoVienBO;
import model.bo.HocKyBO;
import model.bo.HocSinhBO;
import model.bo.NamHocBO;
import model.bo.PhuHuynhBO;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class DanhSachLopCuaGiaoVien
 */
public class DanhSachLopCuaGiaoVien extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DanhSachLopCuaGiaoVien() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("userName") == null) {
			String uri = request.getRequestURI();
			session.setAttribute("uri", uri);
			response.sendRedirect("login");
			return;
		} else {
			String username = (String)session.getAttribute("userName");
			ArrayList<String> roles;
			try {
				roles = TaiKhoanBO.getInstance().getRole(new TaiKhoan(username));
				if (roles.size() > 0)
					for (String role : roles) {
						if (role.equals("Admin"))
							session.setAttribute("admin", role);
						else if (role.equals("Học sinh"))
							session.setAttribute("hocSinh", role);
						else if (role.equals("Giáo viên"))
							session.setAttribute("giaoVien", role);
						else if (role.equals("Phụ huynh"))
							session.setAttribute("phuHuynh", role);
					}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (session.getAttribute("hocSinh") != null) {
			RequestDispatcher rd = request.getRequestDispatcher("chitiethocsinh?mahs=" + session.getAttribute("userName"));
			rd.forward(request, response);
			return;
		} else if (session.getAttribute("phuHuynh") != null) {
			try {
				long maPH = PhuHuynhBO.getInstance().getID((String)session.getAttribute("userName"));
				ArrayList<HocSinh> hocSinh = HocSinhBO.getInstance().getHocSinh(maPH);
				session.setAttribute("listHS", hocSinh);
				RequestDispatcher rd = request.getRequestDispatcher("chitietphuhuynh?maph=" + maPH);
				rd.forward(request, response);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			
			return;
		}
		
		try {
			// Danh sách năm học
			ArrayList<NamHoc> nh = NamHocBO.getInstance().getAll();
			
			// Danh sách học kỳ
			ArrayList<HocKy> listHK = HocKyBO.getInstance().getAll();

			request.setAttribute("listNH", nh);
			request.setAttribute("listHK", listHK);

			long maGV = StringProcess.ifNullToLong(request.getParameter("maGV"));
			long maNH = StringProcess.ifNullToLong(request.getParameter("maNH"));
			int maHK = StringProcess.ifNullToInt(request.getParameter("maHK"));
			ArrayList<LopCuaGiaoVien> lop = GiaoVienBO.getInstance().getLopByGiaoVien(maGV, maHK, maNH);
			request.setAttribute("listLopCuaGV", lop);
			RequestDispatcher rd = request.getRequestDispatcher("diem/danhSachLop.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
