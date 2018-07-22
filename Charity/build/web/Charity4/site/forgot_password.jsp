
<%@page import="java.sql.*" %>




<%
    String a1,a2,a3;
    a1=request.getParameter("t1");
    a2=request.getParameter("t2");
    a3=request.getParameter("t3");
    
    
    try
    {
       Class.forName("org.apache.derby.jdbc.ClientDriver");       
        Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app","app");

        PreparedStatement stat=con.prepareStatement("update registration set password=?,conf_pass=? where email=?" );
        
        stat.setString(1,a2);
        stat.setString(2,a3);
        stat.setString(3,a1);
        stat.executeUpdate();
         
     }
    catch(Exception e)
    {
        out.println(e);
    }
%>