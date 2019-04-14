<%@ page language="java" import="java.io.IOException,java.sql.Connection,java.sql.ResultSet,java.sql.Statement,java.util.*,javax.naming.*,javax.servlet.*,javax.servlet.http.*,javax.sql.*,com.ibm.websphere.runtime.ServerName, java.sql.*, java.util.ResourceBundle, java.io.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Help Page</title>
</head>
<body bgcolor="White">


<table border=1 width="50%"><tr bgcolor='Gray'colspan=2>
<%

	ResultSet rs=null;
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	ResultSetMetaData md;
	Connection con = null;

	try{

	Hashtable parms = new Hashtable();
	parms.put(Context.INITIAL_CONTEXT_FACTORY,"com.ibm.websphere.naming.WsnInitialContextFactory");
	InitialContext ctx = new InitialContext(parms);
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/ConnectDB");
	con = ds.getConnection();
	
	ps=con.prepareStatement("select count(*) from demo");
	rs=ps.executeQuery();	md = rs.getMetaData();	int count = md.getColumnCount();

	out.print("<th>Total No. of Rows</th>");

	while (rs.next()) {
			out.print("<th align='center'>"+rs.getString(1)+"</th>");
	}		
	}
	finally {}
%>
<th><form action="${pageContext.request.contextPath}/truncate.jsp" method="post"><input type=submit value="TRUNCATE"></input></form></th></tr>
</table> <br/><br/>

<table border=1 width="50%"><tr bgcolor='Gray'>
<%


	try{
	
	ps=con.prepareStatement("select * from demo");
	rs=ps.executeQuery();	md = rs.getMetaData();	int count = md.getColumnCount();

	for (int i=1; i<=count; i++) {
		out.print("<th>"+md.getColumnName(i)+"</th>");

	}
		out.print("</tr><tr>");

	while (rs.next()) {
		out.print("<tr>");
		for (int i=1; i<=count; i++) 
			out.print("<td align='center'>"+rs.getString(i)+"</td>");
	}		out.print("</tr>");}
	finally {if(rs!=null) rs.close(); if(ps!=null)	ps.close(); if(con!=null) con.close(); }
%>
</table>
</body>
</html>

