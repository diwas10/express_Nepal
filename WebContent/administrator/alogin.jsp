<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta  charset="utf-8">
		<link rel="icon" href="618c72cd-de43-4ce6-bd77-d244cc610535.png" type="image/png">
		<title>Express Khabar</title>
	</head>
	
	<body style="background:url(front.jfif)">
		<img src="618c72cd-de43-4ce6-bd77-d244cc610535.png" height=300px width=300px style=" margin-right:100px;float:right">
		<h1 style="color:blue ;margin-left:39%">Express Khabar</h1>
		
		<h1 lang =ne style="color:green;margin-left:25%; font-famliy:nirmala ui">सधैका लागि संगै </h1>
		<h1 style="color:red;margin-left:38%;">Administrator login</h1>
	  
		<form action="alogin.jsp" method="post">
		<h3>Please provide your Login Credentials</h3>
			<table style="float:left; ">
			
			  <tr>
				  <td>Email</td>
				  <td><input type="text" value="" name="em"></td>
			  </tr>
			  
			 <tr><td></td><td></td></tr>
			  <tr><td></td><td></td></tr>
			  
			  <tr>
			    <td>Login Name</td>
			    <td><input type="password" value="" name="ln"></td>
			  </tr>
			  
			  <tr><td></td><td></td></tr>
			  <tr><td></td><td></td></tr>
			  
			  <tr>
			    <td>Password </td>
			    <td><input type="password" value="" name="pwd"></td>
			  </tr>
			  
			  <tr>
			  	<td></td>
			    <td><input type="submit" value="Log in" name="login"></td>
			  </tr>
			  
			</table>
		</form>
	</body>
</html>

<%
	if(request.getParameter("login") != null){
			String name=request.getParameter("ln");
			String password=request.getParameter("pwd");
			String email=request.getParameter("em");
			boolean error=false;
			
			if(name.isEmpty()){
				error=true;
				out.print("<p>Enter UserName</p>");
			}
			 
		   if(password.isEmpty()){
				error=true;
				out.print("<p>Enter Password</p>");
		   }
		   
		   if(email.isEmpty()){
				error=true;
				out.print("<p>Enter email</p>");
		   }
	
			
		   if(error==false){
			   
			   try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection connect=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
					
					String query="SELECT * FROM admin WHERE login_name=? AND password=? AND email=?";
					
					PreparedStatement prepare=connect.prepareStatement(query);
					
					prepare.setString(1,name);
					prepare.setString(2,password);
					prepare.setString(3,email);
					
					ResultSet result=prepare.executeQuery();
					
					if(result.next()){
						session.setAttribute("adminname",name);
						response.sendRedirect("dash.jsp");
					}
					
					else{
						out.print("<p>Invalid user</p>");
				
					}
					
				}
				catch(Exception e){
					e.printStackTrace();
				}
		   }
		}
%>


