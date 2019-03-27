<%@page import="java.sql.*"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! String picname; %>
<%
	/* if(request.getParameter("pic").isEmpty()){
		response.sendRedirect("userprofile.jsp");
	}
	else{   */
		DiskFileItemFactory dfif=new DiskFileItemFactory();
		ServletFileUpload sfu=new ServletFileUpload(dfif);
		
		List list=sfu.parseRequest(request);
		
		Iterator iterator=list.iterator();
		
		while(iterator.hasNext()){
			FileItem fileItem=(FileItem) iterator.next();
			
			picname=fileItem.getName();
			
			File file=new File("C:\\Users\\Diwash baral\\eclipse-workspace-jee\\express_Nepal\\WebContent\\userspage\\userpicture",picname);
			
			fileItem.write(file);
		
		}
	
	try{
		
		String email= "" +request.getParameter("pic");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connect=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
		
		String query="UPDATE users SET picture=? WHERE email=?";
		
		PreparedStatement ps=connect.prepareStatement(query);
		
		ps.setString(1,picname);
		ps.setString(2,email);
		
		ps.executeUpdate();
		
		response.sendRedirect("userprofile.jsp");
		
	}
	
	catch(Exception e){
		e.printStackTrace();
	}
%>