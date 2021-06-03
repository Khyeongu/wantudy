
<%@page import="dev.team3.wantudy.dto.CategoryDTO"%>
<%@page import="dev.team3.wantudy.dto.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="interestList" value="${interestList}" />
<!DOCTYPE html>
<html lang="zxx">
<% MemberDTO userInfo = (MemberDTO)session.getAttribute("userInfo");%>
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
$(document).ready(function(){
	$("#interest1").val('<c:out value="${interestList[0].category_no}"/>').prop("selected", true);
	$("#interest2").val('<c:out value="${interestList[1].category_no}"/>').prop("selected", true);
	$("#interest3").val('<c:out value="${interestList[2].category_no}"/>').prop("selected", true);
});

function updateInfo(){
	var password=document.getElementById("password").value;
	var password_confirm=document.getElementById("password-confirm").value;
	var session_password = '<%=((MemberDTO)session.getAttribute("userInfo")).getPassword()%>';
	
	if(password==password_confirm){
		if(password==session_password){
			if(confirm("정말 수정하시겠습니까?")){
				document.getElementById("memberInfoForm").submit();
			}
			else{
				return false;
			}
		}else{
			alert("비밀번호가 일치하지 않습니다.");
		}
	}
	else{
		alert("비밀번호가 서로 일치하지 않습니다.");
	}
}
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
						<a class="navbar-brand" href="search"><span class="navbar-name">wantudy</span></a>
					</div>
				</div>
				<div class="col-lg-7">
					<nav class="header__menu">
						<ul>
							<li><a href="${context}/home">내 스터디</a></li>
							<li><a href="${context}/search">스터디 검색</a></li>
							<li><a href="${context}/createStudy">스터디 추가</a></li>
							<li><a href="${context}/chatting/main">채팅</a>
							<li><a href="${context}/manage/mystudy">스터디 관리</a></li>
							<li class="active"><a href="${context}/mypage/myinfo">마이페이지</a></li>
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
		style="background-image: url('${context}/resources/img/banner.jpg')">
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
				<div class="col-lg-3 col-md-5 pl-5 pr-5">
					<div class="sidebar">
						<div class="sidebar__item pr-5">
							<h4>마이페이지</h4>
							<ul>
								<li class="active"><a href="./myinfo">내 정보 수정</a></li>
								<li><a href="./myapply">지원한 스터디</a></li>
							</ul>
						</div>

					</div>
				</div>

				<div class="col-lg-9 col-md-7">
					<h4 class="mb-3 border__bottom">내 정보 수정</h4>
					<div class="row">
						<div class="col-lg-7">
							<div class="memberinfo" id="memberinfo">
								<form id="memberInfoForm" name="memberInfoForm" method="post">
									<div>
										<h4>아이디</h4>
										<input type="text" id="id" name="id"
											value="${sessionScope.userInfo.id}" disabled>
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
											value="<%=((MemberDTO)session.getAttribute("userInfo")).getName()%>">
									</div>
									<div>
										<h4>관심분야 1</h4>
									</div>
									<div>
										<select id="interest1" name="interest1"
											class="form-control mt-1">
											<c:forEach items="${categoryList}" var="category">
												<option value="${category.no}">${category.name}</option>
											</c:forEach>
										</select>

									</div>
									<div>
										<h4>관심분야 2</h4>
									</div>
									<div>
										<select id="interest2" name="interest2"
											class="form-control mt-1">
											<c:forEach items="${categoryList}" var="category">
												<option value="${category.no}">${category.name}</option>
											</c:forEach>
										</select>

									</div>
									<div>
										<h4>관심분야 3</h4>
									</div>
									<div>
										<select id="interest3" name="interest3"
											class="form-control mt-1">
											<c:forEach items="${categoryList}" var="category">
												<option value="${category.no}">${category.name}</option>
											</c:forEach>
										</select>

									</div>

								</form>
							</div>
						</div>
					</div>
					<div class="row">
					<div class="col-lg-7"></div>
					<div class="col-lg-2 mt-3 float-right">
						<button type="button" id="btnUpdate" class="site-btn"
							onclick="updateInfo()">저장</button>
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
</body>

</html>
