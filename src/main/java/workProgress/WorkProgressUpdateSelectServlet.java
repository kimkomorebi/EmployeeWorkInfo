package workProgress;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WorkProgressUpdateSelectServlet
 */
@WebServlet("/workProgressSelectUpdate.do")
public class WorkProgressUpdateSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkProgressUpdateSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String worknum = request.getParameter("WN");
		System.out.println("worknum>>"+worknum);
		String select = "select "+ "info.employee_number, info.employee_name,"+
				"work.work_number, to_char(work.work_com_date, 'YYYY-MM-DD'), work.business_code, work.location_code"+
				" from employee_info_tbl info, employee_work_info_tbl work"+
				" where info.work_number = work.work_number"+ " and work.work_number = "+ worknum;
		Connection con = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeWorkInfo empWorkInfo = new EmployeeWorkInfo();
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(select);
			rs.next();
			empWorkInfo.setEmpnum(rs.getInt(1));
			empWorkInfo.setEmpname(rs.getString(2));
			empWorkInfo.setWokrnum(rs.getInt(3));
			empWorkInfo.setWorkdate(rs.getString(4));
			empWorkInfo.setBiscode(rs.getInt(5));
			empWorkInfo.setLocacode(rs.getInt(6));
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close(); pstmt.close(); rs.close();
				stmt.close();
			}catch(Exception e) {}
		}
		request.setAttribute("EMPWORKINFO", empWorkInfo);
		RequestDispatcher rd = request.getRequestDispatcher("workProgressUpdate.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
