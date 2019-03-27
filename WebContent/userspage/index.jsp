<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.regex.Matcher"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


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
<body style="overflow -y:auto">
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light px-0">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo01" style="height:130px;background-color: rgb(192, 190, 190); padding: 14px 25px; text-align: center;  background:url(pexels-photo-62693.jpeg)">
					
				<div class="row w-100">
					<figure>
						<img src="618c72cd-de43-4ce6-bd77-d244cc610535.png" height="150px" style="clear:both;padding-top:30px" >
						<!-- <figcaption style="font-size: 20px; color:blue; padding-left:40px" >Be Express</figcaption> -->
					</figure>
				  
					<!-- <div class="col-lg-4 col-md-4 col-sm-4 px-0">Express Nepal</div> -->
					<div class="col-lg-4 col-md-4 col-sm-4 nav_menu px-0" style="padding:80px;color:blue">
						<a href="index.jsp">Home</a>
						<a href="about.jsp">About us</a>
						<a href="note.jsp">Notes</a>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 btn_account px-0 drop_1" style="padding:80px">

					
						<!-- <button class="btn" onclick="window.location.href = 'ulogin.jsp';" value="Link">Log In</button> -->
						<p><button onclick="myFunction()" style="border-radius:50px; border:2px solid blue; ">Log in</button>
						<button onclick="createfxn()" style="border-radius:50px; border:2px solid blue; ">Create an Account</button><p>
						

													
						<script>
							function myFunction() {
								  var x = document.getElementById("login");
								  if (x.style.display === "none") {
								    x.style.display = "block";
								  } else {
								    x.style.display = "none";
								    
								  }
							}
							
							function createfxn() {
								  var x = document.getElementById("account");
								  if (x.style.display === "none") {
								    x.style.display = "block";
								  } else {
								    x.style.display = "none";
								  }
							}
							
							
						</script>
						
<!-- 						<button class="btn space_margin" onclick="window.location.href = 'usercreates.jsp';" value="Link">Create an Account</button> -->
					
					</div>
				</div>
			</div>
			
		</nav>
							<div id="login" style="display: none;" align=center>
								<h5>Please provide your login credentials</h5>
									<form action="" method="post">
									<table>
										<tr>
											<td>User Name</td>
											<td> <input type="text"  name="uunm" value=""></td>
										</tr>
										
										
										<tr>
											<td>Password</td>
											<td> <input type="password"  name="ulpwd" value=""></td>
										</tr>
										
										
										<tr>
											<td> <input type="submit"  name="login" value="Log in" style="border-radius:50px; border:2px solid blue"></td>
										</tr>
										
									</table>
								</form>
								

							</div>

<%

					if(request.getParameter("login")!=null){
						
						String ulpassword=request.getParameter("ulpwd");
						String username=request.getParameter("uunm");
						
						boolean error=false;
						
						
						if(ulpassword.isEmpty()){
							 error=true;
							 out.print("<p style='color:blue'>Enter Your Password</p>");
						}
						
						if(username.isEmpty()){
							 error=true;
							 out.print("<p style='color:blue'>Enter Your User Name</p>");
						}
						
						if(error==false){
						
						
							try{
								
								Class.forName("com.mysql.jdbc.Driver");
								Connection connect=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
								
								String query="SELECT username AND password FROM users WHERE username=? AND password=?";
								
								PreparedStatement prepare=connect.prepareStatement(query);
								
								prepare.setString(1, username);
								prepare.setString(2, ulpassword);
								
								ResultSet rs=prepare.executeQuery();
								
								if(rs.next()){
									session.setAttribute("lusername",username);
									response.sendRedirect("alindex.jsp");
								}
								
								else{
									out.print("<p style='color:blue'>Invalid email or username</p>");
								}
							}
						
						catch(Exception e){
							e.printStackTrace();
						}
					}
				}

%> 
							<div id="account" style="display: none;" align=center>
							<h5>Please provide your credentials</h5>
	
								<form action="" method="post">
									<table>
										<tr>
											<td>Name</td>
											<td> <input type="text"  name="runm" value=""></td>
										</tr> 
										
										<tr>
											<td> User Name</td>
											<td> <input type="text"  name="cuunm" value=""></td>
										</tr> 
						
										<tr>
											<td>Email</td>
											<td> <input type="text"  name="uem" value=""></td>
										</tr>
										
										<tr>
											<td>Password</td>
											<td> <input type="password"  name="upwd" value=""></td>
										</tr>
										
										<tr>
											<td> Confirm Password</td>
											<td> <input type="password"  name="ucpwd" value=""></td>
										</tr>
										
										<tr>
										<th></th></tr><tr><th></th></tr><tr><th></th></tr><tr><th></th>
										</tr><tr><th></th></tr><tr><th></th></tr><tr><th></th></tr><tr><th></th>
										</tr><tr><th></th></tr><tr><th></th></tr><tr><th></th></tr><tr><th></th>
										</tr><tr><th></th></tr><tr><th></th></tr><tr><th></th></tr><tr><th></th>
										</tr>
										
										<tr>
											<th> <input type="submit"  name="create" value="Create Account" style="border-radius:50px; border:2px solid blue; "></th>
										</tr>
										
									</table>
									</form>
								<br>
								<!-- <h4>OR</h4> -->
								<!-- <button class="btn space_margin" onclick="window.location.href = 'ulogin.jsp';" value="Link" style="border-radius:50px; border:2px solid blue">Log in</button> -->
								<p>Note: Login is required after creating account</p>

							
							</div>
									
<%
	if(request.getParameter("create")!=null){
		
		String uname=request.getParameter("runm");
		String upassword=request.getParameter("upwd");
		String uemail=request.getParameter("uem");
		String ucpassword=request.getParameter("ucpwd");
		String username=request.getParameter("cuunm");
		String upicture="618c72cd-de43-4ce6-bd77-d244cc610535.png";
		
		boolean error=false;
		
		if(uname.isEmpty()){
			 error=true;
			 out.print("<p style='color:blue'>Enter Your Name</p>");
		}
		
		if(upassword.isEmpty()){
			 error=true;
			 out.print("<p style='color:blue'>Enter Your password</p>");
		}
		
		if(uemail.isEmpty()){
			 error=true;
			 out.print("<p style='color:blue'>Enter Your Email</p>");
		}
		
		if(ucpassword.isEmpty()){
			 error=true;
			 out.print("<p style='color:blue'>Enter Your Confirmation Password</p>");
		}
		
		if(username.isEmpty()){
			 error=true;
			 out.print("<p style='color:blue'>Enter Your User Name</p>");
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
								
								String query1="SELECT email AND username FROM users WHERE email=? AND username=?";
								
								PreparedStatement prepare1=connect1.prepareStatement(query1);
								prepare1.setString(1,uemail);
								prepare1.setString(2,username);
								
								ResultSet rs=prepare1.executeQuery();
								
								if(rs.next()){
									out.print("<p style='color:blue'>Email Address or username is already used</p>");
								}
								
								else{
									
									try{
										Class.forName("com.mysql.jdbc.Driver");		
										Connection connect=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
										
										String query="INSERT INTO users(name,email,password,picture,username) VALUES(?,?,?,?,?)";
										
										PreparedStatement prepare=connect.prepareStatement(query);
										
										prepare.setString(1,uname);
										prepare.setString(2,uemail);
										prepare.setString(3,upassword);
										prepare.setString(4,upicture);
										prepare.setString(5,username);
										
										prepare.executeUpdate();								
										
										response.sendRedirect("alindex.jsp"); 
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
						out.print("<p style='color:blue'>Wrong email address or confirmation of password</p>");
					}
				}
			}
		}

%>
								
							
							
		<div class="row height_1">
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="col-lg-10 col-md-6 col-sm-6 padding_tp">
					<h3>Dedicated to providing real time truth for all our users</h3>
					<p>We belive in showing truth and maintaining the privacy.<br> Truth will always be shown so mail us the happening in your surrounding and you will get the credit for all that. Check <strong>Contact</strong> for more information.</p>
					<p>Send us feedback for more improvement in notes section</p>
				<!-- 	<button class="btn ani" style="margin-left=20px">Get Started
						<div class="hide">Get Started</div>
					</button> -->
					<!-- <button class="btn ani">Contact Us
						<div class="hide">Contact Us</div>
					</button> -->
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
								<li><a href="index.jsp">Home</a></li>
								<li><a href="about.jsp">About</a></li>
								<li><a href="note.jsp">Notes</a></li>
							</ul>
						</div>
			</div>
		</footer>
	</body>
	<script src="js/index.js"></script>
	</html>