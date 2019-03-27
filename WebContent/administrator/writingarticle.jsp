
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%!  ResultSet result; %>
    	
    
<%
	if(session.getAttribute("adminname")==null){
		response.sendRedirect("alogin.jsp");	}
%>

<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection connect=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
		
		String query="SELECT * FROM news ";
		
		PreparedStatement prepare=connect.prepareStatement(query);
		
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
		<title>Article</title>
		<%@ include file="header.jsp" %>
	</head>
	<body>
		<%@ include file="body.jsp" %>
		<h1>Write  an article <%=request.getParameter("wname") %></h1>
		
		<form action="articleupload.jsp?wnm=<%= request.getParameter("wname") %>" method="post" enctype="multipart/form-data" style="float:right;margin-right:25%;clear:both;margin-bottom:10%;">
	
			<h4> Headline</h4>
			<textarea name="head" rows="5" cols="100"></textarea><br>
			
			<h4>Picture</h4>
			<input type="file" value="" name="nfile">
			
			<h4> Article</h4>
			<textarea name="art" rows="20" cols="100"></textarea><br>
			
			<input type="submit" value="Upload" >
		
		</form>
		
		<p>Read articles and perform actions if needed</p>

		<table  width="100%" border="1" cellpadding="0"cellspacing="0">
		
			<tr >
				<th width=2%>S.no</th>
				<th width=11%>Writer</th>
				<th width=17%>Headline</th>
				<th width=30%>Article</th>
				<th width=20%>Pictures</th>
				<th width=10%>Actions</th>
			</tr>
			
			<%while(result.next()){ %>
			<tr>
				<td><%= result.getString("id") %></td>
				<td><%= result.getString("writer") %></td>
				<td><%= result.getString("headline") %></td>
				<td><%= result.getString("article") %></td>
				<td> <%= result.getString("picture") %></td>
				<%} %>
				<td></td>
			</tr>
		
	</table>

	</body>
</html>