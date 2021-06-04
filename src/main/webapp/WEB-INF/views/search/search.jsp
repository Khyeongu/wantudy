
<%@page import="dev.team3.wantudy.dto.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="searchDTO" value="${searchDTO}" />


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
		getRecentStudyList();
	});

	function getRecentStudyList() {
		$.ajax({
			url : '${context}/search',
			type : 'POST',
			dataType:"json",
			success : function(data) {
				var recentStudyList = data.recentStudyList;
				var recentStudyInnerHTML = '';
				
	            $.each(recentStudyList, function(key, value) {
	            	
		            /* 카드 시작  */
					recentStudyInnerHTML+='						<div class="col-lg-4" data-toggle="modal" data-target="#exampleModal'+value.no+'" style="cursor: pointer;">';
					/* Modal  */
					recentStudyInnerHTML+='							<div class="modal fade" id="exampleModal'+value.no+'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">';
					recentStudyInnerHTML+='								<div class="modal-dialog" role="document">';
					recentStudyInnerHTML+='									<div class="modal-content">';
					recentStudyInnerHTML+='										<div class="modal-header">';
					recentStudyInnerHTML+='											<h5 class="modal-title" id="exampleModalLabel">'+value.name+'</h5>';
					recentStudyInnerHTML+='											<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
					recentStudyInnerHTML+='												<span aria-hidden="true">&times;</span>';
					recentStudyInnerHTML+='											</button>';
					recentStudyInnerHTML+='										</div>';
					recentStudyInnerHTML+='										<div class="modal-body">';
					recentStudyInnerHTML+='											<div class="row">';
					recentStudyInnerHTML+='												<div class="col-lg-12">';
					recentStudyInnerHTML+='													<div class="studyinfo" id="studyinfo">';
					recentStudyInnerHTML+='														<form id="studyInfoForm" name="studyInfoForm" method="post">';
					recentStudyInnerHTML+='															<div>';
					recentStudyInnerHTML+='																<h4>스터디 이름</h4>';
					recentStudyInnerHTML+='																<input type="text" id="name" name="name" value="'+value.name+'" disabled="disabled">';
					recentStudyInnerHTML+='															</div>';
					recentStudyInnerHTML+='															<div>';
					recentStudyInnerHTML+='																<h4>스터디 내용</h4>';
					recentStudyInnerHTML+='																<input type="text" id="content" name="content" value="'+value.content+'" disabled="disabled">';
					recentStudyInnerHTML+='															</div>';
					recentStudyInnerHTML+='															<div>';
					recentStudyInnerHTML+='																<h4>시작 날짜</h4>';
					recentStudyInnerHTML+='																<input autocomplete="off" class="form-control" id="startdate" name="startdate" type="text" value="'+value.startdate+'" placeholder="시작 날짜" disabled="disabled" />';
					recentStudyInnerHTML+='															</div>';
					recentStudyInnerHTML+='															<div>';
					recentStudyInnerHTML+='																<h4>종료 날짜</h4>';
					recentStudyInnerHTML+='																<input autocomplete="off" class="form-control" id="enddate" name="enddate" type="text" value="'+value.enddate+'" placeholder="종료 날짜" disabled="disabled" />';
					recentStudyInnerHTML+='															</div>';
					recentStudyInnerHTML+='															<div>';
					recentStudyInnerHTML+='																<h4>최대 인원</h4>';
					recentStudyInnerHTML+='																<input type="text" id="capacity" name="capacity" value="'+value.capacity+'" disabled="disabled">';
					recentStudyInnerHTML+='															</div>';
					recentStudyInnerHTML+='															<div>';
					recentStudyInnerHTML+='																<h4>카테고리</h4>';
					recentStudyInnerHTML+='															</div>';
					recentStudyInnerHTML+='															<div>';
					recentStudyInnerHTML+='																<input type="text" id="capacity" name="capacity" value="'+value.category+'" disabled="disabled">';
					recentStudyInnerHTML+='															</div>';
					recentStudyInnerHTML+='														</form>';
					recentStudyInnerHTML+='													</div>';
					recentStudyInnerHTML+='												</div>';
					recentStudyInnerHTML+='											</div>';
					recentStudyInnerHTML+='';
					recentStudyInnerHTML+='										</div>';
					recentStudyInnerHTML+='										<div class="modal-footer">';
					recentStudyInnerHTML+='											<button type="button" class="btn btn-primary" onclick="enroll('+value.no+')">신청하기</button>';
					recentStudyInnerHTML+='											<button type="button" class="btn btn-secondary" data-dismiss="modal">창 닫기</button>';
					recentStudyInnerHTML+='										</div>';
					recentStudyInnerHTML+='									</div>';
					recentStudyInnerHTML+='								</div>';
					recentStudyInnerHTML+='							</div>';
					recentStudyInnerHTML+='							<div class="studycard ml-2 mr-2">';
					/* 카드 헤더  */
					recentStudyInnerHTML+='								<div class="studycard-header" style="background-image: url(\'${context}/'+value.category_imgpath+'\')">';
					recentStudyInnerHTML+='									<div class="studycard-header-is_closed possible">';
					recentStudyInnerHTML+='										<div class="studycard-header-text">모집중</div>';
					recentStudyInnerHTML+='										<div class="studycard-header-number">'+value.member_count+'/'+value.capacity+'</div>';
					recentStudyInnerHTML+='									</div>';
					recentStudyInnerHTML+='								</div>';
					/* 카드 바디 */
					recentStudyInnerHTML+='								<div class="studycard-body">';
					/*   카드 바디 헤더  */
					recentStudyInnerHTML+='									<div class="studycard-body-header">';
					recentStudyInnerHTML+='										<h1>'+value.name+'</h1>';
					recentStudyInnerHTML+='										<p>'+value.category+'스터디</p>';
					recentStudyInnerHTML+='									</div>';
					recentStudyInnerHTML+='									<p class="studycard-body-description">'+value.content+'</p>';
					/* 카드 바디 본문 */
					recentStudyInnerHTML+='';
					/* 카드 바디 푸터 */
					recentStudyInnerHTML+='									<div class="studycard-body-footer">';
					recentStudyInnerHTML+='										<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">';
					recentStudyInnerHTML+='										'+value.startdate+' ~ '+value.enddate;
					recentStudyInnerHTML+='									</div>';
					recentStudyInnerHTML+='								</div>';
					recentStudyInnerHTML+='							</div>';
					recentStudyInnerHTML+='						</div>';
					/* 카드 끝 */

	               
	            });
				
	            $("#recentStudyList").html(recentStudyInnerHTML);
			}
		});
	}

	function enroll(studyno) {
		var obj = {
			'studyno' : studyno
		};

		var jsonData = JSON.stringify(obj);

		var message;

		$.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/search/enrollMember",
			data : jsonData,
			dataType : 'json',
			contentType : 'application/json; charset=UTF-8',
			success : function(data) {
				console.log('success');
				//var msg = data.msg;
				console.log(data.message);
				alert(data.message);
				location.href = '${pageContext.request.contextPath}/search';
			},
			error : function(request, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
				alert('exception');
			}
		});
	}

	function search() {
		var searchCondition = document.getElementById("searchCondition").value;
		var searchKeyword = document.getElementById("searchKeyword").value;
		

		$.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/search/list",
			data : {
				"searchCondition" : searchCondition,
				"searchKeyword" : searchKeyword
			},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "json",
			success : function(data) {
				alert('success');
				var searchResultList = data.searchedStudyList;
				var studySearchResultHtml = '';
				
	            $.each(searchResultList, function(key, value) {
	            	alert(value.name);

		            /* 카드 시작  */
					studySearchResultHtml+='						<div class="col-lg-4" data-toggle="modal" data-target="#exampleModal'+value.no+'" style="cursor: pointer;">';
					/* Modal  */
					studySearchResultHtml+='							<div class="modal fade" id="exampleModal'+value.no+'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">';
					studySearchResultHtml+='								<div class="modal-dialog" role="document">';
					studySearchResultHtml+='									<div class="modal-content">';
					studySearchResultHtml+='										<div class="modal-header">';
					studySearchResultHtml+='											<h5 class="modal-title" id="exampleModalLabel">'+value.name+'</h5>';
					studySearchResultHtml+='											<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
					studySearchResultHtml+='												<span aria-hidden="true">&times;</span>';
					studySearchResultHtml+='											</button>';
					studySearchResultHtml+='										</div>';
					studySearchResultHtml+='										<div class="modal-body">';
					studySearchResultHtml+='											<div class="row">';
					studySearchResultHtml+='												<div class="col-lg-12">';
					studySearchResultHtml+='													<div class="studyinfo" id="studyinfo">';
					studySearchResultHtml+='														<form id="studyInfoForm" name="studyInfoForm" method="post">';
					studySearchResultHtml+='															<div>';
					studySearchResultHtml+='																<h4>스터디 이름</h4>';
					studySearchResultHtml+='																<input type="text" id="name" name="name" value="'+value.name+'" disabled="disabled">';
					studySearchResultHtml+='															</div>';
					studySearchResultHtml+='															<div>';
					studySearchResultHtml+='																<h4>스터디 내용</h4>';
					studySearchResultHtml+='																<input type="text" id="content" name="content" value="'+value.content+'" disabled="disabled">';
					studySearchResultHtml+='															</div>';
					studySearchResultHtml+='															<div>';
					studySearchResultHtml+='																<h4>시작 날짜</h4>';
					studySearchResultHtml+='																<input autocomplete="off" class="form-control" id="startdate" name="startdate" type="text" value="'+value.startdate+'" placeholder="시작 날짜" disabled="disabled" />';
					studySearchResultHtml+='															</div>';
					studySearchResultHtml+='															<div>';
					studySearchResultHtml+='																<h4>종료 날짜</h4>';
					studySearchResultHtml+='																<input autocomplete="off" class="form-control" id="enddate" name="enddate" type="text" value="'+value.enddate+'" placeholder="종료 날짜" disabled="disabled" />';
					studySearchResultHtml+='															</div>';
					studySearchResultHtml+='															<div>';
					studySearchResultHtml+='																<h4>최대 인원</h4>';
					studySearchResultHtml+='																<input type="text" id="capacity" name="capacity" value="'+value.capacity+'" disabled="disabled">';
					studySearchResultHtml+='															</div>';
					studySearchResultHtml+='															<div>';
					studySearchResultHtml+='																<h4>카테고리</h4>';
					studySearchResultHtml+='															</div>';
					studySearchResultHtml+='															<div>';
					studySearchResultHtml+='																<input type="text" id="capacity" name="capacity" value="'+value.category+'" disabled="disabled">';
					studySearchResultHtml+='															</div>';
					studySearchResultHtml+='														</form>';
					studySearchResultHtml+='													</div>';
					studySearchResultHtml+='												</div>';
					studySearchResultHtml+='											</div>';
					studySearchResultHtml+='';
					studySearchResultHtml+='										</div>';
					studySearchResultHtml+='										<div class="modal-footer">';
					studySearchResultHtml+='											<button type="button" class="btn btn-primary" onclick="enroll('+value.no+')">신청하기</button>';
					studySearchResultHtml+='											<button type="button" class="btn btn-secondary" data-dismiss="modal">창 닫기</button>';
					studySearchResultHtml+='										</div>';
					studySearchResultHtml+='									</div>';
					studySearchResultHtml+='								</div>';
					studySearchResultHtml+='							</div>';
					studySearchResultHtml+='							<div class="studycard ml-2 mr-2">';
					/* 카드 헤더  */
					studySearchResultHtml+='								<div class="studycard-header" style="background-image: url(\'${context}/'+value.category_imgpath+'\')">';
					studySearchResultHtml+='									<div class="studycard-header-is_closed possible">';
					studySearchResultHtml+='										<div class="studycard-header-text">모집중</div>';
					studySearchResultHtml+='										<div class="studycard-header-number">'+value.member_count+'/'+value.capacity+'</div>';
					studySearchResultHtml+='									</div>';
					studySearchResultHtml+='								</div>';
					/* 카드 바디 */
					studySearchResultHtml+='								<div class="studycard-body">';
					/*   카드 바디 헤더  */
					studySearchResultHtml+='									<div class="studycard-body-header">';
					studySearchResultHtml+='										<h1>'+value.name+'</h1>';
					studySearchResultHtml+='										<p>'+value.category+'스터디</p>';
					studySearchResultHtml+='									</div>';
					studySearchResultHtml+='									<p class="studycard-body-description">'+value.content+'</p>';
					/* 카드 바디 본문 */
					studySearchResultHtml+='';
					/* 카드 바디 푸터 */
					studySearchResultHtml+='									<div class="studycard-body-footer">';
					studySearchResultHtml+='										<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">';
					studySearchResultHtml+='										'+value.startdate+' ~ '+value.enddate;
					studySearchResultHtml+='									</div>';
					studySearchResultHtml+='								</div>';
					studySearchResultHtml+='							</div>';
					studySearchResultHtml+='						</div>';
					/* 카드 끝 */

	               
	            });
				
	            $("#studySearchResult").html(studySearchResultHtml);
	            
	            alert('잠시 대기');
	   		 	
			},
			error : function(request, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
				alert('error exception');

			},
			fail : function() {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
				alert('fail exception');
			}
		});

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
						<a class="navbar-brand" href="search"><span class="navbar-name">wantudy</span></a>
					</div>
				</div>
				<div class="col-lg-7">
					<nav class="header__menu">
						<ul>
							<li><a href="${context}/home">홈</a></li>
							<li class="active"><a href="${context}/search">스터디 검색</a></li>
							<li><a href="${context}/createStudy">스터디 추가</a></li>
							<li><a href="#">채팅</a>
							<li><a href="${context}/manage/mystudy">스터디 관리</a></li>
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
	<section class="breadcrumb-section set-bg" style="background-image: url('${context}/resources/img/breadcrumb.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>스터디 검색</h2>
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
					<h4 class="mb-3 border__bottom">스터디 검색</h4>
					<div class="row">
						<div class="col-lg-3 col-md-3"></div>
						<div class="hero__search col-lg-8 col-md-8">
							<div class="hero__search__form">
								<form>
									<select id="searchCondition" class="hero__search__categories arrow_carrot-down">
										<option value="name" <c:if test="${searchDTO.searchCondition == 'name'}"> selected </c:if>>제목</option>
										<option value="content" <c:if test="${searchDTO.searchCondition == 'content'}"> selected </c:if>>내용</option>
										<option value="categoty" <c:if test="${searchDTO.searchCondition == 'category'}"> selected </c:if>>카테고리</option>
									</select>
									<input type="text" id="searchKeyword" required="required" autocomplete=off placeholder="검색" value="${searchDTO.searchKeyword}" />
									<button type="submit" class="site-btn" onclick="search()">SEARCH</button>
								</form>
							</div>

						</div>

					</div>
					<div class="row" id="studySearchResult"></div>

				</div>

			</div>


			<div class="row">
				<div class="col-lg-1 col-md-5 pl-5 pr-5"></div>

				<div class="col-lg-10 col-md-7">
					<h4 class="mb-3 border__bottom">최근 생긴 스터디</h4>
					<div class="row" id="recentStudyList"></div>
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
