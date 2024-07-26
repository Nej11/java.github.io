Login.html
<html>
 <head>
 <title>Login</title>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 </head>
 <body>
 <form action="Login.jsp" method="post" id="styleform">
 <h2>Login Authentication</h2><hr color="black"><br>
 Username: <input type="text" name="user"/><br><br>
 Password: <input type="password" name="pwd"/><br><br><br>
 <input type="submit" value="Submit" id="stylesub"/>
 </form>
 </body>
</html>





Login.jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Login</title>
 </head>
 <body>
 <%@ page import ="java.sql.*" %>
 <%@ page import ="javax.sql.*" %>
 <%String username = request.getParameter("user");
 String pwd = request.getParameter("pwd");
 Class.forName("com.mysql.jdbc.Driver");
 java.sql.Connection con =
DriverManager.getConnection("jdbc:mysql://localhost:3306/app","root","root");
 Statement st= con.createStatement();
 ResultSet rs= st.executeQuery("select * from login where
 username='"+username+"'");
 if(rs.next())
 {if(rs.getString(2).equals(pwd)) {
 session.setAttribute("user",rs.getString(1));
 String name=(String)session.getAttribute("user");
 out.println("Welcome "+ name);
 }else
 System.out.println("Invalid password try again");
 }
 %></body>
</html>
