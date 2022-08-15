package employeeInfo;

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
 * Servlet implementation class EmployeeInfoServlet
 */
@WebServlet("/employeeInfoAll.do")
public class EmployeeInfoAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeInfoAllServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGINID");
		if(id == null) {
			response.sendRedirect("login.jsp?M=Y");
		}else {
		String select = "select employee_number, employee_password, employee_name, salary, work_number from employee_info_tbl"
		+" order by employee_number asc";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList employeeInfo = new ArrayList();
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(select);
			while(rs.next()) {
				EmployeeInfo empInfo = new EmployeeInfo();
				empInfo.setEmpnum(rs.getInt(1));
				empInfo.setEmppwd(rs.getString(2));
				empInfo.setEmpname(rs.getString(3));
				empInfo.setSalary(rs.getInt(4));
				empInfo.setWorknum(rs.getInt(5));
				employeeInfo.add(empInfo);
			}
			
		}catch(Exception e) {
			
		}finally {
			try {
				con.close(); 
				stmt.close();
				rs.close();
			}catch(Exception e) {
				
			}
		}
		request.setAttribute("EMPINFO", employeeInfo);
		RequestDispatcher rd = request.getRequestDispatcher("employeeInfoAll.jsp");
		rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
