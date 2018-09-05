package ajax;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.bean.Lop;
import model.bo.LopBO;

/**
 * Servlet implementation class DanhSachLopTheoNamServlet
 */
public class DanhSachLopTheoNamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhSachLopTheoNamServlet() {
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
			long maNH = Long.valueOf(request.getParameter("namHoc"));

			ArrayList<Lop> dsLop = LopBO.getInstance().getByYear(maNH);
			response.setStatus(200);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(dsLop, response.getWriter());
		}
		catch(SQLException ex) {
			response.setStatus(500);
			response.setContentType("application/json");
			new Gson().toJson(ex.getMessage(), response.getWriter());
		}
	}
}
