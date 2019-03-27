<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.regex.Matcher"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<%
	if(request.getParameter("create")!=null){
		
		String uname=request.getParameter("runm");
		String upassword=request.getParameter("upwd");
		String uemail=request.getParameter("uem");
		String ucpassword=request.getParameter("ucpwd");
		String upicture="618c72cd-de43-4ce6-bd77-d244cc610535.png";
		
		boolean error=false;
		
		if(uname.isEmpty()){
			 error=true;
			 out.print("<p>Enter Your Name</p>");
		}
		
		if(upassword.isEmpty()){
			 error=true;
			 out.print("<p>Enter Your password</p>");
		}
		
		if(uemail.isEmpty()){
			 error=true;
			 out.print("<p>Enter Your Email</p>");
		}
		
		if(ucpassword.isEmpty()){
			 error=true;
			 out.print("<p>Enter Your Confirmation Password</p>");
		}
		
		if(error==false){
		
				
				if(uemail!=null){
					Pattern p= Pattern.compile("[a-zA-Z0-9_.]+@[a-zA-Z0-9]+.[a-zA-Z]{2,3}[.] {0,1}[a-zA-Z]+");
					
					Matcher mat=p.matcher(uemail);
					boolean result=mat.matches();
					
					if(result==true && upassword.equals(ucpassword)){
							
							try{
								Class.forName("com.mysql.jdbc.Driver");		
								Connection connect1=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
								
								String query1="SELECT email FROM users WHERE email=?";
								
								PreparedStatement prepare1=connect1.prepareStatement(query1);
								prepare1.setString(1,uemail);
								
								ResultSet rs=prepare1.executeQuery();
								
								if(rs.next()){
									out.print("Email Address is already used");
								}
								
								else{
									
									try{
										Class.forName("com.mysql.jdbc.Driver");		
										Connection connect=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
										
										String query="INSERT INTO users(name,email,password,picture) VALUES(?,?,?,?)";
										
										PreparedStatement prepare=connect.prepareStatement(query);
										
										prepare.setString(1,uname);
										prepare.setString(2,uemail);
										prepare.setString(3,upassword);
										prepare.setString(4,upicture);
										
										prepare.executeUpdate();								
										
										response.sendRedirect("index.jsp");
									}
									
									catch(Exception e){
										e.printStackTrace();
									}
								}
							}
							
							catch(Exception e){
								e.printStackTrace();
							}
						}
				
				
					else{
						out.print("wrong email address or confirmation of password");
					}
				}
			}
		}

%>

<%-- <!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Express-Create Account</title>
		<%@ include file="title.jsp" %>
	</head>
	<body>
	
	<h1>Create an Account</h1>
	
		<form action="" method="post">
			<table>
				<tr>
					<td>Name</td>
					<td> <input type="text"  name="runm" value=""></td>
				</tr>
				
				<tr><td></td></tr>
				<tr><td></td></tr>

				<tr>
					<td>Email</td>
					<td> <input type="text"  name="uem" value=""></td>
				</tr>
				
				<tr><td></td></tr>
				<tr><td></td></tr>
				
				<tr>
					<td>Password</td>
					<td> <input type="password"  name="upwd" value=""></td>
				</tr>
				
				
				<tr><td></td></tr>
				<tr><td></td></tr>
				
				<tr>
					<td> Confirm Password</td>
					<td> <input type="password"  name="ucpwd" value=""></td>
				</tr>
				
				
				
				<!-- <tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				
				<tr>
					<td>Upload Photo</td>
					<td> <input type="file"  name="up" value=""></td>
				</tr> -->
				
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				
				<tr>
					<th > <input type="submit"  name="create" value="Create Account" style="border-radius:50px; border:2px solid blue; "></th>
				</tr>
				
			</table>
		</form>
		<br>
		<h4>OR</h4>
		<button class="btn space_margin" onclick="window.location.href = 'ulogin.jsp';" value="Link" style="border-radius:50px; border:2px solid blue">Log in</button>
		<p>Note: Login is required after creating account</p>
	</body>
</html> --%>
