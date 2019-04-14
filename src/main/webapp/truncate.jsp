<%@ page language="java" import="java.io.IOException,java.sql.Connection,java.sql.ResultSet,java.sql.Statement,java.util.*,javax.naming.*,javax.servlet.*,javax.servlet.http.*,javax.sql.*,com.ibm.websphere.runtime.ServerName, java.sql.*, java.util.ResourceBundle, java.io.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Truncate</title>
</head>
<body bgcolor="White">

<%


	PreparedStatement ps=null;
	Connection con = null;

	try{

		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ConnectDB");
		con = ds.getConnection();
	
	ps=con.prepareStatement("truncate table demo");
	ps.executeQuery();

	}
	finally {}

	response.sendRedirect("result.jsp");
%>

</body>
</html>

