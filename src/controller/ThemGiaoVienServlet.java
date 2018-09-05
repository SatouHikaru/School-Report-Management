package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.StringProcess;
import model.bean.GiaoVien;
import model.bean.HocSinh;
import model.bean.MonHoc;
import model.bean.TaiKhoan;
import model.bo.ChuyenMonBO;
import model.bo.GiaoVienBO;
import model.bo.HocSinhBO;
import model.bo.MonHocBO;
import model.bo.PhuHuynhBO;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class ThemPhuHuynhServlet
 */
public class ThemGiaoVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ThemGiaoVienServlet() {
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
		} else if (session.getAttribute("giaoVien") != null) {
			try {
				long maGV = GiaoVienBO.getInstance().getID((String)session.getAttribute("userName"));
				RequestDispatcher rd = request.getRequestDispatcher("chitietgiaovien?magv=" + maGV);
				rd.forward(request, response);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		if ("submit".equals(request.getParameter("submit"))) {
			String[] chuyenMon = request.getParameterValues("chuyenMon");
			String tenGV = request.getParameter("hoTen");
			String gioiTinh = request.getParameter("gioiTinh");

			String ngaySinh = request.getParameter("ngaySinh");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");

			String dienThoai = request.getParameter("dienThoai");
			String email = request.getParameter("email");
			String diaChi = request.getParameter("diaChi");

			String[] name = tenGV.split(" ");
			String account = "";
			for (int i = 0; i < name.length; i++) {
				if (i != name.length - 1)
					account += name[i].toLowerCase().substring(0, 1);
				else {
					account = name[i].toLowerCase() + account;
					break;
				}
			}

			long count = 0;
			try {
				count = GiaoVienBO.getInstance().getAccount(tenGV);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String taiKhoan = account;
			if (count != 0)
				taiKhoan += count;

			try {
				GiaoVienBO.getInstance()
						.add(new GiaoVien(tenGV, Boolean.valueOf(gioiTinh), LocalDate.parse(ngaySinh, formatter),
								dienThoai, email, diaChi, StringProcess.removeAccent(taiKhoan)));
				long maGV = GiaoVienBO.getInstance().getID(taiKhoan);
				ChuyenMonBO.getInstance().add(maGV, chuyenMon);
				
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			response.sendRedirect("danhsachgiaovien");
		} else {
			try {
				ArrayList<MonHoc> mh = MonHocBO.getInstance().getAll();
				request.setAttribute("listMH", mh);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			RequestDispatcher rd = request.getRequestDispatcher("giaovien/them.jsp");
			rd.forward(request, response);
		}
	}

}