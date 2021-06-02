<%@page import="dev.team3.wantudy.dto.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="interestList" value="${interestList}" />
<!DOCTYPE html>
<html lang="zxx">
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/chatting/chat.css" />
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
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
<script src="${context}/resources/js/chatting/chatting.js"></script>



	
	
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Wantudy | Chatting</title>


</head>


<script type="text/javascript">
	var now_time;
	var ws;
	wsOpen();

	function wsOpen() {
		ws = new WebSocket("ws://localhost/wantudy/chat");
		wsEvt();
	}

	function wsEvt() {
		ws.onopen = function(data) {
			//소켓이 열리면 초기화 세팅하기
		}

		ws.onmessage = function(data) {
			var all = JSON.parse(data.data);
			var member_no = all.member_no;
			var userno = $('#userNo').val();
			var username = $('#userName').val();
			
			var msg = all.msg;
			var cmd = all.cmd;
			var time = new Date().toLocaleTimeString();

			if (cmd == "Enter") {

			} else {
				if (member_no == userno) {
					var str = "<div class='chattinglogcontainer mylog'>";
					str += "<div class='chattinglogtime'>"
					str += time;
					str += "</div>";
					str += "<div class = 'myballoon'>"
					str += "<div class='chattinglogcontent'>"
					str += msg;
					str += "</div>";
					str += "</div>";
					str += "<div class='chattinglogname myname'>"
					str += username;
					str += "</div>";
					str += "</div>";
					$("#chattingloglistcontainer").append(str);
				} else {
					var str = "<div class='chattinglogcontainer'>";
					str += "<div class='chattinglogtime'>"
					str += time;
					str += "</div>";
					str += "<div class='chattinglogname'>"
					str += member_no;
					str += "</div>";
					str += "<div class='yourballoon'>"
					str += "<div class='chattinglogcontent'>"
					str += msg;
					str += "</div>";
					str += "</div>";
					str += "</div>";
					$("#chattingloglistcontainer").append(str);
				}



			}
			var position = $('.chattinglogcontainer').last().offset().top;
			console.log("position:"+position);
			document.querySelector('.chattingloglistcontainer')
			.scrollTo({
				top : position,
				behavior : 'auto'
			});
		}

		ws.onclose = function(data) {
			wsOpen();
		};

		document.addEventListener("keypress", function(e) {
			var message = $('#chatting').val();
			if (e.keyCode == 13) { //enter press
				if (message != "") {
					insertChattinglog();
					sendChat();

				}

			}
		});
	}

	//입장 시
	function sendEnter() {
		var message = $('#chatting').val();
		var cmd = 'Enter';
		send(message, cmd);
		$('#chatting').val("");
	}
	//메세지 보낼 시
	function sendChat() {
		var message = $('#chatting').val();
		console.log("send누르고" + message);
		var cmd = 'Send';
		if(message!=''){
			send(message, cmd);
			$('#chatting').val("");

		}

	}

	//메세지 전송 시 chattinglog 기록
	function insertChattinglog() {
		var message = $('#chatting').val();
		var study_no = $('.nowstudy_no').val();
		var uN = $('#userNo').val();
		now_time = new Date().toLocaleTimeString();

		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/chatting/insertlog',
			data : {
				"study_no" : study_no,
				"content" : message,
				"member_no" : uN
			},
			success : function(data) {
				alert("채팅로그를 저장했습니다.");

			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})

	}

	//message send
	function send(msg, cmd) {
		var uN = $('#userNo').val();
		var study_no = $('.nowstudy_no').val();
		console.log("send보내기" + uN + study_no);
		console.log("msg:" + msg + "cmd:" + cmd);
		var msgData = {
			study_no : study_no,
			member_no : uN,
			msg : msg,
			cmd : cmd
		};
		var jsonData = JSON.stringify(msgData);
		ws.send(jsonData);
		$('#chatting').val("");
	}

	var now_time ;
	var formal_year ;
	var formal_month;
	var formal_day ;
	var endNo;
	var last_data_no;
	var isScrolled = false;
	var isEnd = false;

	function getStudyNo(study) {

		var study_no = $(study).data("value");
		var title = $(study).text();
		
		
		$('.chattingtitle').text(title);
		
		now_time = new Date();
		formal_year = now_time.getFullYear();
		formal_month = now_time.getMonth() + 1;
		formal_day = now_time.getDate();
		
		endNo = 0;
		isScrolled = false;
		isEnd = false;
		if($('.nowstudy_no').val() == ''){
			
		}

		if ($('.nowstudy_no').val() != study_no) {
			$('.nowstudy_no').val(study_no);
			$('#chattingloglistcontainer').text('');

			console.log("처음 endNO:" + endNo);

			//websocket끊었다 다시연결
			
			//입장
			sendEnter();

			
			$.ajax({
						type : 'POST',
						url : '${pageContext.request.contextPath}/chatting/getlog',
						data : {
							"study_no" : study_no,
							"endNo" : endNo
						},
						datatype : "json",
						async : false,
						success : function(data) {
							alert("채팅로그를 불러왔습니다.");

							console.log(data.chattingloglist);

							var length = data.chattingloglist.length;

							if (length < 20) {
								isEnd = true;
							}else{
								last_data_no = data.chattingloglist[19].no;
							}



							for (var i = 0; i < length; i++) {
								
								var content = data.chattingloglist[i].content;
								var chattinglogno = data.chattingloglist[i].no;
								var time = new Date(
										data.chattingloglist[i].time);
								var message_year = time.getFullYear();

								var message_month = time.getMonth() + 1;

								var message_day = time.getDate();

								var message_time = time.toLocaleTimeString();

								if (message_year == formal_year) {
									//이전 월과 같을때
									if (formal_month == message_month) {
										if (formal_day != message_day) {
											//월,일 시간출력
											var str = "<div class='chattinglogdate'>"
											str += formal_month + "월 "
													+ formal_day + "일";
											str += "</div>"
											$("#chattingloglistcontainer")
													.prepend(str);
										}
									} else {
										//월,일
										var str = "<div class='chattinglogdate'>"
										str += formal_month + "월 " + formal_day
												+ "일";
										str += "</div>"
										$("#chattingloglistcontainer").prepend(
												str);
									}
									//년도 다를때
								} else {
									//년,월,일 출력
									var str = "<div class='chattinglogdate'>"
									str += formal_year + "년 " + formal_month
											+ "월 " + formal_day + "일";
									str += "</div>"
									$("#chattingloglistcontainer").prepend(str);
								}
								formal_year = message_year;
								formal_month = message_month;
								formal_day = message_day;

								var member_no = data.chattingloglist[i].member_no;
								var userno = $('#userNo').val();
								var username = $('#userName').val()

								if (member_no != userno) {
									var str = "<div class='chattinglogcontainer' data-no='"+chattinglogno+"'>";
									str += "<div class='chattinglogname'>"
									str += member_no;
									str += "</div>";
									str += "<div class='yourballoon'>"
									str += "<div class='chattinglogcontent'>"
									str += content;
									str += "</div>";
									str += "</div>";
									str += "<div class='chattinglogtime'>"
									str += message_time;
									str += "</div>";
									str += "</div>";
								} else {
									var str = "<div class='chattinglogcontainer mylog' data-no='"+chattinglogno+"'>";
									str += "<div class='chattinglogtime'>"
									str += message_time;
									str += "</div>";
									str += "<div class='myballoon'>"
									str += "<div class='chattinglogcontent'>"
									str += content;
									str += "</div>";
									str += "</div>"
									str += "<div class='chattinglogname myname'>"
									str += username;
									str += "</div>";
									str += "</div>";
								}

								$("#chattingloglistcontainer").prepend(str);
							}

							if(!isEnd){
								var position = $('.chattinglogcontainer').offset().top;

								document.querySelector('.chattingloglistcontainer')
										.scrollTo({
											top : position,
											behavior : 'auto'
										});
							}


						},
						error : function() {
							alert("로그 불러오기 실패.");
						}
					})
		}

	}
	
	


	function logscroll() {

		var scrollTop = $('.chattingloglistcontainer').scrollTop();

		
		console.log("isScrolled:"+isScrolled);

		
		if (scrollTop < 1 && isScrolled == false) {
			isScrolled = true;
			fetchList();
		}

	};

	function fetchList() {
		console.log("fetchlist호출");
		if (isEnd == true) {
			var str = "<div class='chattinglogdate'>"
				str += formal_month + "월 "
						+ formal_day + "일";
				str += "</div>"
				$("#chattingloglistcontainer")
						.prepend(str);
			return;
		}

		endNo += 20;

		console.log("endNo" + endNo);

		var study_no = $('.nowstudy_no').val();
		
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/chatting/getlog',
					data : {
						"study_no" : study_no,
						"endNo" : endNo
					},
					datatype : "json",
					async : false,
					success : function(data) {
						alert("채팅로그를 불러왔습니다.");

						var length = data.chattingloglist.length;

						if (length < 20) {
							isEnd = true;
						}

						last_data_no = data.chattingloglist[19].no;

						for (var i = 0; i < length; i++) {
							var content = data.chattingloglist[i].content;
							var chattinglogno = data.chattingloglist[i].no;
							var time = new Date(
									data.chattingloglist[i].time);
							var message_year = time.getFullYear();

							var message_month = time.getMonth() + 1;

							var message_day = time.getDate();

							var message_time = time.toLocaleTimeString();

							if (message_year == formal_year) {
								//이전 월과 같을때
								if (formal_month == message_month) {
									if (formal_day != message_day) {
										//월,일 시간출력
										var str = "<div class='chattinglogdate'>"
										str += formal_month + "월 "
												+ formal_day + "일";
										str += "</div>"
										$("#chattingloglistcontainer")
												.prepend(str);
									}
								} else {
									//월,일
									var str = "<div class='chattinglogdate'>"
									str += formal_month + "월 " + formal_day
											+ "일";
									str += "</div>"
									$("#chattingloglistcontainer").prepend(
											str);
								}
								//년도 다를때
							} else {
								//년,월,일 출력
								var str = "<div class='chattinglogdate'>"
								str += formal_year + "년 " + formal_month
										+ "월 " + formal_day + "일";
								str += "</div>"
								$("#chattingloglistcontainer").prepend(str);
							}
							formal_year = message_year;
							formal_month = message_month;
							formal_day = message_day;

							var member_no = data.chattingloglist[i].member_no;
							var userno = $('#userNo').val();
							var username = $('#userName').val()

							if (member_no != userno) {
								var str = "<div class='chattinglogcontainer' data-no='"+chattinglogno+"'>";
								str += "<div class='chattinglogname'>"
								str += member_no;
								str += "</div>";
								str += "<div class='yourballoon'>"
								str += "<div class='chattinglogcontent'>"
								str += content;
								str += "</div>";
								str += "</div>";
								str += "<div class='chattinglogtime'>"
								str += message_time;
								str += "</div>";
								str += "</div>";
							} else {
								var str = "<div class='chattinglogcontainer mylog' data-no='"+chattinglogno+"'>";
								str += "<div class='chattinglogtime'>"
								str += message_time;
								str += "</div>";
								str += "<div class='myballoon'>"
								str += "<div class='chattinglogcontent'>"
								str += content;
								str += "</div>";
								str += "</div>";
								str += "<div class='chattinglogname myname'>"
								str += username;
								str += "</div>";
								str += "</div>";
							}

							$("#chattingloglistcontainer").prepend(str);
						}

						var position = $(
								'.chattinglogcontainer[data-no='
										+ last_data_no + ']').offset().top;

						console.log("last_data_no:" + last_data_no);

						console.log("position:" + position);

						document.querySelector('.chattingloglistcontainer')
								.scrollTo({
									top : position,
									behavior : 'auto'
								});

						isScrolled = false;

					},
					error : function() {
						alert("로그 불러오기 실패.");
					}
				});

	}
</script>

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
							<li ><a href="${context}/home">홈</a></li>
							<li><a href="./shop-grid.html">스터디 검색</a></li>

							<li><a href="createStudy">스터디 추가</a></li>
							<li class="active"><a href="${context}/chatting/main">채팅</a>
							<li><a href="${context}/createStudy">스터디 추가</a></li>

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
						<h2>chatting</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<div id="maincontainer" class="maincontainer">
	
		<div class="innercontainer">
			<div class="studylistcontainer">
				<div class="studycontainertitlecontainer">
					<div class="studycontainertitle">스터디 목록</div>
					<hr color="#7fad39" width="100%">
				</div>
				
				<input class="nowstudy_no" type="hidden" name="nowstudy_no" value="">
				<c:forEach var="studylist" items="${studylist}">
					<div class="studycontainer" data-value="${studylist.no}"
						onClick="getStudyNo(this)">${studylist.name}</div>

				</c:forEach>
			</div>
			<div class="chattingwholecontainer">
				<div class="chattingtitlecontainer">
					<div class="chattingtitle"></div>
				</div>
				
				<div class="chattingcontainer">
					<div id="chattingloglistcontainer" class="chattingloglistcontainer" onscroll="logscroll()">
					</div>
					<input type="hidden" id="userName"
						value="<%=((MemberDTO) session.getAttribute("userInfo")).getName()%>">
					<input type="hidden" id="userNo"
						value="<%=((MemberDTO) session.getAttribute("userInfo")).getNo()%>">
	
					<div id="yourMsg">
						<table class="inputTable">
							<tr>
								<th>메시지</th>
								<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
								<th><button onclick="insertChattinglog(); sendChat();"
										id="sendBtn">보내기</button></th>
							</tr>
						</table>
					</div>
				</div>
			
			</div>
			
		</div>

	</div>
	
	
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