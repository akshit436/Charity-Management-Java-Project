


<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");

        PreparedStatement stat = con.prepareStatement("select * from registration");
        ResultSet res = stat.executeQuery();
%>


<body bgcolor="white"></body>
<font size="+4"><font color="red">Top </font></font> 

<font size="+4"><font color="silver"> Charity Contributors</font></font> 
<table border="1" style ="background-color: rosybrown" width="1000" height="500">

    <tr>
        <td> <font size="+3"><font color="black">Name</font></font> </td>   
        <td> <font size="+3"><font color="black">Amount</font></font> </td>   
        <td> <font size="+3"><font color="black">Address</font></font> </td>   
        <td> <font size="+3"><font color="black">Mobile</font></font> </td>   
    </tr>
    <%        while (res.next()) {
    %>

    <tr>
        <td><%=res.getString(1)%></td>
        <td><%=res.getString(2)%></td>
        <td><%=res.getString(3)%></td>
        <td><%=res.getString(4)%></td>

    </tr>
    <%
        }
    %>
</table>

<%
    } catch (Exception e) {
        out.println(e);
    }
%>
