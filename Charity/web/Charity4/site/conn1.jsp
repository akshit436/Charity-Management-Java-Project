
<%@page import="javax.naming.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%
    String a1,a2,a3,a4;
    
        a1=request.getParameter("t1");
    a2=request.getParameter("t2");
    a3=request.getParameter("t3");
    a4=request.getParameter("t4");
    
    
    try
    {
       Class.forName("org.apache.derby.jdbc.ClientDriver");       
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app","app");

        PreparedStatement stat=con.prepareStatement("Insert into feedback values(?,?,?,?)");
        stat.setString(1,a1);
        stat.setString(2,a2);
        stat.setString(3,a3);
        stat.setString(4,a4);
        
        stat.executeUpdate();
        out.println("Thanks for your feedback!!!!!");
         
     }
    catch(Exception e)
    {
        out.println(e);
    }
%>
