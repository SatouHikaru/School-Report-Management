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

import common.StringProcess;
import model.bean.Lop;
import model.bean.NamHoc;
import model.bo.LopBO;
import model.bo.LopNamHocBO;
import model.bo.NamHocBO;

/**
 * Servlet implementation class LopFormServlet
 */
public class LopFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LopFormServlet() {
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
		if (session.getAttribute("userName") == null) {
			String uri = request.getRequestURI();
			session.setAttribute("uri", uri);
			response.sendRedirect("login");
			return;
		}
		int maLop = StringProcess.ifNullToInt(request.getParameter("maLop"));
		try {
			if("submit".equals(request.getParameter("submit"))) {
				String[] maNH = request.getParameterValues("maNH");
				
				String tenLop = request.getParameter("tenLop");
				
				Lop lop = new Lop();
				lop.setTenLop(tenLop);
				
				if(maLop <= 0) {
					long ml = LopBO.getInstance().add(lop);
					LopNamHocBO.getInstance().add(ml, maNH);
				}
					
				else {
					LopBO.getInstance().edit(lop);
					LopNamHocBO.getInstance().edit(maLop, maNH);
				}
				
				
									
				RequestDispatcher rd = request.getRequestDispatcher("danhsachlop");
				rd.forward(request, response);
				return;
			}
			
			

			Lop lop = LopBO.getInstance().getById(maLop);
			ArrayList<NamHoc> dsNH = NamHocBO.getInstance().getAll();
			
			ArrayList<Long> namHoc = new ArrayList<>();
			String[] namHocText = null;
			
			if (lop.getTenNamHoc() != null)
				namHocText = lop.getTenNamHoc().split(",");
			if (namHocText != null)
				for (String item : namHocText) {
					namHoc.add(Long.parseLong(item));
				}
			
			request.setAttribute("lop", lop);
			request.setAttribute("dsNHText", namHoc);
			request.setAttribute("listNH", dsNH);
			RequestDispatcher rd = request.getRequestDispatcher("lop/lopForm.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
