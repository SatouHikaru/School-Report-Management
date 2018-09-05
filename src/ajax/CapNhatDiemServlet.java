package ajax;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.StringProcess;
import model.bean.Diem;
import model.bean.Lop;
import model.bo.DiemBO;
import model.bo.LopBO;

/**
 * Servlet implementation class CapNhatDiemServlet
 */
public class CapNhatDiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CapNhatDiemServlet() {
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

		String data = request.getParameter("data");

		Gson gson = new Gson(); 
		Diem diem = gson.fromJson(data, Diem.class); 
		
		try {
			DiemBO.getInstance().edit(diem);
			
			response.setStatus(200);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(diem, response.getWriter());
			
		} catch (SQLException e) {
			response.setStatus(500);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(e.getMessage(), response.getWriter());
		}		
	}

}
