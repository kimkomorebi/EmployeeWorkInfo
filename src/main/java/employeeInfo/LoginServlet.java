package employeeInfo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		String pwd = request.getParameter("PWD");
		
		
		String select = "select employee_password from employee_info_tbl where employee_number = ?";
		String name = "select employee_name from employee_info_tbl where employee_number = ?";
		String result = "";
		Connection con = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			
			pstmt = con.prepareStatement(select);
			pstmt.setInt(1, Integer.parseInt(id));
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //성공
				String pwdInDB = rs.getString(1);
				if(pwdInDB.equals(pwd)) {
					result = "OK";
					HttpSession session = request.getSession();
					session.setAttribute("LOGINID", id);
				}else {
					result = "NOPWD";//암호 틀림
				}
			}else {
				result ="NOID"; // 계정이 없다
			}
		}catch(Exception e) {
			
		}finally {
			try {
				con.close(); pstmt.close(); rs.close();
			}catch(Exception e) {}
		}
		response.sendRedirect("loginResult.jsp?RESULT="+result);
	}

}
