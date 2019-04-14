<%@ page language="java" import="java.io.IOException,java.io.IOException,java.sql.Connection,java.sql.ResultSet,java.sql.Statement,java.util.*,javax.naming.*,javax.servlet.*,javax.servlet.http.*,javax.sql.*,com.ibm.websphere.runtime.ServerName" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Home page</title>
</head>
<body>
<p"><a href=result.jsp>RESULT</a></p>
<script type="text/javascript">
 
  function checkForm()
  {
    re = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
 
	 if(home.name.value != '' && !home.age.value.match(re)) {

	  return false;
 
   }
 
</script>

<img src="./images/logo.png"  height="200" width="200" align="right"  />
<form action='home.jsp' name=home>
<table>
<tr>
        <td><font color="black">User Name </font></td><td><input type='textbox' name='name'/><br/><br/></td>
</tr>
<tr>
        <td><font color="red">Enter you DOB </font></td><td><input type='textbox' name='age'/><br/><br/></td>
</tr>
<tr>
        <td colspan="2" align="center" valign="center"><input type='submit' value='submit'/><br/><br/><br/></td>
</tr>
</table>
<p><font color="red"><%=ServerName.getDisplayName()%></font></P>


<%
String name=request.getParameter("name");
String age=request.getParameter("age");
String servername=ServerName.getDisplayName();
System.out.println(servername);
try{
                Hashtable parms = new Hashtable();
                parms.put(Context.INITIAL_CONTEXT_FACTORY,"com.ibm.websphere.naming.WsnInitialContextFactory");
                InitialContext ctx = new InitialContext(parms);
                DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/ConnectDB");
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                ResultSet rs1 = null;

                conn = ds.getConnection();
                stmt = conn.createStatement();
                String sql1= "insert into demo values ('"+name+"','"+age+"','"+servername+"',CURRENT_TIMESTAMP)";
System.out.println(sql1);
System.out.println(servername);
                stmt.executeUpdate(sql1);
        }
catch(Exception e){
        System.out.println(e);
}
%>

</form>
<br><br><br><img src="./images/footer.jpg"  height="50" width="250" align="center" />


</body>
</html>

<!--  CREATE TABLE DEMO1 ("N" VARCHAR2(20 BYTE), "A" VARCHAR2(20 BYTE), "S" VARCHAR2(20 BYTE),"T" TIMESTAMP(9)) ; -->
