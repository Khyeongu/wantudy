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

<link rel="stylesheet" href="${context}/resources/css/sign/animate.css">

<link rel="stylesheet" href="${context}/resources/css/sign/owl.carousel.min.css">
<link rel="stylesheet" href="${context}/resources/css/sign/owl.theme.default.min.css">
<link rel="stylesheet" href="${context}/resources/css/sign/magnific-popup.css">

<link rel="stylesheet" href="${context}/resources/css/sign/bootstrap-datepicker.css">
<link rel="stylesheet" href="${context}/resources/css/sign/jquery.timepicker.css">


<link rel="stylesheet" href="${context}/resources/css/sign/flaticon.css">
<link rel="stylesheet" href="${context}/resources/css/sign/style.css">



</head>






<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="../"><span>wantudy</span></a>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap " style="background-image: url('${context}/resources/img/sign/login.jpg'); height: 2500px; ">
		<div class="overlay"></div>


		<section class="ftco-section ftco-no-pb ftco-no-pt">
			<div class="container">
				<div class="row">
					<div class="col-md-3"></div>

					<div class="col-md-6 signupAbilityLvl-wrap p-4 p-md-5">
						<h3 class="mb-4">Ability Level</h3>
						<form class="signup-form" method="POST">
							<div class="form-group">
								<label class="label" for="interest1">관심분야 1</label>
								<div>
									<select id="interest1" name="interest1" class="form-control mt-1">
										<option value="0">선택안함</option>
										<option value="5">알고리즘</option>
										<option value="8">웹</option>
										<option value="6">안드로이드</option>
										<option value="12">IOS</option>
										<option value="9">자료구조</option>
										<option value="3">머신러닝</option>
										<option value="10">프로그래밍 언어</option>
										<option value="7">운영체제</option>
										<option value="11">컴퓨터구조</option>
										<option value="2">디자인패턴</option>
										<option value="4">컴뷰터 보안</option>
										<option value="1">네트워크</option>
										<option value="13">데이터베이스</option>
									</select>

								</div>
							</div>
							<div class="form-group">
								<label class="label" for="interest2">관심분야 2</label>
								<div>
									<select id="interest2" name="interest2" class="form-control mt-1">
										<option value="0">선택안함</option>
										<option value="5">알고리즘</option>
										<option value="8">웹</option>
										<option value="6">안드로이드</option>
										<option value="12">IOS</option>
										<option value="9">자료구조</option>
										<option value="3">머신러닝</option>
										<option value="10">프로그래밍 언어</option>
										<option value="7">운영체제</option>
										<option value="11">컴퓨터구조</option>
										<option value="2">디자인패턴</option>
										<option value="4">컴뷰터 보안</option>
										<option value="1">네트워크</option>
										<option value="13">데이터베이스</option>
									</select>

								</div>
							</div>
							<div class="form-group">
								<label class="label" for="interest3">관심분야 3</label>
								<div>
									<select id="interest3" name="interest3" class="form-control mt-1">
										<option value="0">선택안함</option>
										<option value="5">알고리즘</option>
										<option value="8">웹</option>
										<option value="6">안드로이드</option>
										<option value="12">IOS</option>
										<option value="9">자료구조</option>
										<option value="3">머신러닝</option>
										<option value="10">프로그래밍 언어</option>
										<option value="7">운영체제</option>
										<option value="11">컴퓨터구조</option>
										<option value="2">디자인패턴</option>
										<option value="4">컴뷰터 보안</option>
										<option value="1">네트워크</option>
										<option value="13">데이터베이스</option>
									</select>

								</div>
							</div>

							<div class="form-group d-flex justify-content-end mt-4">
								<button type="submit" class="btn btn-primary submit" id="get_all_interests">
									<span class="fa fa-paper-plane"></span>
								</button>
							</div>
						</form>
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</section>

	</div>




	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
				
				</div>
				<div class="col-lg-4 col-md-12">
					
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Hyundai IT&E 2차 팀 프로젝트&nbsp;&nbsp;|&nbsp;&nbsp;Wantudy : 원하는 사람과 스터디를!&nbsp;&nbsp;|&nbsp;&nbsp;made by&nbsp;&nbsp; <i class="fa fa-heart" aria-hidden="true"></i>
								&nbsp;&nbsp;<a href="https://github.com/Khyeongu" target="_blank">강현구</a> | 
								<a href="https://github.com/gawibawibo" target="_blank">김석윤</a> | 
								<a href="https://github.com/ImYurim" target="_blank">임유림</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment"></div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
         <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
         <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="${context}/resources/js/sign/jquery.min.js"></script>
	<script src="${context}/resources/js/sign/jquery-migrate-3.0.1.min.js"></script>
	<script src="${context}/resources/js/sign/popper.min.js"></script>
	<script src="${context}/resources/js/sign/bootstrap.min.js"></script>
	<script src="${context}/resources/js/sign/jquery.easing.1.3.js"></script>
	<script src="${context}/resources/js/sign/jquery.waypoints.min.js"></script>
	<script src="${context}/resources/js/sign/jquery.stellar.min.js"></script>
	<script src="${context}/resources/js/sign/owl.carousel.min.js"></script>
	<script src="${context}/resources/js/sign/jquery.magnific-popup.min.js"></script>
	<script src="${context}/resources/js/sign/jquery.animateNumber.min.js"></script>
	<script src="${context}/resources/js/sign/bootstrap-datepicker.js"></script>
	<script src="${context}/resources/js/sign/scrollax.min.js"></script>
	<script src="https://ma/resourcesps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${context}/resources/js/sign/google-map.js"></script>
	<script src="${context}/resources/js/sign/main.js"></script>


</body>
</html>