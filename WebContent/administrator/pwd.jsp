<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%
	if(session.getAttribute("adminname")==null){
		response.sendRedirect("alogin.jsp");	}
%>
<%
		String name=""+session.getAttribute("adminname")+"";
	
		if(request.getParameter("cpwd") != null){
			String lpassword=request.getParameter("lpwd");
			String npassword=request.getParameter("npwd");
			boolean error=false;
			
			if(lpassword.isEmpty()){
				error=true;
				out.print("<p>Enter last password</p>");
			}
			 
		   if(npassword.isEmpty()){
				error=true;
				out.print("<p>Enter  new password</p>");
			}
			
		   if(error==false){
			   
			   try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection connect=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
					
					String query="SELECT * FROM admin WHERE password=?";
					
					PreparedStatement prepare=connect.prepareStatement(query);
					
					prepare.setString(1,lpassword);
					
					ResultSet result=prepare.executeQuery();
					
					if(result.next()){
						
						String cnpassword=request.getParameter("cnpwd");
						if(npassword.equals(cnpassword)){
							String query2="UPDATE admin SET password=? WHERE login_name=?";
							
							PreparedStatement prepares=connect.prepareStatement(query2);
							
							prepares.setString(1,npassword);
							prepares.setString(2,name);
							
							prepares.executeUpdate();
							
							
							session.removeAttribute("adminname");
							response.sendRedirect("alogin.jsp"); 
						}
						else{
							out.print("Confirmation of new password is not correct");
						}
					
					}
					
					else{
						out.print("<p>Invalid  last password</p>");
				
					}
					
				}
				catch(Exception e){
					e.printStackTrace();
				}
		   }
		}
%>

 <html>
<head>
<%@ include file="header.jsp"%>
	<title>Change Password</title>
</head>
<body>
	<%@ include file="body.jsp"%>
	<h4>Note after password change you will need login</h4>
	<form method=post action="" >
		<table>
		
		<tr>
			<td>Last Password:</td>
			<td><input type="password" name="lpwd" value=""></td>		
		</tr>
		
		<tr>
			<td>New Password:</td>
			<td ><input type="password" name="npwd" value="" ></td>		
		</tr>
		
		<tr>
			<td>Confirm New Password:</td>
			<td ><input type="password" name="cnpwd" value="" ></td>		
		</tr>
		
		
		<tr>
			<td><input type="submit" name="cpwd" value="Change" ></td>		
		</tr>
		
		</table>
	</form>
</body>
</html>