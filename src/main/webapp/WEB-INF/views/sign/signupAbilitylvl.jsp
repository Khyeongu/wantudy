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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="../"><span class="navbar-name">wantudy</span></a>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap " style="background-image: url('${context}/resources/img/sign/login.jpg'); height: 2500px; ">
		<div class="overlay"></div>


		<!-- 			<section class="ftco-section ftco-no-pb ftco-no-pt"> -->
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="signupAbilityLvl-wrap p-4 p-md-5">
						<h3 class="mb-4">Ability Level</h3>
						<!-- <form class="signup-form" method="POST">  -->
						<div class="form-group">
							<label class="label" for="python">Python</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="python" value="1" checked="checked"  />&nbsp;1&nbsp;&nbsp;&nbsp;
								<input type="radio" name="python" value="2"  />&nbsp;2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="python" value="3"  />&nbsp;3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="python" value="4"  />&nbsp;4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="python" value="5"  />&nbsp;5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>

						<div class="form-group">
							<label class="label" for="java">Java</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="java" value="1" checked="checked"  />&nbsp;1&nbsp;&nbsp;&nbsp;
								<input type="radio" name="java" value="2" />&nbsp;2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="java" value="3" />&nbsp;3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="java" value="4" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="java" value="5" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="c">C</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="c" value="1" checked="checked"  />&nbsp;1&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="c" value="2" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="c" value="3" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="c" value="4" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="c" value="5" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="cpp">CPP</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="cpp" value="1" checked="checked" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="cpp" value="2" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="cpp" value="3" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="cpp" value="4" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="cpp" value="5" />&nbsp;5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="javascript">Javascript</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="javascript" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="javascript" value="2"  />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="javascript" value="3"  />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="javascript" value="4"  />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="javascript" value="5"  />&nbsp;5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="django">Django</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="django" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="django" value="2" />&nbsp;2&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="django" value="3" />&nbsp;3&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="django" value="4" />&nbsp;4&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="django" value="5" />&nbsp;5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="flask">Flask</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="flask" value="1" checked="checked" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="flask" value="2" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="flask" value="3" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="flask" value="4" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="flask" value="5" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="spring">Spring</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="spring" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="spring" value="2" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="spring" value="3" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="spring" value="4" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="spring" value="5" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="nodeJs">NodeJs</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="nodeJs" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="nodeJs" value="2"  />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="nodeJs" value="3"  />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="nodeJs" value="4"  />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="nodeJs" value="5"  />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="android">Android</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="android" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="android" value="2"  />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="android" value="3"  />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="android" value="4"  />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="android" value="5"  />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="ios">ios</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="ios" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="ios" value="2"  />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="ios" value="3"  />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="ios" value="4"  />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="ios" value="5"  />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="algorithm">Algorithm</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="algorithm" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="algorithm" value="2" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="algorithm" value="3" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="algorithm" value="4" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="algorithm" value="5" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="dataStructure">Data Structure</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="dataStructure" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="dataStructure" value="2"  />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="dataStructure" value="3"  />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="dataStructure" value="4"  />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="dataStructure" value="5"  />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="machinLearning">Machin Learning</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="machinLearning" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="machinLearning" value="2" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="machinLearning" value="3" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="machinLearning" value="4" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="machinLearning" value="5" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="opratingSystem">Oprating System</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="opratingSystem" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="opratingSystem" value="2"  />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="opratingSystem" value="3"  />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="opratingSystem" value="4"  />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="opratingSystem" value="5"  />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="computerArchitecture">Computer Architecture</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="computerArchitecture" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="computerArchitecture" value="2" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="computerArchitecture" value="3" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="computerArchitecture" value="4" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="computerArchitecture" value="5" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="designPattern">Design Pattern</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="designPattern" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="designPattern" value="2" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="designPattern" value="3" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="designPattern" value="4" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="designPattern" value="5" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="security">Security</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="security" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="security" value="2"  />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="security" value="3"  />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="security" value="4"  />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="security" value="5"  />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="network">Network</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="network" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="network" value="2"  />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="network" value="3"  />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="network" value="4"  />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="network" value="5"  />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="mysql">Mysql</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="mysql" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="mysql" value="2"  />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="mysql" value="3"  />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="mysql" value="4"  />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="mysql" value="5"  />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="oracle">Oracle</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="oracle" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="oracle" value="2"  />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="oracle" value="3"  />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="oracle" value="4"  />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="oracle" value="5"  />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="mongodb">Mongodb</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="mongodb" value="1" checked="checked"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="mongodb" value="2"  />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="mongodb" value="3"  />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="mongodb" value="4"  />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="mongodb" value="5"  />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group d-flex justify-content-end mt-4">
							<button type="submit" class="btn btn-primary submit" id="name_all_save">
								<span class="fa fa-paper-plane"></span>
							</button>
						</div>
						<!-- </form>  -->
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
		<!-- 	</section> -->

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


	
	<script type="text/javascript">
 	$(function(){ 
 		$("#name_all_save").click(function () {		
			var radio_name = [];//array
			var raido_name_val = {};//object
			var radio = $("input[type=radio]"); //라디오 정보를 가져옵니다.
			var arr = new Array();
			
			
			
			$.each(radio, function (key, value) { // input radio의 name 값을 가져옵니다.
				radio_name.push($(value).attr('name'));
			});
			
			//console.log(radio_name);
			
			radio_name = $.unique(radio_name.sort()).sort(); //중복요소 이름을 제거
			//console.log(radio_name);
			
			for (var i = 0; i < radio_name.length; i++) {
				var obj_length = document.getElementsByName(radio_name[i]).length;
				var obj = {
						'name': '',
						'score': ''
						};
				
				 for (var j=0; j<obj_length; j++) {
			            if (document.getElementsByName(radio_name[i])[j].checked == true) {
			                //alert(document.getElementsByName(radio_name[i])[j].value);
			                
			                obj.name=radio_name[i];
			                obj.score=document.getElementsByName(radio_name[i])[j].value;
			                
							//console.log(obj.name);
							//console.log(obj.score);
							//console.log(obj);
							
							arr.push(obj);
			            }
			        }

				}	
			
			var jsonData = JSON.stringify(arr) ;
			//console.log(jsonData) ;
			
			//alert('console.log 확인용');

			
			  $.ajax({
	    		url:'${pageContext.request.contextPath}/sign/signupAbilitylvl',		    	      
	    		type:'post',
				contentType:'application/json; charset=UTF-8',
		   		data:jsonData,
				success:function(data){
					 //alert("됨.");
					 location.href='${pageContext.request.contextPath}/sign/signupInterest';
		 		}
				// ,error:function(){
			 	// alert("안됨.");
				// }
		   	})	  
		});
	}); 
	</script>


</body>
</html>