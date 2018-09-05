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

import model.bean.HocSinh;
import model.bean.NamHoc;
import model.bean.TaiKhoan;
import model.bean.ThongKeHocLuc;
import model.bo.GiaoVienBO;
import model.bo.HocSinhBO;
import model.bo.NamHocBO;
import model.bo.PhuHuynhBO;
import model.bo.TaiKhoanBO;
import model.bo.ThongKeHocLucBO;

/**
 * Servlet implementation class HomeAdminServlet
 */
public class TrangChuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangChuServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		ArrayList<NamHoc> namHoc = null;
		try {
			namHoc = NamHocBO.getInstance().getAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if ("submit".equals(request.getParameter("submit"))) {
			long maNH = Long.valueOf(request.getParameter("namHoc"));
			long maLop = Long.valueOf(request.getParameter("lop"));
			int maHK = Integer.valueOf(request.getParameter("hocKy"));
			String hocLuc = request.getParameter("hocLuc");
			ArrayList<ThongKeHocLuc> list = null;
			int gioi = 0, kha = 0, trungBinh = 0, yeu = 0, kem = 0;
			try {
//				gioi = ThongKeHocLucBO.getInstance().demSoHocSinhGioi(maNH, maLop, maHK);
//				kha = ThongKeHocLucBO.getInstance().demSoHocSinhKha(maNH, maLop, maHK);
//				trungBinh = ThongKeHocLucBO.getInstance().demSoHocSinhTrungBinh(maNH, maLop, maHK);
//				yeu = ThongKeHocLucBO.getInstance().demSoHocSinhYeu(maNH, maLop, maHK);
//				kem = ThongKeHocLucBO.getInstance().demSoHocSinhKem(maNH, maLop, maHK);
				list = ThongKeHocLucBO.getInstance().getAll(maNH, maLop, maHK, hocLuc);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("gioi", gioi + "");
			request.setAttribute("kha", kha + "");
			request.setAttribute("trungBinh", trungBinh + "");
			request.setAttribute("yeu", yeu + "");
			request.setAttribute("kem", kem + "");
			request.setAttribute("tkhl", list);
		}
		
		request.setAttribute("listNH", namHoc);
		RequestDispatcher rd = request.getRequestDispatcher("trangChu.jsp");
		rd.forward(request, response);
	}

}