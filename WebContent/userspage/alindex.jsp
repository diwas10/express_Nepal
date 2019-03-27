
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
 
  <%! ResultSet rs;
  	String username;
  %>  
<%
	 username=""+session.getAttribute("lusername");
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
		
		String query="SELECT * FROM users WHERE username=?";
		
		PreparedStatement ps=connection.prepareStatement(query);
		
		ps.setString(1, username);
		rs=ps.executeQuery();
		
		rs.next();
		
	}
	catch(Exception e){
		e.printStackTrace();
	}



%>


<!DOCTYPE html>
<html lang="en">
		<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge" />  -->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Express -Home</title>
	<link rel="icon" href="618c72cd-de43-4ce6-bd77-d244cc610535.png" type="image/png">
	<link rel="stylesheet" href="main.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body >
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light px-0">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo01" style="height:130px; overflow: hidden; background:url(pexels-photo-62693.jpeg)">
					
				<div class="row w-100">
					
					<img src="618c72cd-de43-4ce6-bd77-d244cc610535.png" height="150px" style="clear:both;padding-top:5px" >
						<!-- <figcaption style="font-size: 20px; color:blue; padding-left:40px" >Be Express</figcaption> -->
				  
					<!-- <div class="col-lg-4 col-md-4 col-sm-4 px-0">Express Nepal</div> -->
					<div class="col-lg-4 col-md-4 col-sm-4 nav_menu px-0" style="padding-top:80px;color:blue">
						<a href="alindex.jsp">Home</a>
						<a href="about.jsp">About</a>
						<a href="contact.jsp">Contact</a>
						<a href="note.jsp">Notes</a>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 btn_account px-0 drop_1" >

					
						<a onclick="uprofile()" style="padding-top:30px"> <img src="<%=rs.getString("picture")%>" height=100px style="border-radius:50%;border: 2px solid blue;background-color:white " > </a>
						
						<p style="padding-top:50px;color:blue">Hey <%=rs.getString("name") %><br><br> <a href="logout.jsp" style="font-size:20px ;color: blue;text-decoration:none; border: 4px outset blue;background-color:white " > logout</a></p>
						
					<!-- <button class="btn space_margin" onclick="window.location.href = 'usercreates.jsp';" value="Link">Create an Account</button> -->
					
					</div>
				</div>
			</div>
		</nav>
		<script>
				function uprofile() {
					  var x = document.getElementById("profile");
					  if (x.style.display === "none") {
					    x.style.display = "block";
					  } else {
					    x.style.display = "none";
					  }
				}
				
				function uemail() {
					  var x = document.getElementById("uemail");
					  if (x.style.display === "none") {
					    x.style.display = "block";
					  } else {
					    x.style.display = "none";
					  }
				}
				
				function upassword() {
					  var x = document.getElementById("upassword");
					  if (x.style.display === "none") {
					    x.style.display = "block";
					  } else {
					    x.style.display = "none";
					  }
				}
		</script>
		
		
		<div id="profile" style="display: none;" align=center>
				<h3 style="white-space:pre;">   Express <%=rs.getString("name") %></h3>
		
			<div>
				
				<aside ><img src="<%=rs.getString("picture") %>" height="100px" style="margin-left:2% ;border-radius: 50%;border: 2px solid blue;  padding: 5px; height:150px"></aside><br><br>
				
				<form action="ucpic.jsp" method="post" enctype="multipart/form-data">
				
					Change Picture:  <input type="file" name="pic" value="">
					<button class="btn" onclick="window.location.href = 'ucpic.jsp';" value="Link" style="color:white;background-color:blue;border-radius: 15px;">Change</button>
				
				</form>
				
				<br>
				
				<p style="white-space:pre;">Email: <%=rs.getString("email") %>   <button class="btn" onclick="uemail()" style="color:white;background-color:blue;border-radius: 15px;">Edit</button>   </p>
				
				<br>
				
				<div id="uemail" style="display: none;" align=center>
					<form action="" method="post">
					
						New Email:<input type="text" name="nemail" value="<%=rs.getString("email") %>">
						
						 <input type="submit" name="bnemail" value="Change" style="color:white;background-color:blue;border-radius: 15px;"> 
						
						
					</form>
					</div>

					<p style="white-space:pre;">Password:    <button class="btn" onclick="upassword()"  value="Link" style="color:white;background-color:blue;border-radius: 15px;">Change</button></p>
					
				
					<div id="upassword" style="display: none;" align=center>
						
							<form action="" method="post">
								<table>
									  <tr>
										<td>Current Password:</td>
										<td><input type="password" name="cpwd" value=""></td>
									  </tr>
									  
									  <tr>
										<td>New Password:</td>
										<td><input type="password" name="npwd" value=""></td>
									  </tr>
										
									  <tr>
										<td>  Confirm New Password:</td>
										<td><input type="password" name="cnpwd" value=""></td>
									 </tr>
										
									 <tr> 
									   <td><input type="submit" name="bnpwd" value="Change" style="color:white;background-color:blue;border-radius: 15px;"> </td>
									 </tr>
								</table>
							</form>
				  </div>
			</div>
		</div>
		
		
		<%
		
			String npassword=request.getParameter("npwd");
			String cpassword=request.getParameter("cpwd");
			String cnpassword=request.getParameter("cnpwd");
			
			if(npassword!=null && cnpassword!=null){
			
				try{
					
					Class.forName("com.mysql.jdbc.Driver");
					Connection connect=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
					
					String sql="SELECT password FROM users WHERE password=?";
					
					PreparedStatement prepare=connect.prepareStatement(sql);
					
					prepare.setString(1,cpassword);
					
					rs=prepare.executeQuery();
					
					if(rs.next()){
						if(npassword.equals(cnpassword)){
							
							String sql1="UPDATE users SET password=? WHERE username=?";
							
							PreparedStatement prepare1=connect.prepareStatement(sql1);
							
							prepare1.setString(1,npassword);
							prepare1.setString(2,username);
							
							prepare1.executeUpdate();
							response.sendRedirect("alindex.jsp");
						}
					}
					
					else{
						out.print("Invalid Current Password");
					}
					
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
			
		%>
		<%
		if(request.getParameter("bnemail")!=null){
				String nemail=request.getParameter("nemail");
				username=""+session.getAttribute("lusername");
				
				Pattern p= Pattern.compile("[a-zA-Z0-9_.]+@[a-zA-Z0-9]+.[a-zA-Z]{2,3}[.] {0,1}[a-zA-Z]+");
				
				Matcher mat=p.matcher(nemail);
				boolean result=mat.matches();
				
				if(result==true){
				
					if(request.getParameter("nemail")!=null){
						
						username=""+session.getAttribute("lusername");
						try{
							
							Class.forName("com.mysql.jdbc.Driver");
							Connection connection2=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
							
							String query2="SELECT email FROM users WHERE email=? ";
							
							PreparedStatement ps2=connection2.prepareStatement(query2);
							ps2.setString(1, nemail);
							
							rs=ps2.executeQuery();
							
							if(rs.next()){
								out.print("<p style='color:blue'>Email Address Already exists</p>");
							}
							else{
								try{
									Class.forName("com.mysql.jdbc.Driver");
									Connection connection1=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
									
									String query1="UPDATE users SET email=? WHERE username=?";
									
									PreparedStatement ps1=connection1.prepareStatement(query1);
									ps1.setString(1,nemail);
									ps1.setString(2,username);
									
									ps1.executeUpdate();
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
				}
					else{
						out.print("<p style='color:blue'>Invalid Email</p>");
					}
		}
	
%>
		

		<div class="row height_1">
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="col-lg-10 col-md-6 col-sm-6 padding_tp">
					<h3>Dedicated to providing real time truth for all our users</h3>
					<p>We belive in showing truth and maintaining the privacy.<br> Truth will always be shown so mail us the happening in your surrounding and you will get the credit for all that. Check <strong>Contact</strong> for more information.</p>
					<p>Send us feedback for more improvement in notes section</p>		
						<!-- <button class="btn ani" style="margin-left=20px">Get Started
						<div class="hide">Get Started</div>
					</button> -->
					<button class="btn ani" onclick="window.location.href = 'contact.jsp'">Contact Us
						<div class="hide">Contact Us</div>
					</button>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 img_height">
				<img src="Capture2.png" alt="pic">
			</div>
		</div>
		<div class="row height_2">
			<div class=" bx_shadow col-lg-3 col-md-3 col-sm-12">
				<div class="inner_table">
					<h3>Block application</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos nostrum rem placeat numquam. Qui quod aliquid aliquam repellendus, atque soluta, explicabo ab quibusdam sunt, a quisquam debitis sint incidunt omnis.</p>
					<a href="#">Read More</a>
				</div>
			</div>
			<div class="bx_shadow col-lg-3 col-md-3 col-sm-12">
				<div class="inner_table">
					<h3>Interrogate your infrastructure</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam magni cupiditate quo, voluptatem ullam, id nulla sed facere ad itaque hic! Amet alias facere necessitatibus totam, vero quod, non quam?</p>
					<a href="#">Read More</a>
				</div>
			</div>
			<div class="bx_shadow col-lg-3 col-md-3 col-sm-12">
				<div class="inner_table">
					<h3>Set alert</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus facere ab error odio, amet quaerat incidunt dicta, repellendus natus, aliquid voluptas blanditiis fugit ipsam, nobis obcaecati nostrum autem iure consequatur.</p>
					<a href="#">Read More</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="padding_12 col-lg-6 col-md-6 col-sm-6">
				<h3>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea.</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam, mollitia?</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur odio rem sapiente delectus officia repellendus.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit eum distinctio totam dolorem.</p>
				<h5>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</h5>
			</div>
			<!-- <div class="padding_12 col-lg-6 col-md-6 col-sm-6">
				<div class="img_height_2">
				<img src="images/images.jpg" alt="pic">
				</div>
			</div> -->
		</div>
		<div class="credit">
			<div class="inner_credit">
				<h3>Frequently asked Question</h3>
				<p>Lorem ipsum dolor sit amet, consectetur a amet! Minima, quos, ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur.</p>
			</div>
		</div>
	</div>
	<!-- <div class="row">
		<div class=" col-lg-3 col-md-3 col-sm-12 box d-flex justify-content-center p-3 flex-direction-column">
			<h3>Lorem ipsum dolor.</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad, vitae.</p>
			<button class="btn">view</button>
		</div>
		<++++++++div class="row">
			<div class=" col-lg-3 col-md-3 col-sm-12 box d-flex justify-content-center p-3 flex-direction-column">
				<h3>Lorem ipsum dolor.</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad, vitae.</p>
				<button class="btn">view</button>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		 -->
		<footer>

				<div style="background:url(pexels-photo-62693.jpeg); padding: 14px 25px; text-align: center; overflow: hidden ;width:80%; margin:auto; padding: 10px">
					
						<div class="row w-100">
							<img src="618c72cd-de43-4ce6-bd77-d244cc610535.png" height="100px" style="clear:both">
							<div class="col-lg-4 col-md-4 col-sm-4 px-0" style="color: rgb(7, 7, 136);font-size:35px; white-space:pre">           Express Nepal</div>
							<ul style="list-style-type: none;">
								<li><a href="alindex.jsp">About</a></li>
								<li><a href="about.jsp">About Us</a></li>
								<li><a href="note.jsp">Notes</a></li>
								<li><a href="contact.jsp">Contact</a></li>
							</ul>
						</div>
			</div>
		</footer>
	</body>
	<script src="js/index.js"></script>
	</html>