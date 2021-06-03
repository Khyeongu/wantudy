
<%@page import="dev.team3.wantudy.dto.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
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
<link rel="stylesheet" href="${context}/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${context}/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="${context}/resources/css/nice-select.css" type="text/css">



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
<script type="text/javascript" src="${context}/resources/js/datepicker/datepicker.js"></script>


<!-- 설문조사 Styles -->
<link rel="stylesheet" href="${context}/resources/css/abilitycheck/abilitycheck.css">

<script>
	var name;
	var content;
	var startdate;
	var enddate;
	var capacity;
	var category_no;

	/* 스터디 기본 정보 입력 후 다음으로 넘어간는 function */
	function next() {
		if (document.getElementById("name").value === "") {
			alert("스터디 이름을 입력해 주세요.")
		} else if (document.getElementById("content").value === "") {
			alert("스터디 내용을 입력해 주세요.")
		} else if (document.getElementById("startdate").value === "") {
			alert("스터디 시작 날짜를 입력해 주세요.")
		} else if (document.getElementById("enddate").value === "") {
			alert("스터디 종료 날짜를 입력해 주세요.")
		} else if (document.getElementById("capacity").value === "") {
			alert("스터디 최대 인원을 입력해 주세요.")
		} else {
			name = document.getElementById("name").value;
			content = document.getElementById("content").value;
			startdate = document.getElementById("startdate").value;
			enddate = document.getElementById("enddate").value;
			capacity = document.getElementById("capacity").value;
			category_no = document.getElementById("category_no").value;

			document.all.studyBasicInfo.style.display = "none";
			document.all.studyRequirement.style.display = "";
		}

	}

	/* 최종 study 생성 function */
	function createStudy() {

		//document.getElementById("studyInfoForm");

		var radio_name = [];//array
		var raido_name_val = {};//object
		var radio = $("input[type=radio]"); //라디오 정보를 가져옵니다.
		var arr = new Array();

		$.each(radio, function(key, value) { // input radio의 name 값을 가져옵니다.
			radio_name.push($(value).attr('name'));
		});

		//console.log(radio_name);

		radio_name = $.unique(radio_name.sort()).sort(); //중복요소 이름을 제거
		//console.log(radio_name);

		for (var i = 0; i < radio_name.length; i++) {
			var obj_length = document.getElementsByName(radio_name[i]).length;
			var obj = {
				'name' : '',
				'score' : ''
			};

			for (var j = 0; j < obj_length; j++) {
				if (document.getElementsByName(radio_name[i])[j].checked == true) {
					//alert(document.getElementsByName(radio_name[i])[j].value);

					obj.name = radio_name[i];
					obj.score = document.getElementsByName(radio_name[i])[j].value;

					//console.log(obj.name);
					//console.log(obj.score);
					//console.log(obj);

					arr.push(obj);
				}
			}

		}

		var newobj = {
			'name' : name,
			'content' : content,
			'startdate' : startdate,
			'enddate' : enddate,
			'capacity' : capacity,
			'category_no' : category_no,
			'abilityarry' : arr
		};
		//var jsonData = JSON.stringify(arr);
		var jsonData = JSON.stringify(newobj);
		//console.log(jsonData);

		$.ajax({
			url : '${pageContext.request.contextPath}/createStudy',
			type : 'post',
			contentType : 'application/json; charset=UTF-8',
			data : jsonData,
			success : function(data) {
				//alert("됨.");
				location.href = '${pageContext.request.contextPath}/search';
			}
		// ,error:function(){
		// alert("안됨.");
		// }
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
							<li><a href="${context}/home">내 스터디</a></li>
							<li><a href="${context}/search">스터디 검색</a></li>
							<li class="active"><a href="${context}/createStudy">스터디 추가</a></li>
							<li><a href="${context}/chatting/main">채팅</a>
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
	<section class="breadcrumb-section set-bg" style="background-image: url('${context}/resources/img/banner.jpg')">
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

				<div class="col-lg-9 col-md-7" id="studyBasicInfo" style="display:;">
					<h4 class="mb-3 border__bottom">스터디 추가</h4>
					<div class="row">
						<div class="col-lg-7">
							<div class="studyinfo" id="studyinfo">
								<form id="studyInfoForm" name="studyInfoForm" method="post">
									<div>
										<h4>스터디 이름</h4>
										<input type="text" id="name" name="name" autocomplete="off">
									</div>
									<div>
										<h4>스터디 내용</h4>
										<input type="text" id="content" name="content" required="required" autocomplete="off">
									</div>
									<div>
										<h4>시작 날짜</h4>
										<input autocomplete="off" class="form-control" id="startdate" name="startdate" type="text" placeholder="시작 날짜" required="required" autocomplete="off" />
									</div>
									<div>
										<h4>종료 날짜</h4>
										<input autocomplete="off" class="form-control" id="enddate" name="enddate" type="text" placeholder="종료 날짜" required="required" autocomplete="off" />
									</div>
									<div>
										<h4>최대 인원</h4>
										<input type="text" id="capacity" name="capacity" required="required" autocomplete="off" />
									</div>
									<div>
										<h4>카테고리</h4>
									</div>
									<div>
										<select id="category_no" name="category_no" class="form-control mt-1">
											<option value="0">선택안함</option>
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
							<button type="button" id="btnUpdate" class="site-btn" onclick="next()">다음</button>
						</div>
					</div>
				</div>

				<div class="col-lg-9 col-md-7" id="studyRequirement" style="display: none;">
					<h4 class="mb-3 border__bottom">스터디 역량 수정</h4>
					<div class="row">
						<div class="col-lg-7">
							<div class="studyability" id="studyability">
								<form id="studyAbilityForm" name="studyAbilityForm" method="post">
									<div class="abilitycheck">




										<c:forEach items="${abilityList}" var="abilityname">
											<div class="form-group">
												<label class="label" for="python">${abilityname}</label>

												<div class="ability-form-control">
													<div class="row">
														<div class="col-md-1 text-center pl-3">(low)</div>
														<div class="col-md-2 text-center">
															<input class="mr-2" type="radio" name="${abilityname}" value="1" checked="checked" />1
														</div>
														<div class="col-md-2 text-center">
															<input class="mr-2" type="radio" name="${abilityname}" value="2" />2
														</div>
														<div class="col-md-2 text-center">
															<input class="mr-2" type="radio" name="${abilityname}" value="3" />3
														</div>
														<div class="col-md-2 text-center">
															<input class="mr-2" type="radio" name="${abilityname}" value="4" />4
														</div>
														<div class="col-md-2 text-center">
															<input class="mr-2" type="radio" name="${abilityname}" value="5" />5
														</div>
														<div class="col-md-1 text-center pr-3">(high)</div>
													</div>
												</div>
											</div>
										</c:forEach>



									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-7"></div>
						<div class="col-lg-2 mt-3 float-right">
							<button type="button" id="btnUpdate" class="site-btn" onclick="createStudy()">만들기</button>
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
