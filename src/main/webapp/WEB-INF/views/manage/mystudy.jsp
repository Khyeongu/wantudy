
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="${context}/resources/css/studycard/studycard.css" type="text/css">



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
		var element = $('.studycard-body-header');
		element.forEach()
		{

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
						<a class="navbar-brand" href="home"><span class="navbar-name">wantudy</span></a>
					</div>
				</div>
				<div class="col-lg-7">
					<nav class="header__menu">
						<ul>
							<li><a href="${context}/home">내 스터디</a></li>
							<li><a href="${context}/search">스터디 검색</a></li>
							<li><a href="${context}/createStudy">스터디 추가</a></li>
							<li><a href="${context}/chatting/main">채팅</a>
							<li class="active"><a href="${context}/manage/mystudy">스터디 관리</a></li>
							<li><a href="${context}/mypage/myinfo">마이페이지</a></li>
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
	<section class="breadcrumb-section set-bg" style="background-image: url('${context}/resources/img/banner.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>내가 만든 스터디</h2>
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
				<div class="col-lg-1 col-md-5 pl-5 pr-5"></div>

				<div class="col-lg-10 col-md-7">
					<h4 class="mb-3 border__bottom">관리할 스터디 선택</h4>
					<div class="row">

						<c:forEach items="${memberStudyList}" var="ms">
							<c:set var="current_cnt" value="${ms.study_member_count}" />
							<c:set var="max_cnt" value="${ms.study_capacity}" />
							<c:set var="study_status" value="${ms.enroll_status}" />
							<!-- 카드 시작 -->
							<div class="col-lg-4">
								<a href="studyinfo/${ms.enroll_study_no}"> <!-- 클릭 시 링크 설정 -->
									<div class="studycard ml-2 mr-2">
										<!-- 카드 헤더 -->
										<div class="studycard-header" style="background-image: url('${context}/${ms.category_imgpath}')">
											<c:choose>
												<c:when test="${study_status=='종료'}">
													<div class="studycard-header-is_closed end">
														<div class="studycard-header-text">종료</div>
													</div>
												</c:when>
												<c:when test="${current_cnt == max_cnt}">
													<div class="studycard-header-is_closed impossible">
														<div class="studycard-header-text">모집완료</div>
														<div class="studycard-header-number">${ms.study_member_count}/${ms.study_capacity}</div>
													</div>

												</c:when>
												<c:otherwise>
													<div class="studycard-header-is_closed possible">
														<div class="studycard-header-text">모집중</div>
														<div class="studycard-header-number">${ms.study_member_count}/${ms.study_capacity}</div>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
										<!--  카드 바디 -->
										<div class="studycard-body">
											<!--  카드 바디 헤더 -->
											<div class="studycard-body-header">
												<h1>${ms.study_name}</h1>
												<p>${ms.study_category} 스터디</p>
											</div>
											<p class="studycard-body-description">${ms.study_content}</p>
											<!--  카드 바디 본문 -->

											<!--  카드 바디 푸터 -->
											<div class="studycard-body-footer">
												<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
												${ms.study_startdate} ~ ${ms.study_enddate} <img class="status-img mt-1 ml-1 mr-1" src="${context}${ms.statusImg}"> <i class="status"> ${ms.enroll_status }&nbsp;&nbsp; </i>
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
