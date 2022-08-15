package employeeInfo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EmployeeEntryServlet
 */
@WebServlet("/employeeEntry.do")
public class EmployeeEntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmployeeEntryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGINID");
		if(id == null) {
			response.sendRedirect("login.jsp?M=Y");
		}else {
		String select = "select max(employee_number) from employee_info_tbl";
		String selectTwo = "select max(work_number) from employee_work_info_tbl";
		int employeeNum = 0;
		int workNum = 0;
		Connection con = null;
		Statement stmt = null;
		Statement stmtTwo = null;
		
		ResultSet rs = null;
		ResultSet rsTwo = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			stmt = con.createStatement();
			rs = stmt.executeQuery(select);
			rs.next();
			employeeNum = rs.getInt(1);
			employeeNum = employeeNum + 1;
			
			stmtTwo = con.createStatement();
			rsTwo = stmtTwo.executeQuery(selectTwo);
			rsTwo.next();
			workNum = rsTwo.getInt(1);
			workNum = workNum + 1;
		}catch(Exception e) {
			
		}finally {
			try {
				con.close(); stmt.close(); rs.close(); stmtTwo.close();  rsTwo.close();
			}catch(Exception e) {}
		}
		RequestDispatcher rd = request.getRequestDispatcher("entry.jsp?ENUM="+employeeNum+"&WORKNUM="+workNum);
		rd.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
