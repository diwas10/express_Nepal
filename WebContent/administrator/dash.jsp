<%
	if(session.getAttribute("adminname")==null){
		response.sendRedirect("alogin.jsp");	}
%>

<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="java.sql.*"%>
<%!ResultSet result; %>
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
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Dash Board</title>
		<%@ include file="header.jsp" %>
	</head>
	<body>
		<%@ include file="body.jsp" %>
		<%result.next();%>
		
		<div style="font-size:30px">Welcome <%=result.getString("name")%>  |<span style=font-size:25px> <a href="logout.jsp" style="text-decoration: none">logout</a></span></div>  <br>
		
		<img src="/express_Nepal/administrator/profileimage/<%=result.getString("picture")%>" height=150px style="margin-left:100px;" ><br>
		<p style="font-size:25px;white-space:pre;margin-left:42%;clear:both"><a href="writingarticle.jsp?wname=<%=result.getString("name")%>" style="text-decoration:none;">Write an Article</a></p>
		<form action="profilepicupload.jsp" method="post" enctype="multipart/form-data">
			<p>Change Picture</p>
			<input type="file" value="" name="ufile">
			
			<input type="submit" value="Change">
		</form><br>
		
		<p style="white-space:pre;">Email:  <%=result.getString("email") %><a href="Updateemailform.jsp" style="text-decoration: none"><img src="edit-interface-symbol-of-a-pencil-on-a-square-outline-paper_318-61160.png" height=10px style="margin-left:10px">edit</a></p>
		
		<p style="white-space:pre;">Password:<a href="pwd.jsp" style="text-decoration: none">Change</a></p><br>
		
		
		
		
	</body>
</html>