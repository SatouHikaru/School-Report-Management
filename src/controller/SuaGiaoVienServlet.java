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
 * Servlet implementation class SuaGiaoVienServlet
 */
public class SuaGiaoVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SuaGiaoVienServlet() {
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
		String maGV = request.getParameter("magv");
		if ("submit".equals(request.getParameter("submit"))) {
			String[] chuyenMon = request.getParameterValues("chuyenMon");
			String tenGV = request.getParameter("hoTen");
			String gioiTinh = request.getParameter("gioiTinh");

			String ngaySinh = request.getParameter("ngaySinh");

			String dienThoai = request.getParameter("dienThoai");
			String email = request.getParameter("email");
			String diachi = request.getParameter("diaChi");

			try {
				GiaoVienBO.getInstance().edit(new GiaoVien(Long.valueOf(maGV), tenGV, Boolean.valueOf(gioiTinh),
						LocalDate.parse(ngaySinh, formatter), dienThoai, email, diachi));

				ChuyenMonBO.getInstance().edit(Long.valueOf(maGV), chuyenMon);

			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("danhsachgiaovien");
		} else {
			ArrayList<MonHoc> mh = null;
			ArrayList<Long> chuyenMon = new ArrayList<>();
			String[] chuyenMonText = null;
			GiaoVien gv = null;
			try {
				mh = MonHocBO.getInstance().getAll();
				gv = GiaoVienBO.getInstance().getById(Long.valueOf(maGV));
				if (gv != null) {
					if (gv.getChuyenMon() != null)
						chuyenMonText = gv.getChuyenMon().split(",");
					if (chuyenMonText != null)
						for (String cm : chuyenMonText) {
							chuyenMon.add(Long.parseLong(cm));
						}
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("listMH", mh);
			request.setAttribute("giaoVien", gv);
			request.setAttribute("chuyenMon", chuyenMon);
			RequestDispatcher rd = request.getRequestDispatcher("giaovien/sua.jsp");
			rd.forward(request, response);
		}
	}

}