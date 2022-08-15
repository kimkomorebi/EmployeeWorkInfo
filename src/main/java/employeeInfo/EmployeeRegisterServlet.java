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
import javax.servlet.http.HttpSession;


@WebServlet("/employeeRegister.do")
public class EmployeeRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmployeeRegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * HttpSession session = request.getSession(); String id =
		 * (String)session.getAttribute("LOGINID"); if(id == null) {
		 * response.sendRedirect("login.jsp?M=Y"); }
		 */
		request.setCharacterEncoding("EUC-KR");
		String empnumber = request.getParameter("EMPNUMBER");
		String pwd = request.getParameter("PWD");
		String name = request.getParameter("NAME");
		String salary = request.getParameter("SALARY");
		String tasknumber = request.getParameter("TASKNUMBER");
		String date = request.getParameter("DATE");
		String bcode = request.getParameter("BUSINESSCODE");
		String wpnum = request.getParameter("WPNUM");
		//2022-07-31
		//20220731로 만들기
		String year = date.substring(0,4);
		String month = date.substring(5,7);
		String dateSubString = date.substring(8);
		date = year+month+dateSubString;
		String insert = "insert into employee_info_tbl" + " values(?, ?, ?, ?,?)";
		String insertTwo = "insert into employee_work_info_tbl" + " values(?, to_date(?, 'YYYYMMDD'),?, ?)";
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmtTwo = null;
		String result = "";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			
			pstmtTwo = con.prepareStatement(insertTwo);
			pstmtTwo.setInt(1, Integer.parseInt(tasknumber));
			pstmtTwo.setString(2, date);
			pstmtTwo.setInt(3, Integer.parseInt(bcode));
			pstmtTwo.setInt(4, Integer.parseInt(wpnum));
			
			pstmtTwo.executeUpdate();
			
			pstmt = con.prepareStatement(insert);
			pstmt.setInt(1, Integer.parseInt(empnumber));
			pstmt.setString(2, pwd );
			pstmt.setString(3, name);
			pstmt.setInt(4, Integer.parseInt(salary));
			pstmt.setInt(5, Integer.parseInt(tasknumber));
			pstmt.executeUpdate();
			
			result = "OK";
			System.out.println("삽입 성공");
		}catch(Exception e) {
			result = "NOK";
			e.printStackTrace();
			System.out.println("삽입 실패");
		}finally {
			try {
				con.close(); pstmt.close(); pstmtTwo.close();
			}catch(Exception e) {}
		}
		response.sendRedirect("registerResult.jsp?RESULT="+result);
	}

}
