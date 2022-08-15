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


@WebServlet("/workProgress.do")
public class WorkProgressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WorkProgressServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGINID");
		if(id == null) {
			response.sendRedirect("login.jsp?M=Y");
		}else {
		String select = "select info.employee_number, info.employee_name,"+
		"work.work_number, to_char(work.work_com_date, 'YYYYMMDD'), work.business_code, work.location_code"+
		" from employee_info_tbl info, employee_work_info_tbl work"+
		" where info.work_number = work.work_number" + " order by info.employee_number, work.work_number asc";
		
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
				empWorkInfo.setEmpnum(rs.getInt(1));
				empWorkInfo.setEmpname(rs.getString(2));
				empWorkInfo.setWokrnum(rs.getInt(3));
				empWorkInfo.setWorkdate(rs.getNString(4));
				empWorkInfo.setBiscode(rs.getInt(5));
				empWorkInfo.setLocacode(rs.getInt(6));
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
		RequestDispatcher rd = request.getRequestDispatcher("workProgressSelect.jsp");
		rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
