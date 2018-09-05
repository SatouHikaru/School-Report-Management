package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Lop;
import model.bean.NamHoc;
import model.bo.LopBO;
import model.bo.NamHocBO;

/**
 * Servlet implementation class SuaLopServlet
 */
public class SuaLopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaLopServlet() {
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
//		HttpSession session = request.getSession();
//		if (session.getAttribute("userName") == null) {
//			response.sendRedirect("dangnhap");
//			return;
//		}
		
		request.setCharacterEncoding("UTF-8");
		long maLop = Long.valueOf(request.getParameter("malop"));
		if("submit".equals(request.getParameter("submit"))) {
			String tenLop = request.getParameter("tenLop");
			int siSo = Integer.valueOf(request.getParameter("siSo"));
//			long namHoc = Long.valueOf(request.getParameter("namHoc"));
//			long maGV = Long.valueOf(request.getParameter("gvcn"));
			
			try {
				LopBO.getInstance().edit(new Lop(maLop, tenLop, siSo));
//				LopChuNhiemBO.getInstance().edit(maLop, maGV);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("danhsachlop");
		} else {
			Lop lop = null;
			ArrayList<NamHoc> namHoc = null;
//			ArrayList<GiaoVien> giaoVien = null;
			try {
				lop = LopBO.getInstance().getById(Long.valueOf(maLop));
				namHoc = NamHocBO.getInstance().getAll();
//				giaoVien = GiaoVienBO.getInstance().get();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("lop", lop);
			request.setAttribute("listNH", namHoc);
//			request.setAttribute("listGV", giaoVien);
			RequestDispatcher rd = request.getRequestDispatcher("lop/sua.jsp");
			rd.forward(request, response);
		}
	}

}