<%@page import="java.sql.*" %>
<form action="after_login"></form>

<%
    try {
        String e = request.getParameter("t1");
        String p = request.getParameter("t2");
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
        Statement stat = con.createStatement();
        ResultSet rs = stat.executeQuery("select * from registration where email='" + e + "'and password='" + p + "'");
        int count = 0;
        while (rs.next()) {
            count++;
        }
        if (count > 0) {
out.println("Welcome " +e+ "!!");
%>
<form action="after_login.html" id="LoginForm">
    <input type="submit" value="Click"/>
</form>
<body bgcolor="silver"></body> 
<%
        }
        else {
            response.sendRedirect("loginpage.html");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>
