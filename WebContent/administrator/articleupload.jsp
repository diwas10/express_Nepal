<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>

<%
	if(session.getAttribute("adminname")==null){
		response.sendRedirect("alogin.jsp");	}
%>

    <%!String filename, headlines, articles; %>
    
<%
	DiskFileItemFactory dfif= new DiskFileItemFactory();
	ServletFileUpload sfu= new ServletFileUpload(dfif); 
	
	List list=sfu.parseRequest(request);
	
	Iterator iterator=list.iterator();
	
	while(iterator.hasNext()){
		FileItem fileitem=(FileItem) iterator.next();
		
		if(fileitem.isFormField()){
			
		   String fieldname=fileitem.getFieldName();
			
			if( fieldname.equals("head")){
				 headlines=fileitem.getString();
			}
			
			else if(fieldname.equals("art")){
				 articles=fileitem.getString();
			}
		}
		else{
			
			filename=fileitem.getName();
			
			File file=new File("C:\\Users\\Diwash baral\\eclipse-workspace-jee\\express_Nepal\\WebContent\\images",filename);
			fileitem.write(file);
		}
	}
	try{
		String name= request.getParameter("wnm");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/newsportal","root","");
		
		String sql="INSERT INTO news(headline,article,picture,writer) VALUES(?,?,?,?)";
		
		PreparedStatement prepare=con.prepareStatement(sql);
		
		prepare.setString(1, headlines);
		prepare.setString(2, articles);
		prepare.setString(3, filename);
		prepare.setString(4, name);
		
		prepare.executeUpdate();
		response.sendRedirect("writingarticle.jsp");
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>