<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>
    <%
	if(session.getAttribute("adminname")==null){
		response.sendRedirect("alogin.jsp");	}
%>

<%
	String email=request.getParameter("em");
	String loginname=""+session.getAttribute("adminname")+"";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection connect=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
		
		String query="UPDATE admin SET email=? WHERE login_name=?";
		
		PreparedStatement prepare=connect.prepareStatement(query);
		
		prepare.setString(1,email);
		
		prepare.executeUpdate();
		
		response.sendRedirect("dash.jsp");
		
		
	}
	catch(Exception e){
		e.printStackTrace();
	}

%>