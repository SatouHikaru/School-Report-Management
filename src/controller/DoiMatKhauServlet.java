package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.TaiKhoan;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class DoiMatKhauServlet
 */
public class DoiMatKhauServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoiMatKhauServlet() {
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
		}
		
		request.setCharacterEncoding("UTF-8");
		if ("submit".equals(request.getParameter("submit"))) {
			String oldPassword = request.getParameter("oldPassword");
			String newPassword = request.getParameter("newPassword");
			String password = request.getParameter("password");
			
			try {
				if (TaiKhoanBO.getInstance().getPassword((String)session.getAttribute("userName")).equals(oldPassword)) {
					if (!oldPassword.equals(newPassword) && newPassword.equals(password)) {
						TaiKhoanBO.getInstance().changePassword(new TaiKhoan((String)session.getAttribute("userName"), password));
						request.setAttribute("message", "Đã đổi mật khẩu thành công");
					} else
						request.setAttribute("message", "Đổi mật khẩu không thành công");
				} else
					request.setAttribute("message", "Mật khẩu cũ chưa đúng");
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("taikhoan/doiMatKhau.jsp");
		rd.forward(request, response);
	}

}