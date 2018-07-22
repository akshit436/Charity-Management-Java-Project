<%@page import="java.io.IOException"%>;
<%@page import="java.io.PrintWriter"%>;
<%@page import="import javax.servlet.ServletException"%>;
<%@page import="import javax.servlet.http.HttpServlet"%>;
<%@page import="import javax.servlet.http.HttpServletRequest"%>;
<%@page import="import javax.servlet.http.HttpServletResponse"%>;
<%@page import ="java.sql.*"%>;

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "jsptutorials";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>id</b></td>
<td><b>user_id</b></td>
<td><b>Password</b></td>
<td><b>Name</b></td>
<td><b>Email</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM record";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("user_id") %></td>
<td><%=resultSet.getString("password") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("email") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>