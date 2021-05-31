
<%@page import="dev.team3.wantudy.dto.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
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
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${context}/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/createStudy/createStudyCalendar.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">



<!-- Js Plugins -->
<script src="${context}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${context}/resources/js/jquery.nice-select.min.js"></script>
<script src="${context}/resources/js/jquery-ui.min.js"></script>
<script src="${context}/resources/js/jquery.slicknav.js"></script>
<script src="${context}/resources/js/bootstrap.min.js"></script>
<script src="${context}/resources/js/mixitup.min.js"></script>
<script src="${context}/resources/js/owl.carousel.min.js"></script>
<script src="${context}/resources/js/main.js"></script>
<script src="${context}/resources/js/dropbox.js"></script>


<script type="text/javascript">
	$(function() {
		$.datepicker.setDefaults({
			autoclose : true,
			dateFormat : 'yy-mm-dd',
			startDate : "now"
		});

		$("#start-date").datepicker().change('change', function() {
			var start = $('#start-date')
			var end = $('#start-date');
			var start2 = document.getElementById("start-date").value;

			var yyyy = start2.substr(0, 4);
			var mm = start2.substr(5, 2);
			var dd = start2.substr(8, 2);
			var com_ymd = new Date(yyyy, mm - 1, dd);

			$('.date-depart').text(start2);
			//$('#start-date').val(start);
			document.getElementById("end-date").value = start2;
			console.log(com_ymd);
		});

		$("#end-date").datepicker().change('change', function() {
			var start = $('#start-date')
			var end = $('#end-date');
			var end = $('#end-date');
			$('.date-return').text(end);
		});

	});

	$("#insertStudyInfo").click(function (){
		$.ajax({
			type : "POST",
			url : "${context}/createStudy/createStudy",
			success : function(data) {
				console.log('success', data);
			},
			error : function(exception) {
				alert('Exeption:' + exception);
			}
		});
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
								<li><i class="fa fa-envelope"></i> ${sessionScope.userInfo.name}님 안녕하세요</li>
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
							<li><a href="home/home">홈</a></li>
							<li><a href="./shop-grid.html">스터디 검색</a></li>
							<li class="active"><a href="createStudy/createStudy">스터디 추가</a></li>
							<li><a href="#">채팅</a>
							<li><a href="./blog.html">스터디 관리</a></li>
							<li><a href="mypage/myinfo">마이페이지</a></li>
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
	<section class="breadcrumb-section set-bg" style="background-image: url('${context}/resources/img/breadcrumb.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>스터디 추가</h2>
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
				<div class="col-lg-3 col-md-5 pl-5 pr-5"></div>

				<div class="col-lg-9 col-md-7">
					<h4 class="mb-3 border__bottom">스터디 정보</h4>
					<div class="row">
						<div class="col-lg-7">
							<div class="studyInfo" id="studyInfo">
								<form class="studyInfoForm" method="post">
									<div>
										<h4>스터디 이름</h4>
										<input type="text" id="name" name="name" autocomplete="off">
									</div>
									<div>
										<h4>스터디 내용</h4>
										<textarea cols="50" rows="8" id="content" name="content" placeholder="스터디 내용 입력" autocomplete="off"></textarea>
									</div>
									<div>
										<h4>스터디 종류</h4>
									</div>
									<div>
										<select id="category" name="category" class="form-control mt-1">
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
									<div>
										<h4>요구사항</h4>
										<input type="text" id="requirement" name="requirement" autocomplete="off">
									</div>
									<div>
										<h4>기간</h4>
									</div>
									<div class="input-daterange input-group" id="flight-datepicker">
										<div class="form-item">
											<label>시작 날짜</label> <span class="fontawesome-calendar"></span> <input class="input-sm form-control" type="text" id="start-date" name="start" placeholder="Select depart date" data-date-format="DD, MM d" /> <span class="date-text date-depart"></span>
										</div>
										<div class="form-item">
											<label>종료 날짜</label> <span class="fontawesome-calendar"></span> <input class="input-sm form-control" type="text" id="end-date" name="end" placeholder="Select return date" data-date-format="DD, MM d" /> <span class="date-text date-return"></span>
										</div>
									</div>



									<div>
										<h4>인원 수</h4>
										<input type="text" id="capacity" name="capacity" autocomplete="off">
									</div>
									<div></div>

								</form>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-7"></div>
						<div class="col-lg-2 mt-3 float-right">
							<button type="button" id="insertStudyInfo" class="site-btn">스터디 만들기</button>
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
						<p>Get E-mail updates about our latest shop and special offers.</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail">
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-instagram"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-pinterest"></i></a>
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
								All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
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
