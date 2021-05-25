<%@page import="dev.team3.wantudy.dto.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<%!MemberDTO memberdto = new MemberDTO(1, "id", "password", "name");%>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${context}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${context}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="${context}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="${context}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${context}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="${context}/resources/css/style.css"
	type="text/css">
<link rel="stylesheet" href="${context}/resources/css/dropdown.css"
	type="text/css">
<link rel="stylesheet" href="${context}/resources/css/dropdown.css"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i> <%=memberdto.getName()%>님
									안녕하세요</li>
								<li>새로운 스터디와 함께 공부해보세요!</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="header__top__right">

							<div class="header__top__right__auth">
								<a href="#"><i class="fa fa-user"></i> Logout</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo  align-self-center">
						<a class="navbar-brand" href="login"><span class="navbar-name">wantudy</span></a>
					</div>
				</div>
				<div class="col-lg-7">
					<nav class="header__menu">
						<ul>
							<li><a href="./index.html">홈</a></li>
							<li><a href="./shop-grid.html">스터디 검색</a></li>
							<li><a href="./shop-grid.html">스터디 추가</a></li>
							<li><a href="#">채팅</a>
							<li><a href="./blog.html">스터디 관리</a></li>
							<li class="active"><a href="./blog.html">마이페이지</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="${context}/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>마이페이지</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Blog Section Begin -->
	<section class="blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item pr-5">
							<h4>마이페이지</h4>
							<ul>
								<li class="active"><a href="#">내 정보 수정</a></li>
								<li><a href="#">지원한 스터디</a></li>
								<li><a class="dropbox" href="#">내 스터디 관리<i
										class="bi small bi-caret-down-fill"></i></a>
									<ul class="submenu collapse">
										<li><a class="nav-link" href="#">Submenu item 4 </a></li>
										<li><a class="nav-link" href="#">Submenu item 5 </a></li>
										<li><a class="nav-link" href="#">Submenu item 6 </a></li>
										<li><a class="nav-link" href="#">Submenu item 7 </a></li>
									</ul></li>
							</ul>
						</div>

					</div>
				</div>

				<div class="col-lg-9 col-md-7">
					<h4 class="mb-3 border__bottom">내 정보 수정</h4>
					<div class="row">
						<div class="col-lg-12">
							<div class="memberinfo" id="memberinfo">
								<form method="post">
									<div>
										<h4>아이디</h4>
										<input type="text" id="id" name="id"
											value="<%=memberdto.getId()%>" disabled>
									</div>
									<div>
										<h4>비밀번호</h4>
										<input type="password" id="password" name="password">
									</div>
									<div>
										<h4>비밀번호 확인</h4>
										<input type="password" id="password-confirm"
											name="password-confirm">
									</div>
									<div>
										<h4>이름</h4>
										<input type="text" id="name" name="name"
											value="<%=memberdto.getName()%>">
									</div>
									<div>
									<div>
										<h4>관심분야 1</h4>
										</div>
										<div>
											<select id="interest1" class="form-control mt-1">
												<option>선택안함</option>
												<option>알고리즘</option>
												<option>웹</option>
												<option>안드로이드</option>
												<option>IOS</option>
												<option>자료구조</option>
												<option>머신러닝</option>
												<option>프로그래밍 언어</option>
												<option>운영체제</option>
												<option>컴퓨터구조</option>
												<option>디자인패턴</option>
												<option>컴뷰터 보안</option>
												<option>네트워크</option>
												<option>데이터베이스</option>
											</select>
											
									</div>
									<div>
										<h4>관심분야 2</h4>
										</div>
										<div>
											<select id="interest2" class="form-control mt-1">
												<option>선택안함</option>
												<option>알고리즘</option>
												<option>웹</option>
												<option>안드로이드</option>
												<option>IOS</option>
												<option>자료구조</option>
												<option>머신러닝</option>
												<option>프로그래밍 언어</option>
												<option>운영체제</option>
												<option>컴퓨터구조</option>
												<option>디자인패턴</option>
												<option>컴뷰터 보안</option>
												<option>네트워크</option>
												<option>데이터베이스</option>
											</select>
											
									</div>
									<div>
										<h4>관심분야 3</h4>
										</div>
										<div>
											<select id="interest3" class="form-control mt-1">
												<option>선택안함</option>
												<option>알고리즘</option>
												<option>웹</option>
												<option>안드로이드</option>
												<option>IOS</option>
												<option>자료구조</option>
												<option>머신러닝</option>
												<option>프로그래밍 언어</option>
												<option>운영체제</option>
												<option>컴퓨터구조</option>
												<option>디자인패턴</option>
												<option>컴뷰터 보안</option>
												<option>네트워크</option>
												<option>데이터베이스</option>
											</select>
											
									</div>
									<div class="col-lg-2 mt-3 float-right">
										<button type="submit" class="site-btn">저장</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="./index.html"><img src="img/logo.png" alt=""></a>
						</div>
						<ul>
							<li>Address: 60-49 Road 11378 New York</li>
							<li>Phone: +65 11.188.888</li>
							<li>Email: hello@colorlib.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>Useful Links</h6>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">About Our Shop</a></li>
							<li><a href="#">Secure Shopping</a></li>
							<li><a href="#">Delivery infomation</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Our Sitemap</a></li>
						</ul>
						<ul>
							<li><a href="#">Who We Are</a></li>
							<li><a href="#">Our Services</a></li>
							<li><a href="#">Projects</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Innovation</a></li>
							<li><a href="#">Testimonials</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						<h6>Join Our Newsletter Now</h6>
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail">
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="${context}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${context}/resources/js/bootstrap.min.js"></script>
	<script src="${context}/resources/js/jquery.nice-select.min.js"></script>
	<script src="${context}/resources/js/jquery-ui.min.js"></script>
	<script src="${context}/resources/js/jquery.slicknav.js"></script>
	<script src="${context}/resources/js/mixitup.min.js"></script>
	<script src="${context}/resources/js/owl.carousel.min.js"></script>
	<script src="${context}/resources/js/main.js"></script>
	<script src="${context}/resources/js/dropbox.js"></script>



</body>

</html>
