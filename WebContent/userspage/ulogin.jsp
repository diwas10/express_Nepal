<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    

<%
	if(request.getParameter("login")!=null){
		
		String ulpassword=request.getParameter("ulpwd");
		String ulemail=request.getParameter("ulem");
		
		boolean error=false;
		
		
		if(ulpassword.isEmpty()){
			 error=true;
			 out.print("<p>Enter Your Password</p>");
		}
		
		if(ulemail.isEmpty()){
			 error=true;
			 out.print("<p>Enter Your Email</p>");
		}
		
		if(error==false){
		
		
			try{
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection connect=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
				
				String query="SELECT email AND password FROM users WHERE email=? AND password=?";
				
				PreparedStatement prepare=connect.prepareStatement(query);
				
				prepare.setString(1, ulemail);
				prepare.setString(2, ulpassword);
				
				ResultSet rs=prepare.executeQuery();
				
				if(rs.next()){
					session.setAttribute("lusername",ulemail);
					response.sendRedirect("alindex.jsp");
				}
				
				else{
					out.print("Invalid email or username");
				}
			}
		
		catch(Exception e){
			e.printStackTrace();
		}
	}
}

%> 
       
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Express -Login</title>
<%@include file="title.jsp" %>
</head>
<body>
	<h2>User Login</h2>
	<h5>Please provide your login credentials</h5>
	<form action="" method="post">
			<table>

				<tr>
					<td>Email</td>
					<td> <input type="text"  name="ulem" value=""></td>
				</tr>
				
				<tr><td></td></tr>
				<tr><td></td></tr>
				
				<tr>
					<td>Password</td>
					<td> <input type="password"  name="ulpwd" value=""></td>
				</tr>
				
				
				<tr><td></td></tr>
				<tr><td></td></tr>
				
				
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				
				<tr>
					<th> <input type="submit"  name="login" value="Log in" style="border-radius:50px; border:2px solid blue"></th>
				</tr>
				
			</table>
		</form><br>
		<h4>OR</h4>
		<button class="btn space_margin" onclick="window.location.href = 'usercreates.jsp';" value="Link" style="border-radius:50px; border:2px solid blue">Create an Account</button>
</body>
</html> --%>

