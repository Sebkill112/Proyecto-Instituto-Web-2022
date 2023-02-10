<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<%
		if(request.getSession().getAttribute("listaMenus")==null)
			response.sendRedirect("Index.jsp?MENSAJE=Iniciar login");
	%>

<mt:templateMain title="Pagina Principal">
	<jsp:attribute name="content">
	
	<img src="img/biblioteca.jpg" width="80%" >
	
	
	</jsp:attribute>
	
	<jsp:attribute name="libraries">
	</jsp:attribute>
</mt:templateMain>