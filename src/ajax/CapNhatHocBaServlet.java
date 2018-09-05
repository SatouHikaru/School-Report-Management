package ajax;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.bean.ChiTietHocBa;
import model.bean.Diem;
import model.bo.ChiTietHocBaBO;

/**
 * Servlet implementation class CapNhatHocBaServlet
 */
public class CapNhatHocBaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CapNhatHocBaServlet() {
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
		
		try {
			String data = request.getParameter("data");

			Gson gson = new Gson(); 
			ChiTietHocBa model = gson.fromJson(data, ChiTietHocBa.class); 
			
			ChiTietHocBaBO.getInstance().capNhat(model);
			
			response.setStatus(200);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(model, response.getWriter());
			
		}
		catch(SQLException e) {
			response.setStatus(500);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(e.getMessage(), response.getWriter());
		}
	}

}
