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

import model.bean.ChiTietHocBa;
import model.bean.HocSinh;
import model.bean.KetQuaHocTap;
import model.bean.Lop;
import model.bean.TaiKhoan;
import model.bo.ChiTietHocBaBO;
import model.bo.GiaoVienBO;
import model.bo.HocSinhBO;
import model.bo.LopBO;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class ChiTietHocBaServlet
 */
public class ChiTietHocBaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChiTietHocBaServlet() {
		super();
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
		
		if (session.getAttribute("giaoVien") != null) {
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
		
		try {
			String maHS = request.getParameter("mahs");
			ChiTietHocBa cthb = new ChiTietHocBa();
			HocSinh hocSinh = HocSinhBO.getInstance().getById(maHS);
			
			if ("submit".equals(request.getParameter("submit"))) {
				int maLop = Integer.parseInt(request.getParameter("lop"));
				int maNH = Integer.parseInt(request.getParameter("namHoc"));
				ChiTietHocBa model = ChiTietHocBaBO.getInstance().getChiTietHocBa(maHS, maLop, maNH);
				cthb = model;
				ArrayList<KetQuaHocTap> kqHT = ChiTietHocBaBO.getInstance().xemHocBaTheoLop(maHS, maLop, maNH);
				cthb.setKqHT(kqHT);	
				request.setAttribute("submitted", true);
				
			}
			request.setAttribute("cthb", cthb);
			cthb.setTenHS(hocSinh.getHoTen());
			ArrayList<Lop> dsLop = LopBO.getInstance().getLopCuaHocSinh(maHS);
			request.setAttribute("listLop", dsLop);
			RequestDispatcher rd = request.getRequestDispatcher("/hocba/ketQuaHT.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
