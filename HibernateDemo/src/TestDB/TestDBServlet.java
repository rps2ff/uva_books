package TestDB;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestDBServlet
 */
@WebServlet("/TestDBServlet")
public class TestDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestDBServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	// setup connection variables
	String user = "root";
	String pass = "tiger";
	
	String jdbcUrl = "jdbc:mysql://localhost:3306/hb_student?useSSL=false";
	String driver = "com.mysql.jdbc.Driver";
	
	// get connection to database
	try {
		PrintWriter out = response.getWriter();
		
		out.println("Connecting to database: " + jdbcUrl);
		
		Class.forName(driver);
		
		Connection myConn = DriverManager.getConnection(jdbcUrl, user, pass);
		
		out.println("SUCCESS!!!");
		
		myConn.close();
		
	}
	catch (Exception exc) {
		exc.printStackTrace();
		throw new ServletException(exc);
	}


}

}
