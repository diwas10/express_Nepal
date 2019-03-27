<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%
 	if (session.getAttribute("lusername")==null){
 		response.sendRedirect("index.jsp");
 	}
 %>   
    
    <%!ResultSet rs; %>
<%
		String email=""+session.getAttribute("lusername");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
		
		String query="SELECT * FROM users WHERE email=?";
		
		PreparedStatement ps=connection.prepareStatement(query);
		ps.setString(1, email);
		
		rs=ps.executeQuery();
		rs.next();
		
	}
	catch(Exception e){
		e.printStackTrace();
	}


%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Express -Profile</title>
		<%@ include file="title.jsp" %>
	</head>
	<body >
		<%@ include file="header.jsp" %>
		<h2>Express <%=rs.getString("name") %></h2>
		
		<div>
			
			<aside ><img src="<%=rs.getString("picture") %>" height="100px" style="margin-left:2% ;border-radius: 50%;border: 2px solid blue;  padding: 5px; height:150px"></aside><br><br>
			
			<form action="ucpic.jsp" method="post" enctype="multipart/form-data">
			
				Change Picture:  <input type="file" name="pic" value="">
				<input type="submit" name="pic" value="Change">
			
			</form><br>
			
			<p style="white-space:pre;">Email: <%=rs.getString("email") %>   <button class="btn" onclick="window.location.href = 'ueemail.jsp';" value="Link" style="color:white;background-color:blue;border-radius: 15px;">Edit</button>   </p>
			<p style="white-space:pre;">Password:    <button class="btn" onclick="window.location.href = 'ucpassword.jsp';" value="Link" style="color:white;background-color:blue;border-radius: 15px;">Change</button></p>
		</div>
		<%-- <%@ include file="footer.jsp" %>  --%>
	</body>
</html>