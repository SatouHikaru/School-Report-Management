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

import model.bean.HocSinh;
import model.bean.Lop;
import model.bean.NamHoc;
import model.bean.PhuHuynh;
import model.bean.TaiKhoan;
import model.bo.GiaoVienBO;
import model.bo.HocSinhBO;
import model.bo.LopBO;
import model.bo.NamHocBO;
import model.bo.PhuHuynhBO;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class ThemHocSinhServlet
 */
public class ThemHocSinhServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ThemHocSinhServlet() {
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
			// Thông tin học sinh
			String tenHS = request.getParameter("hoTenHS");
			String gioiTinhHS = request.getParameter("gioiTinhHS");

			String ngaySinhHS = request.getParameter("ngaySinhHS");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

			String dienThoaiHS = request.getParameter("dienThoaiHS");
			String diaChiHS = request.getParameter("diaChiHS");
			String maLop = request.getParameter("lop");

			// Thông tin phụ huynh
			String tenPH = request.getParameter("hoTenPH");
			String gioiTinhPH = request.getParameter("gioiTinhPH");

			String ngaySinhPH = request.getParameter("ngaySinhPH");

			String dienThoaiPH = request.getParameter("dienThoaiPH");
			String email = request.getParameter("emailPH");
			String diaChiPH = request.getParameter("diaChiPH");

			String[] name = tenPH.split(" ");
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
				count = PhuHuynhBO.getInstance().getAccount(tenPH);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String taiKhoan = account;
			if (count != 0)
				taiKhoan += count;
			
			try {
				boolean cbChonPH = Boolean.parseBoolean(request.getParameter("cbChonPH"));

				if (cbChonPH) {
					long maPH = Long.parseLong(request.getParameter("maPHDanhSach"));
					String maHS = HocSinhBO.getInstance()
					.addAndGetMaHS(new HocSinh(tenHS, Boolean.valueOf(gioiTinhHS),
							LocalDate.parse(ngaySinhHS, formatter), dienThoaiHS, diaChiHS,
							Long.valueOf(maLop), maPH));
					TaiKhoanBO.getInstance().add(new TaiKhoan(maHS, maHS));
					HocSinhBO.getInstance().addDiem(maHS);
					
					response.sendRedirect("danhsachhocsinh");
				} else {
					PhuHuynh phuHuynh = new PhuHuynh(tenPH, Boolean.valueOf(gioiTinhPH),
							LocalDate.parse(ngaySinhPH, formatter), dienThoaiPH, email, diaChiPH, taiKhoan);

					long maPH = PhuHuynhBO.getInstance().addAndGetId(phuHuynh);
					TaiKhoanBO.getInstance().add(new TaiKhoan(taiKhoan, taiKhoan));
					if (maPH > 0) {
						String maHS = HocSinhBO.getInstance()
						.addAndGetMaHS(new HocSinh(tenHS, Boolean.valueOf(gioiTinhHS),
								LocalDate.parse(ngaySinhHS, formatter), dienThoaiHS, diaChiHS,
								Long.valueOf(maLop), maPH));
						
						HocSinhBO.getInstance().addDiem(maHS);
						
						response.sendRedirect("danhsachhocsinh");
					}
						
					else {
						RequestDispatcher rd = request.getRequestDispatcher("hocsinh/them.jsp");
						rd.forward(request, response);
					}
						
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			try {
				ArrayList<PhuHuynh> phuHuynh = PhuHuynhBO.getInstance().getAll("", 0);
				request.setAttribute("listPH", phuHuynh);

				ArrayList<Lop> lop = LopBO.getInstance().getAll();
				ArrayList<NamHoc> namHoc = NamHocBO.getInstance().getAll();
				request.setAttribute("listLop", lop);
				request.setAttribute("listNH", namHoc);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			RequestDispatcher rd = request.getRequestDispatcher("hocsinh/them.jsp");
			rd.forward(request, response);
		}
	}

}