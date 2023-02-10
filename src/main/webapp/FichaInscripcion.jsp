<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<%
		if(request.getSession().getAttribute("listaMenus")==null)
			response.sendRedirect("Index.jsp?MENSAJE=Iniciar login");
%>

<mt:templateMain title="Ficha de Inscripción">
    <jsp:attribute name="styles">
    </jsp:attribute>

	<jsp:attribute name="content">
	
	
	<style>
	
	.text-uppercase{
		color:#23D0BC;
	}
	.form-label{
		color:#23D0BC;
	}
	.row>*{
	color:#9da0b3;
	}
	
	
	
	</style>
	
	
	<h1 class="text-center mb-4 text-uppercase">Registrar Ficha
		Inscripcion</h1>

	<c:if test="${param.MENSAJE!=null}">
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">
			<strong>Sistema : ${param.MENSAJE}</strong>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</c:if>
	<div class="container border border-info">

		<form class="row g-3" method="post" action="ServletRegistro?accion=GRABAR">
			
			
			
			
			<div class="col-md-4">
				<strong> <label for="inputEmail4" class="form-label">Numero de Registro</label></strong>
				<input type="text" class="form-control" id="id-numero" readonly name="numero">
			</div>
			<div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Fecha Registro</label>
					    <input type="text" class="form-control"  value="${sessionScope.fecha}" readonly name="fecha">
			</div>
			
				<input type="hidden" value="0" name="idInscripcion">
			
			<h2>Datos Alumno</h2>
			<div class="col-md-4">
				<label for="inputEmail4" class="form-label">DNI</label> <input
					type="text" class="form-control" id="id-dni" name="dni">
			</div>
			<div class="col-md-4">
				<label for="inputPassword4" class="form-label">Nombre Alumno</label>
				<input type="text" class="form-control" id="id-nombre" readonly>
			</div>
			<div class="col-md-4">
				<label for="inputPassword4" class="form-label">Apellido</label> <input
					type="text" class="form-control" id="id-apellido" readonly>
			</div>
			<div class="col-md-4">
				<label for="inputEmail4" class="form-label">Fecha Nacimiento</label>
				<input type="date" class="form-control" id="id-fecNacimiento" readonly>
			</div>
			<div class="col-md-4">
				<label for="inputPassword4" class="form-label">Correo</label> <input
					type="text" class="form-control" id="id-correo">
			</div>
			<div class="col-md-4">
				<label for="inputPassword4" class="form-label">Direccion</label> <input
					type="text" class="form-control" id="id-direccion">
			</div>
			<div class="col-md-6">
				<button type="button" class="btn  btn-warning mt-3 btn-buscar" ><i class="bi bi-search"></i>&nbsp
					Alumno</button>
			</div>

			<h2>Datos Carrera</h2>
			 <div class="form-group">
				    <label for="exampleCondicion" class="form-label">Carrera</label>
				    <select class="form-select form-control" name="facultad" id="id-carrera">
					  <option value="" selected>[Seleccione Facultad]</option>
					  			

					</select>
				  </div>
			<div class="col-md-4">
				<label for="inputPassword4" class="form-label">Facultad</label> <input
					type="text" class="form-control" id="id-facultad" readonly>
			</div>
			<div class="col-md-4">
				<label for="inputEmail4" class="form-label">Numero de Ciclos</label>
				<input type="text" class="form-control" id="id-ciclo" readonly>
			</div>
			<div class="col-md-4">
				<label for="inputPassword4" class="form-label">Creditos</label> <input
					type="text" class="form-control" id="id-creditos" readonly>
			</div>

			
			<div class="form-group" style="text-align: center">
				<button type="submit" class="btn btn-success"><i class="bi bi-box-seam-fill"></i>&nbsp Grabar Ficha</button>
			</div>

		</form>




	</div>
	
	
	</jsp:attribute>
	
	<jsp:attribute name="libraries">
	<script >
	
	cargarNumero();
	cargarCarreraNombre();
	
	function cargarNumero(){
		$.get("ServletRegistro?accion=CODIGO",function(response){
			//console.log(response);
			$("#id-numero").val(response);		
		})	
	}
	
	function cargarCarreraNombre(){
		//función en JQUERY que permite leer un JSON
		$.get("ServletCarreraNombre",function(response){
			//console.log(response);
			//bucle para realizar recorrido sobre "response"
			$.each(response,function(index,item){
				$("#id-carrera").append("<option value='"+item.codigo+"'>"+item.nomCarrera+"</option>");
			})
		})
	}
	
	
	$(document).on("click",".btn-buscar",function(){
		//variables
		let dni;
		//leer columnas de la fila actual según el botòn buscar que hizo click
		dni=$("#id-dni").val();
		$.get("ServletAlumnoPorDni?accion=BUSCAR&dni="+dni,function(response){
			console.log(response);
			//mostrar en las controles del modalCliente
			$("#id-nombre").val(response.nombre);
			$("#id-apellido").val(response.apellido);
			$("#id-fecNacimiento").val(response.fechaNacimiento);
			$("#id-correo").val(response.correo);
			$("#id-direccion").val(response.direccion);
			
		})
		
	})
	
	
	
	$(document).on("change","#id-carrera",function(){
		//variables
		let cod;
		//leer columnas de la fila actual según el botòn buscar que hizo click
		cod=$("#id-carrera option:selected").val();
		$.get("ServletAlumnoPorDni?accion=CARRERA&cod="+cod,function(response){
			console.log(response);
			//mostrar en las controles del modalCliente
			$("#id-facultad").val(response.nomFacultad);
			$("#id-ciclo").val(response.ciclo);
			$("#id-creditos").val(response.creditos);
					
		})
		
	})
	
	</script>
	</jsp:attribute>
</mt:templateMain>

