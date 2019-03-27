<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%-- <%
	if(session.getAttribute("adminname")==null){
		response.sendRedirect("alogin.jsp");	}
%> --%>
<%
	session.removeAttribute("adminname");
	response.sendRedirect("alogin.jsp");
%>