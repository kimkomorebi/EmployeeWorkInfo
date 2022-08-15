package workProgress;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

/**
 * Servlet implementation class WorkProgressUpdateServlet
 */
@WebServlet("/workProgressUpdate.do")
public class WorkProgressUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkProgressUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	String workProgressDelete(HttpServletRequest request) {
		String worknum = request.getParameter("WORKNUM");
		//String empnum = request.getParameter("EMPNUM");
		String delete = "delete from employee_work_info_tbl" + " where work_number =" +worknum;
		//String delete = "delete from employee_work_info_tbl" + " where work_number =?";
		Connection con = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		String result = "";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			
			stmt = con.createStatement();
			stmt.executeUpdate(delete);
			//pstmt = con.prepareStatement(delete);
			//pstmt.setInt(1, Integer.parseInt(worknum));
			//pstmt.executeUpdate();
			result ="OK";
		}catch(Exception e) {
			result = "NOK";
			e.printStackTrace();
		}finally {
			try {
				//con.close();
				//stmt.close(); 
				//pstmt.close();
			}catch(Exception e) {}
		}
		return result;
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String btn = request.getParameter("btn");
		String worknum = request.getParameter("WORKNUM");
		if(btn.equals("수 정")) {
			//String result = workProgressUpdate(request);
			//response.sendRedirect("workProgrssUpdate.jsp?=WORKNUM"+worknum);
			response.sendRedirect("workProgressSelectUpdate.do?WN="+worknum);
			System.out.println("worknum>>"+worknum);
		}else if(btn.equals("삭 제")) {
			String result = workProgressDelete(request);
			response.sendRedirect("workInfoDeleteResult.jsp?RESULT="+result);
		}
	}

}
