
<%@page import="dev.team3.wantudy.dto.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="interestList" value="${interestList}" />
<!DOCTYPE html>
<html lang="zxx">
<%
MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
%>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Wantudy | MyPage</title>


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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="${context}/resources/css/studycard/studycard.css" type="text/css">



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


<script>
	$(document).ready(function() {
		var element=$('.studycard-body-header');
		element.forEach(){

			alert(element.html());
		}
		
	});
</script>
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
								<li><i class="fa fa-envelope"></i>
									${sessionScope.userInfo.name}님 안녕하세요</li>
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
							<li class="active"><a href="./myinfo">마이페이지</a></li>
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
		style="background-image: url('${context}/resources/img/breadcrumb.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>지원한 스터디</h2>
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
				<div class="col-lg-3 col-md-5 pl-5 pr-5">
					<div class="sidebar">
						<div class="sidebar__item pr-5">
							<h4>마이페이지</h4>
							<ul>
								<li><a href="./myinfo">내 정보 수정</a></li>
								<li class="active"><a href="./myapply">지원한 스터디</a></li>
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
					<h4 class="mb-3 border__bottom">지원한 스터디</h4>
					<div class="row">

						<c:forEach items="${memberStudyList}" var="ms">
						<c:set var="current_cnt" value="${ms.study_member_count}"/>
						<c:set var="max_cnt" value="${ms.study_capacity}"/>
							<!-- 카드 시작 -->
							<div class="col-lg-4">
								<a href=""> <!-- 클릭 시 링크 설정 -->
									<div class="studycard ml-2 mr-2">
										<!-- 카드 헤더 -->
										<div class="studycard-header"
											style="background-image: url('${context}/resources/img/categories/test.jpg')">
											<c:if test="${current_cnt == max_cnt}">
												<div class="studycard-header-is_closed impossible">
													<div class="studycard-header-text">모집완료</div>
													<div class="studycard-header-number">${ms.study_member_count}
														/ ${ms.study_capacity}</div>
												</div>

											</c:if>
											<c:if test="${current_cnt!=max_cnt}">
												<div class="studycard-header-is_closed possible">
													<div class="studycard-header-text">모집중</div>
													<div class="studycard-header-number">${ms.study_member_count}
														/ ${ms.study_capacity}</div>
												</div>
											</c:if>
										</div>
										<!--  카드 바디 -->
										<div class="studycard-body">
											<!--  카드 바디 헤더 -->
											<div class="studycard-body-header">
												<h1>${ms.study_name}</h1>
												<p>${ms.study_category}스터디</p>
											</div>
											<p class="studycard-body-description">${ms.study_content}</p>
											<!--  카드 바디 본문 -->

											<!--  카드 바디 푸터 -->
											<div class="studycard-body-footer">
												<hr
													style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
												${ms.study_startdate} ~ ${ms.study_enddate} <img
													class="status-img mt-1 ml-1 mr-1"
													src="${context}${ms.statusImg}"> <i class="status">
													${ms.enroll_status }&nbsp;&nbsp; </i>
											</div>
										</div>
									</div>
								</a>
							</div>
							<!-- 카드 끝 -->
						</c:forEach>
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
						<div class="footer__about__logo"></div>
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
						<div class="footer__copyright__payment"></div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->



</body>

</html>
