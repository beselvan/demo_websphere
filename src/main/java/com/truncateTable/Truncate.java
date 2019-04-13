package com.truncateTable;
import java.io.IOException;
import java.sql.*;
import java.util.Hashtable;

import javax.activation.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Truncate")
public class Truncate extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Truncate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		ResultSet rs=null;
		PreparedStatement ps=null;
		ResultSetMetaData md;
		Connection con = null;

		try{

			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ConnectDB");
			con = ((Statement) ds).getConnection();
		
		ps=con.prepareStatement("truncate table demo");
		rs=ps.executeQuery();		

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		
		finally {}

		
		request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
	}
	
}
