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
import model.bo.GiaoVienBO;
import model.bo.HocSinhBO;
import model.bo.PhuHuynhBO;

/**
 * Servlet implementation class DangNhapAdminServlet
 */
public class DangNhapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangNhapServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		} else if (session.getAttribute("admin") != null) {
			response.sendRedirect("trangchu");
			return;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("dangNhap.jsp");
		rd.forward(request, response);
	}

}