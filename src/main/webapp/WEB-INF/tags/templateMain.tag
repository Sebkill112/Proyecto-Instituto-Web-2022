<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@ attribute name="title" required="true" rtexprvalue="true"%>
<%@ attribute name="styles" fragment="true"%>
<%@ attribute name="content" fragment="true"%>
<%@ attribute name="libraries" fragment="true"%>


<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<title>${ title }</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" rel="stylesheet">
<link href="datepicker/bootstrap-datepicker.css" rel="stylesheet">

<!--=============== BOXICONS ===============-->
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

<script src="https://kit.fontawesome.com/7efb9c493b.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="css/styleAdmin.css">
<link rel="stylesheet" href="css/modeOscuro.css">

<style type="text/css">
	.contenido-central{
	padding: 1%;
	height: 590px;
	overflow: scroll;
	}
</style>


<jsp:invoke fragment="styles"></jsp:invoke>
</head>

<body>

	<div class="paqueteAdmin">
		<div class="marca">
			<div class="logo">
				<i class='bx bx-building'></i>
				<div class="logo_name">Instituto</div>
			</div>

			<i class='bx bx-menu' id="btn"></i>
		</div>

		<div class="lateral">
			<ul class="lupa">
				<li class=dibujo><a class="iconoDerecho" href="#"> <i
						class='bx bx-search'></i> <input type="text"
						placeholder="Search....">
				</a> <span class="tooltip">Search</span></li>
				
				
				
				<c:forEach items="${sessionScope.listaMenus}" var="x">
					<li class="dibujo">
						<a class="iconoDerecho" href="${x.url}"> 
							<i class='bx bx-grid-alt'></i> 
							<span class="links_name">${x.descripcion}</span>
						</a> 
						<span class="tooltip">${x.descripcion}</span>
					</li>
				</c:forEach>
				
			</ul>

		</div>




		<div class="espacioAdmin">
			<div class="profile">
				<div class="profile_details">
					<img src="img/usuarioGeneral.png" alt="">
					<div class="name_job">
						<div class="name">${sessionScope.usuario.getNombres()}</div>
						<!-- <div class="job">Fronted</div>  -->
					</div>
				</div>
				
				<a href="ServletUsuario?accion=CERRAR">
					<i class='bx bx-log-out' id="log_out"></i>
				</a>

				
			</div>
		</div>

	</div>


	<div class="casa">
		<div class="top">
			<div class="title">${ title }</div>
			<div class="icon">
				<!-----------Theme change button------------>
				<i class="bx bx-moon change-theme" id="theme-button"></i>
			</div>
		</div>
		
		<div class="contenido-central">
			<jsp:invoke fragment="content"></jsp:invoke>
		</div>

	</div>



	
	
	<!-- ================= LIBRERIAS ================== -->
	<!-- JS principal -->
	<script src="js/jquery-3.5.1.js"></script>
	
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- JS para la tabla -->
	<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

	<!--=============== SWIPER JS ===============-->
	<script src="js/swiper-bundle.min.js"></script>
	<script src="js/admin.js"></script>
	<script src="js/mainBlack.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
		
	
	<jsp:invoke fragment="libraries"></jsp:invoke>

</body>

</html>