package employeeInfo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/employeeInfoUpdate.do")
public class EmployeeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmployeeUpdateServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	String employeeUpdate(HttpServletRequest request) {
		String empnum = request.getParameter("EMPNUMBER");
		String pwd = request.getParameter("PWD");
		String name = request.getParameter("NAME");
		String salary = request.getParameter("SALARY");
		String tasknum = request.getParameter("TASKNUMBER");
		
		String update = "update employee_info_tbl"+
		" set employee_password=?, employee_name=?, " +
		"salary=?, work_number=? where employee_number = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		String result = "";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");

			pstmt = con.prepareStatement(update);
			pstmt.setString(1, pwd);
			pstmt.setString(2, name);
			pstmt.setInt(3, Integer.parseInt(salary));
			pstmt.setInt(4, Integer.parseInt(tasknum));
			pstmt.setInt(5, Integer.parseInt(empnum));
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
		return result;
	}
	String employeeDelete(HttpServletRequest request){
		String empnum = request.getParameter("EMPNUMBER");
		//String pwd = request.getParameter("PWD");
		//String name = request.getParameter("NAME");
		//String salary = request.getParameter("SALARY");
		String tasknum = request.getParameter("TASKNUMBER");
		
		String delete = "delete from employee_info_tbl "+ "where employee_number=?";
		String deleteTwo = "delete from employee_work_info_tbl "+ "where work_number=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		//PreparedStatement pstmtTwo = null;
		String result = "";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			
			pstmt = con.prepareStatement(delete);
			pstmt.setInt(1, Integer.parseInt(empnum));
			pstmt.executeUpdate();
			
			//pstmtTwo = con.prepareStatement(deleteTwo);
			//pstmtTwo.setInt(1, Integer.parseInt(tasknum));
			//pstmtTwo.executeUpdate();
			
			result = "OK";
		}catch(Exception e) {
			result = "NOK";
		}finally {
			try {
				con.close(); pstmt.close();
			}catch(Exception e) {}
		}
		return result;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String btn = request.getParameter("btn");
		if(btn.equals("수 정")) {
			String result = employeeUpdate(request);
			response.sendRedirect("updateResult.jsp?RESULT="+result);
		}else if(btn.equals("삭 제")){
			String result = employeeDelete(request);
			response.sendRedirect("updateResult.jsp?RESULT="+result);
		}
	}

}
