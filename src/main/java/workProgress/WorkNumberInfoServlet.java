package workProgress;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class WorkNumberInfoServlet
 */
@WebServlet("/workNumberInfo.do")
public class WorkNumberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkNumberInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGINID");
		if(id == null) {
			response.sendRedirect("login.jsp?M=Y");
		}else {
		String select = "select * from employee_work_info_tbl"+ " order by work_number asc";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList list = new ArrayList();
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(select);
			while(rs.next()) {
				EmployeeWorkInfo empWorkInfo = new EmployeeWorkInfo();
				empWorkInfo.setWokrnum(rs.getInt(1));
				empWorkInfo.setWorkdate(rs.getNString(2));
				empWorkInfo.setBiscode(rs.getInt(3));
				empWorkInfo.setLocacode(rs.getInt(4));
				list.add(empWorkInfo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close(); 
				stmt.close(); 
				rs.close();
			}catch(Exception e) {
				
			}
		}
		request.setAttribute("LIST", list);
		RequestDispatcher rd = request.getRequestDispatcher("workNumberSelect.jsp");
		rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
