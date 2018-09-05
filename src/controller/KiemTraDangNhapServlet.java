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
import model.bean.TaiKhoan;
import model.bo.GiaoVienBO;
import model.bo.HocSinhBO;
import model.bo.PhuHuynhBO;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class KiemTraDangNhapServlet
 */
public class KiemTraDangNhapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KiemTraDangNhapServlet() {
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
		
		String username = request.getParameter("userName");
		String password = request.getParameter("password");		
		try {
			if (TaiKhoanBO.getInstance().login(new TaiKhoan(username, password))) {
				session.setAttribute("userName", username);
				
				// Get roles
				ArrayList<String> roles = TaiKhoanBO.getInstance().getRole(new TaiKhoan(username));
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
				
				String uri = (String) session.getAttribute("uri");
				if (uri != null) {
					session.removeAttribute("uri");
					String url = "/" + request.getContextPath();
					if (!uri.equals(url + "/suagiaovien") && !uri.equals(url + "/xoagiaovien") &&
						!uri.equals("/suahocsinh") &&!uri.equals(url + "/xoahocsinh") &&
						!uri.equals(url + "/suamonhoc") && !uri.equals(url + "/xoamonhoc") &&
						!uri.equals(url + "/suaphuhuynh") && !uri.equals(url + "/xoaphuhuynh") &&
						!uri.equals(url + "/suaphanconggiangday") && !uri.equals(url + "/xoaphanconggiangday"))
						response.sendRedirect(uri);
					else
						response.sendRedirect("trangchu");
				} else {
					if (session.getAttribute("admin") != null)
						response.sendRedirect("trangchu");
					else if (session.getAttribute("hocSinh") != null)
						response.sendRedirect("chitiethocsinh?mahs=" + username);
					else if (session.getAttribute("giaoVien") != null) {
						
						long idGV = GiaoVienBO.getInstance().getID((String)session.getAttribute("userName"));
						session.setAttribute("maGV", idGV);
						response.sendRedirect("chitietgiaovien?magv=" + idGV);
					} else if (session.getAttribute("phuHuynh") != null) {
						long maPH = PhuHuynhBO.getInstance().getID((String)session.getAttribute("userName"));
						ArrayList<HocSinh> hocSinh = HocSinhBO.getInstance().getHocSinh(maPH);
						session.setAttribute("listHS", hocSinh);
						response.sendRedirect("chitietphuhuynh?maph=" + maPH);
					}
				}
			} else {
				request.setAttribute("message", "Đăng nhập không thành công!");
				RequestDispatcher rd = request.getRequestDispatcher("login");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}