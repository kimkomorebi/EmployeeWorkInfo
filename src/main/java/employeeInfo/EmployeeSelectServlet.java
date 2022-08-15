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

@WebServlet("/employeeSelectInfo.do")
public class EmployeeSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmployeeSelectServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("NUM");
		String select = "select employee_number, employee_password, employee_name,"+
		" salary, work_number from employee_info_tbl" + " where employee_number = " + num;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		EmployeeInfo empinfo = new EmployeeInfo();
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(select);
			rs.next();
			empinfo.setEmpnum(rs.getInt(1));
			empinfo.setEmppwd(rs.getString(2));
			empinfo.setEmpname(rs.getString(3));
			empinfo.setSalary(rs.getInt(4));
			empinfo.setWorknum(rs.getInt(5));
		}catch(Exception e) {
			
		}finally {
			try {
				con.close();
				stmt.close();
				rs.close();
			}catch(Exception e) {
				
			}
		}
		request.setAttribute("EMPINFO", empinfo);
		RequestDispatcher rd = request.getRequestDispatcher("employeeSelectInfo.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
