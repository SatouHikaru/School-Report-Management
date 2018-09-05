package ajax;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.bean.NamHoc;
import model.bo.NamHocBO;

/**
 * Servlet implementation class DanhSachNamHocTheoLopServlet
 */
public class DanhSachNamHocTheoLopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhSachNamHocTheoLopServlet() {
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
		try {
			int maLop = Integer.valueOf(request.getParameter("maLop"));

			ArrayList<NamHoc> dsNH = NamHocBO.getInstance().getAllByClass(maLop);
			response.setStatus(200);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(dsNH, response.getWriter());
		}
		catch(SQLException ex) {
			response.setStatus(500);
			response.setContentType("application/json");
			new Gson().toJson(ex.getMessage(), response.getWriter());
		}
	}

}
