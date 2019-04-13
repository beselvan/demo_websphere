<%@ page language="java" import="java.io.IOException,java.sql.Connection,java.sql.ResultSet,java.sql.Statement,java.util.*,javax.naming.*,javax.servlet.*,javax.servlet.http.*,javax.sql.*,com.ibm.websphere.runtime.ServerName, java.sql.*, java.util.ResourceBundle, java.io.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Help Page</title>
</head>
<body bgcolor="White">
<table>
<%
		try{
				String sqlstring = null;
				Connection connection = null;
				ResultSet resultSet = null;

                Hashtable parms = new Hashtable();
                parms.put(Context.INITIAL_CONTEXT_FACTORY,"com.ibm.websphere.naming.WsnInitialContextFactory");
                InitialContext ctx = new InitialContext(parms);
                DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/ConnectDB");
			out.print("ds  ------------ \n"+ds);
			out.newLine();


			Statement statement = connection.createStatement();

			resultSet = statement.executeQuery("SELECT * FROM demo");

		while(resultSet.next()){
		%>
		<tr>
		<td><%=resultSet.getString(1) %></td>
		<td><%=resultSet.getString(2) %></td>


		</tr>
		<%
		}
		connection.close();
		} catch (Exception e) {
					out.print(e);
		}
		%>
		</table>
</body>
</html>
