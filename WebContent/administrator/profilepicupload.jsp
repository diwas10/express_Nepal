<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	if(session.getAttribute("adminname")==null){
		response.sendRedirect("alogin.jsp");	}
%>

<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>

<%!String filename; %>

<%
	DiskFileItemFactory dfif=new DiskFileItemFactory();
	ServletFileUpload sfu=new ServletFileUpload(dfif);
	
	List list=sfu.parseRequest(request);
	
	Iterator iterator=list.iterator();
	
	while(iterator.hasNext()){
		FileItem fileItem=(FileItem) iterator.next();
		
		 filename=fileItem.getName();
		
		File file=new File("C:\\Users\\Diwash baral\\eclipse-workspace-jee\\express_Nepal\\WebContent\\administrator\\profileimage",filename);
		fileItem.write(file);
		
		
		
	}
	
		String name= ""+session.getAttribute("adminname")+"";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
			
			String sql="UPDATE admin SET picture= ? WHERE login_name=?";
			
			PreparedStatement prepare=con.prepareStatement(sql);
			
			prepare.setString(1, filename);
			prepare.setString(2, name);
			
			prepare.executeUpdate();
			
			response.sendRedirect("dash.jsp");
			
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
	
		
		
%>