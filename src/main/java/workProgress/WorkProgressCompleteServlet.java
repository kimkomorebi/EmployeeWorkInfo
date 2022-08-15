package workProgress;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WorkProgressCompleteServlet
 */
@WebServlet("/workProgressComplete.do")
public class WorkProgressCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WorkProgressCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empnum = request.getParameter("EMPNUM");
		String empname = request.getParameter("EMPNAME");
		String worknum = request.getParameter("WORKNUM");
		String workdate = request.getParameter("WORKDATE");
		String busicode = request.getParameter("BUSICODE");
		String location = request.getParameter("LOCATION");
		
		String update = "update employee_work_info_tbl"+
		" set work_com_date = to_date(?, 'YYYY/MM/DD'), business_code=?, location_code=?"+
		" where work_number = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String result = "";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			
			pstmt= con.prepareStatement(update);
			pstmt.setString(1, workdate);
			pstmt.setInt(2, Integer.parseInt(busicode));
			pstmt.setInt(3, Integer.parseInt(location));
			pstmt.setInt(4, Integer.parseInt(worknum));
			pstmt.executeUpdate();
			result = "OK";
		}catch(Exception e) {
			result = "NOK";
			e.printStackTrace();
		}finally {
			try {
				con.close(); pstmt.close();
			}catch(Exception e) {}
		}
		response.sendRedirect("workInfoUpdateResult.jsp?RESULT="+result);
	}

}
