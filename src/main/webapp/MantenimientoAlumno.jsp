<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<%
		if(request.getSession().getAttribute("listaMenus")==null)
			response.sendRedirect("Index.jsp?MENSAJE=Iniciar login");
%>

<mt:templateMain title="Mantenimiento de Alumno">
	<jsp:attribute name="content">
	

			<c:if test="${param.MENSAJE != null}">
				<div class="alert alert-warning alert-dismissible fade show"
				role="alert">
					<strong>Sistema : </strong> ${param.MENSAJE}
					<div class="primerBoton">
					 	<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
					
					</div>
				
				</div>
			</c:if>

			<!-- <h2 class="text-center mt-3">Mantenimiento Alumno</h2> -->
			<div>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#modalAlumnoRegistrar">New student</button>
			</div>

			<!-- Modal PARA REGISTRAR-->
			<div class="modal fade" id="modalAlumnoRegistrar"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">Create new
								student</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form id="formAlumno" action="ServletAlumno?accion=CREAR"
							method="POST">
								<div class="form-group">
									<label for="exampleDni" class="form-label">DNI</label> <input
									type="text" class="form-control" name="dni" />
								</div>
								<div class="form-group">
									<label for="exampleName" class="form-label">Name</label> <input
									type="text" class="form-control" name="name">
								</div>
								<div class="form-group">
									<label for="exampleLastname" class="form-label">Lastname</label>
									<input type="text" class="form-control" name="lastname">
								</div>

								<div class="form-group">
									<label for="exampleBirth" class="form-label">Date of
										birth</label> <input type="date" class="form-control" name="birth">
								</div>
								<div class="form-group">
									<label for="exampleEmail" class="form-label">Email</label> <input
									type="text" class="form-control" name="email">
								</div>

								<div class="form-group">
									<label for="exampleCondicion" class="form-label">Distric</label>
									<select class="form-select form-control district"
									name="distric" id="id-codDistrito">
										<option value="" selected>[Seleccione Distrito]</option>
									</select>
								</div>

								<div class="form-group">
									<label for="exampleAddress" class="form-label">Address</label>
									<input type="text" class="form-control" name="address">
								</div>

								<div class="form-group">
									<label for="exampleCondicion" class="form-label">Country</label>
									<select class="form-select form-control country" name="country"
									id="id-codPais">
										<option value="" selected>[Seleccione País]</option>
									</select>
								</div>


								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">
										<i class="bi bi-arrow-up-circle-fill"></i> Registrar
									</button>
									<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">
										<i class="bi bi-x-octagon-fill"></i> Cerrar
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--fin modal PARA REGISTRAR-->

			<div class="row g-6">
				<div class="row g-3">
					<div class="col-auto">
						<label for="validationCustomUsername" class="form-label fw-bold">Enter
							Dni</label>
					</div>

					<div class="col-sm-2">
						<input type="text" class="form-control" id="dni">
					</div>
					<div class="col-auto">
						<button type="button" class="btn btn-primary" id="btn-consultar">Look
							Up</button>
					</div>
				</div>
			</div>







			<!------------------------------------ LISTAR------------------------ -->
			<div class="table-responsive">
			  <table class="table table-striped table-bordered" id="tableStudent">
			    <thead>
						<tr>
							<th>DNI</th>
							<th>Name</th>
							<th>Last name</th>
							<th>Date of birth</th>
							<th>Email</th>
							<th>Career</th>
							<th>Cycle</th>
							<th>Address</th>
							<th>Inscription</th>
							<th>District</th>
							<th>Country</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
			  </table>
			</div>

			<!-- INICIO - Modal EDITAR-->
			<div class="modal fade" id="modalAlumno" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">Update
								Student</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form id="formAlumnoActualizar"
							action="ServletAlumno?accion=ACTUALIZAR" method="post">
								<div class="form-group">
									<label for="dni" class="form-label">Dni</label> <input
									type="text" class="form-control" name="dni" value="0"
									id="id-update-dni" readonly>
								</div>
								<div class="form-group">
									<label for="name" class="form-label">Name</label> <input
									type="text" class="form-control" name="name"
									id="id-update-name">
								</div>
								<div class="form-group">
									<label for="lastname" class="form-label">Lastname</label> <input
									type="text" class="form-control" name="lastname"
									id="id-update-lastname">
								</div>
								<div class="form-group">
									<label for="birth" class="form-label">Birth</label> <input
									type="text" class="form-control" name="birth"
									id="id-update-birth">
								</div>

								<div class="form-group">
									<label for="email" class="form-label">Email</label> <input
									type="text" class="form-control" name="email"
									id="id-update-email">
								</div>

								<div class="form-group">
									<label for="exampleCondicion" class="form-label">Distric</label>
									<select class="form-select form-control district"
									name="distric" id="id-update-codDistrito">
										<option value="" selected>[Seleccione Distrito]</option>
									</select>
								</div>

								<div class="form-group">
									<label for="address" class="form-label">Address</label> <input
									type="text" class="form-control" name="address"
									id="id-update-address">
								</div>

								<div class="form-group">
									<label for="exampleCondicion" class="form-label">Country</label>
									<select class="form-select form-control country" name="country"
									id="id-update-codPais">
										<option value="" selected>[Seleccione País]</option>
									</select>
								</div>

								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">Update</button>
									<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cerrar</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- FIN - Modal PARA EDITAR-->
			<!-----------------------------FIN------ LISTAR------------------------ -->

			<!-- Modal PARA ELIMINAR-->
			<div class="modal fade" id="modalEliminar" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">System</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="ServletAlumno?accion=DELETE" method="post">
								<h4>Seguro de eliminar Alumno?</h4>
								<input type="hidden" class="form-control" name="dni"
								id="codEliminar">
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">SI</button>
									<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">NO</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--fin modal PARA ELIMINAR-->

	<style>
	
	.row .g-3{
	margin-bottom: 2%;
	}
	
	.btn-primary{
	background-color:#23D0BC;
	border-color: black;
	}
	.table-bordered>:not(caption)>*{
	color:#a39191;
	}
	.fw-bold{
	color:#a39191;
	}
	.table-striped>tbody>tr:nth-of-type(odd)>*{
	color:#a39191;
	}
	.btn-info{
	background-color:aquamarine;
	}
	.btn-secondary{
	background-color:#dd0b0b;
	}
	.modal-header{
	background-color:#23D0BC;
	color:#fff;
	}
	
	
	
	
	
	</style>
	
	
	</jsp:attribute>

	<jsp:attribute name="libraries">
		<script type="text/javascript" src="js/MantenimientoAlumno.js"></script>
	</jsp:attribute>
</mt:templateMain>