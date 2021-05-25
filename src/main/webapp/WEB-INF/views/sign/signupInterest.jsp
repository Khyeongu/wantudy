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
			<a class="navbar-brand" href="sign"><span class="navbar-name">wantudy</span></a>
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
						<form class="signupAbilitylvl-form" method="post">
							<div class="form-group">
								<label class="label" for="python">Python</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_python" value="1" checked="checked">1&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_python" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_python" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_python" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_python" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="java">Java</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_java" value="1" checked="checked"> 1  &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_java" value="2">2  &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_java" value="3">3  &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_java" value="4">4  &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_java" value="5">5  &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="c">C</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_c" value="1" checked="checked">1&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_c" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_c" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_c" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_c" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="cpp">CPP</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_cpp" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_cpp" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_cpp" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_cpp" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_cpp" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>					
							</div>
							<div class="form-group">
								<label class="label" for="javascript">Javascript</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_javascript" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_javascript" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_javascript" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_javascript" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_javascript" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;  
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="django">Django</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_django" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_django" value="2">2&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_django" value="3">3&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_django" value="4">4&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_django" value="5">5&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;  
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="flask">Flask</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_flask" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_flask" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_flask" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_flask" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_flask" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="spring">Spring</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_spring" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_spring" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_spring" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_spring" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_spring" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="nodeJs">NodeJs</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_nodeJs" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_nodeJs" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_nodeJs" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_nodeJs" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_nodeJs" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="android">Android</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_android" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_android" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_android" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_android" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_android" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="ios">ios</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_ios" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_ios" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_ios" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_ios" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_ios" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="algorithm">Algorithm</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_algorithm" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_algorithm" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_algorithm" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_algorithm" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_algorithm" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="dataStructure">Data Structure</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_dataStructure" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_dataStructure" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_dataStructure" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_dataStructure" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_dataStructure" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="machinLearning">Machin Learning</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_machinLearning" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_machinLearning" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_machinLearning" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_machinLearning" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_machinLearning" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="opratingSystem">Oprating System</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_opratingSystem" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_opratingSystem" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_opratingSystem" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_opratingSystem" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_opratingSystem" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="computerArchitecture">Computer Architecture</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_computerArchitecture" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_computerArchitecture" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_computerArchitecture" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_computerArchitecture" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_computerArchitecture" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="designPattern">Design Pattern</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_designPattern" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_designPattern" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_designPattern" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_designPattern" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_designPattern" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="security">Security</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_security" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_security" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_security" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_security" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_security" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="network">Network</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_network" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_network" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_network" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_network" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_network" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="mysql">Mysql</label> 
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_mysql" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_mysql" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_mysql" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_mysql" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_mysql" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="oracle">Oracle</label> 
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_oracle" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_oracle" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_oracle" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_oracle" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_oracle" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group">
								<label class="label" for="mongodb">Mongodb</label>
								<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_mongodb" value="1" checked="checked">1 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_mongodb" value="2">2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_mongodb" value="3">3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_mongodb" value="4">4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_mongodb" value="5">5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
								</div>
							</div>
							<div class="form-group d-flex justify-content-end mt-4">
								<button type="submit" class="btn btn-primary submit">
									<span class="fa fa-paper-plane"></span>
								</button>
							</div>
						</form>
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
						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="">
						</div>
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

</body>
</html>
								