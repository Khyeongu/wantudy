
<%@page import="dev.team3.wantudy.dto.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="studyDTO" value="${studyDTO}" />
<c:set var="startpage" value="${startpage}" />
<c:set var="endpage" value="${endpage}" />
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${context}/resources/css/elegant-icons.css"
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
<link rel="stylesheet" href="${context}/resources/css/nice-select.css"
	type="text/css">
	<link rel="stylesheet"
	href="${context}/resources/css/userList/userList.css" type="text/css">
<link rel="stylesheet"
	href="${context}/resources/css/pagination/pagination.css"
	type="text/css">
	



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
<script type="text/javascript"
	src="${context}/resources/js/datepicker/datepicker.js"></script>

<script>
$(document).ready(function(){
	studyMemberList(${studyDTO.no}, 1);
	makePage(${startpage}, ${endpage});
});
function makePage(startpage, endpage){
	var move_page = '';

    var page_num = 1;
	move_page += '<span>';
    
    for (var num=startpage; num<=endpage; num++) {
        if (num == page_num) {
            move_page += '<div class="move-page-index" onclick="studyMemberList('+${studyDTO.no}+', '+num+'); return false;">'+ num +'</div>';
        } else {
        	move_page += '<div class="move-page-index" onclick="studyMemberList('+${studyDTO.no}+', '+num+'); return false;">'+ num +'</div>';
        }
     }
    
    move_page += '</span>';
    move_page += '<svg viewBox="0 0 100 100">';
    move_page += '      <path';
    move_page += '            d="m 7.1428558,49.999998 c -1e-7,-23.669348 19.1877962,-42.8571447 42.8571442,-42.8571446 23.669347,0 42.857144,19.1877966 42.857144,42.8571446" />';
    move_page += '    </svg>';
    move_page += '    <svg viewBox="0 0 100 100">';
    move_page += '      <path';
    move_page += '            d="m 7.1428558,49.999998 c -1e-7,23.669347 19.1877962,42.857144 42.8571442,42.857144 23.669347,0 42.857144,-19.187797 42.857144,-42.857144" />';
    move_page += '    </svg>';
    
    $('.move-page').html(move_page);
    
    const c = document.querySelector('.move-page');
    const indexs = Array.from(document.querySelectorAll('.move-page-index'));
    var cur = -1;
    indexs.forEach((index, i) => {
      index.addEventListener('click', (e) => {
        // clear
        console.log(${first});
        c.className = 'move-page';
        void c.offsetWidth; // Reflow
        c.classList.add('open');
        c.classList.add('i'+(i+1));
        if (cur > i) {
          c.classList.add('flip');
        }
        cur = i;
      })
    });
}


function studyMemberList(study_no, page_num, first){
	$.ajax({
        url : '${context}/manage/studymember/${studyDTO.no}',
        type : 'POST',
        data : 
        	{
        	'page_num' : page_num
       		},
        dataType:"json",
        success : function(data) {
            var table_row = '';
            var move_page = '';
            var page_num = data.page_num;
            var startpage = data.startpage;
            var endpage = data.endpage;
            var maxpage = data.maxpage;
            var studyMemberList = data.studyMemberList;
            var session_no = data.session_no;
            var roll;
            <c:set var="startpage" value="startpage"/>
            <c:set var="endpage" value="endpage"/>


            $.each(studyMemberList, function(key, value) {
               if(${userInfo.no}==value.no){
            	   roll="팀장";
               }else{
            	   roll="팀원"
               }
               table_row+='<tr>';
               table_row+='							<td>';
               table_row+='								<img src="${context}/resources/img/userimg.png" alt="">';
               table_row+='								<a href="#" class="user-link">'+value.name+'</a>';
               table_row+='								<span class="user-subhead">지원자</span>';
               table_row+='							</td>';
               table_row+='							<td>';
               table_row+= 								roll;
               table_row+='							</td>';
               table_row+='							<td class="text-center">';
               table_row+='								<span class="label label-waiting '+value.no+'-status">심사중</span>';
               table_row+='							</td>';
               table_row+='							<td>';
               table_row+='								<a href="#">'+value.interest_name+'</a>';
               table_row+='							</td>';
               table_row+='							<td style="width: 20%;">';
               table_row+='								<a href="javascript:callFunction();" class="user-table-link info">';
               table_row+='									<span class="fa-stack">';
               table_row+='										<i class="fa fa-square fa-stack-2x"></i>';
               table_row+='										<i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>';
               table_row+='									</span>';
               table_row+='								</a>';
               table_row+='								<a href="javascript:kickMember('+"'"+value.name+"'"+','+value.no+');" class="user-table-link refuse '+value.no+'-refuse">';
               table_row+='									<span class="fa-stack">';
               table_row+='										<i class="fa fa-square fa-stack-2x"></i>';
               table_row+='										<i class="fa fa-user-times fa-stack-1x fa-inverse"></i>';
               table_row+='									</span>';
               table_row+='								</a>';
               table_row+='							</td>';
               table_row+='						</tr>';
               
            });
         $('.applyMemberList').html(table_row);  
       }
	});
}

function kickMember(member_name, member_no){
	if (confirm(member_name+" 님을 퇴출하시겠습니까?")) {
		$.ajax({
	        url : '${context}/manage/studymember/kickmember/${studyDTO.no}',
	        type : 'POST',
	        data : 
	        	{
	        	'member_no' : member_no
	       		},
	        success : function(data) {
	        	$("."+member_no+"-status").attr("class", "label label-danger "+member_no+"-status");
	        	$("."+member_no+"-status").html("퇴출");
	        	$("a").remove("."+member_no+"-accept, ."+member_no+"-refuse");
	        
	        }
		});
		} else{
			return false;
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
	<section class="breadcrumb-section set-bg"
		style="background-image: url('${context}/resources/img/banner.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>스터디 관리</h2>
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
							<h4>스터디 관리</h4>
							<ul>
								<li><a href="../studyinfo/${studyDTO.no}">스터디 정보 수정</a></li>
								<li><a href="../studyability/${studyDTO.no}">스터디 역량 수정</a></li>
								<li><a href="../studyapply/${studyDTO.no}">스터디 신청자 관리</a></li>
								<li class="active"><a href="../studymember/${studyDTO.no}">스터디 멤버 관리</a></li>
							</ul>
						</div>

					</div>
				</div>

				<div class="col-lg-9 col-md-7">
					<h4 class="mb-3 border__bottom">스터디 멤버 관리</h4>
					<div class="row">
						<div class="col-lg-10 ml-3">
							
							
							<table class="user-table user-list">
								<thead>
									<tr>
										<th><span>지원자</span></th>
										<th><span>구분</span></th>
										<th class="text-center"><span>상태</span></th>
										<th><span>흥미</span></th>
										<th>&nbsp;</th>
									</tr>
								</thead>
								<tbody class="applyMemberList">

								</tbody>
							</table>
							<div class="pagination mt-5">

								<div class="move-page "></div>

							</div>
							
							
							
						</div>
					</div>
					<div class="row">
						<div class="col-lg-7"></div>
						<div class="col-lg-2 mt-3 float-right">
							
							
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
