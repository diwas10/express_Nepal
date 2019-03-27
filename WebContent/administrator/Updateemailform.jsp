<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%!ResultSet result; %>
    <%
	if(session.getAttribute("adminname")==null){
		response.sendRedirect("alogin.jsp");	}
%>
<% 
 				String name= ""+session.getAttribute("adminname")+"";

				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection connect=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
					
					String query="SELECT * FROM admin WHERE login_name=? ";
					
					PreparedStatement prepare=connect.prepareStatement(query);
					prepare.setString(1,name);
					
					result=prepare.executeQuery();
					
				}
					
				catch(Exception e){
					e.printStackTrace();
				}

			if(request.getParameter("em")!=null){
				Pattern p= Pattern.compile("[a-zA-Z0-9_.]+@[a-zA-Z0-9]+.[a-zA-Z]{2,3}[.] {0,1}[a-zA-Z]+");
				
				Matcher mat=p.matcher(request.getParameter("em"));
				boolean results=mat.matches();
				
				if(results==true){
					String email=request.getParameter("em");
					String loginname=""+session.getAttribute("adminname")+"";
					
					try{
						Class.forName("com.mysql.jdbc.Driver");
						Connection connect=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
						
						String query="UPDATE admin SET email=? WHERE login_name=?";
						
						PreparedStatement prepare=connect.prepareStatement(query);
						
						prepare.setString(1,email);
						prepare.setString(2,loginname);
						
						prepare.executeUpdate();
						
						response.sendRedirect("dash.jsp");
						
						
					}
					catch(Exception e){
						e.printStackTrace();
					}
				
				}
						
				else{
					
					out.print("<p>Wrong email</p>");
				}
			}
				
 %>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Email</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="body.jsp"%>
	<form method=post action="">
		<table>
		<%if(result.next()){ %>
		<tr>
			<td>New Email:</td>
			<td><input type="text" name="em" value="<%=result.getString("email") %>"></td>		
		</tr>
		<%} %>
		<tr>
			<td><input type="submit" name="cpwd" value="Change"></td>		
		</tr>
		
		</table>
	</form>
</body>
</html>