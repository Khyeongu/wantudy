<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="16x16" href="/xciweb01/img/favicon16.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="${context}/resources/css/login/animate.css">

<link rel="stylesheet" href="${context}/resources/css/login/owl.carousel.min.css">
<link rel="stylesheet" href="${context}/resources/css/login/owl.theme.default.min.css">
<link rel="stylesheet" href="${context}/resources/css/login/magnific-popup.css">

<link rel="stylesheet" href="${context}/resources/css/login/bootstrap-datepicker.css">
<link rel="stylesheet" href="${context}/resources/css/login/jquery.timepicker.css">


<link rel="stylesheet" href="${context}/resources/css/login/flaticon.css">
<link rel="stylesheet" href="${context}/resources/css/login/style.css">


</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html"><span>wantudy</span></a>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
		<div class="overlay"></div>
	</div>

	<section class="ftco-section ftco-no-pb ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="login-wrap p-4 p-md-5 mb-5">
					<h3 class="mb-4">Register Now</h3>
					<form action="#" class="signup-form">
						<div class="form-group">
							<label class="label" for="name">Name</label> <input type="text" class="form-control" placeholder="John Doe">
						</div>
						<div class="form-group">
							<label class="label" for="email">ID</label> <input type="text" class="form-control" placeholder="johndoe@gmail.com">
						</div>
						<div class="form-group">
							<label class="label" for="password">Password</label> <input id="password-field" type="password" class="form-control" placeholder="Password">
						</div>
						<div class="form-group">
							<label class="label" for="password">Confirm Password</label> <input id="password-field" type="password" class="form-control" placeholder="Confirm Password">
						</div>
						<div class="form-group d-flex justify-content-end mt-4">
							<button type="submit" class="btn btn-primary submit">
								<span class="fa fa-paper-plane"></span>
							</button>
						</div>
					</form>
					<p class="text-center">
						Already have an account? <a href="#signin">Sign In</a>
					</p>
				</div>

				<div class="mt-5 mb-5"></div>
			</div>
		</div>
	</section>


	<footer class="ftco-footer ftco-no-pt">
		<div class="container">
			<div class="row mb-5"></div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved by | <a href="https://github.com/Khyeongu" target="_blank">Kang Hyun Gu</a> | Lim You Rim | <a href="https://github.com/gawibawibo" target="_blank">Kim Seok Yun</a> | <a href="http://www.hyundai-ite.com/index.jsp" target="_blank">Hyundai Project</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="${context}/resources/js/login/jquery.min.js"></script>
	<script src="${context}/resources/js/login/jquery-migrate-3.0.1.min.js"></script>
	<script src="${context}/resources/js/login/popper.min.js"></script>
	<script src="${context}/resources/js/login/bootstrap.min.js"></script>
	<script src="${context}/resources/js/login/jquery.easing.1.3.js"></script>
	<script src="${context}/resources/js/login/jquery.waypoints.min.js"></script>
	<script src="${context}/resources/js/login/jquery.stellar.min.js"></script>
	<script src="${context}/resources/js/login/owl.carousel.min.js"></script>
	<script src="${context}/resources/js/login/jquery.magnific-popup.min.js"></script>
	<script src="${context}/resources/js/login/jquery.animateNumber.min.js"></script>
	<script src="${context}/resources/js/login/bootstrap-datepicker.js"></script>
	<script src="${context}/resources/js/login/scrollax.min.js"></script>
	<script src="https://ma/resourcesps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${context}/resources/js/login/google-map.js"></script>
	<script src="${context}/resources/js/login/main.js"></script>

</body>
</html>