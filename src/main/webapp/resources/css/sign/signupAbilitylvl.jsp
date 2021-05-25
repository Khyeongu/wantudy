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
						<form class="signup-form" method="post"> 
						<div class="form-group">
							<label class="label" for="python">Python</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_python" value="1" checked="checked" id="python" />&nbsp;1&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_python" value="2" id="python" />&nbsp;2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_python" value="3" id="python" />&nbsp;3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_python" value="4" id="python" />&nbsp;4 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_python" value="5" id="python" />&nbsp;5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>

						<div class="form-group">
							<label class="label" for="java">Java</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_java" value="1" checked="checked" id="java" />&nbsp;1&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_java" value="2" id="java" />&nbsp;2 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_java" value="3" id="java" />&nbsp;3 &nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_java" value="4" id="java" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_java" value="5" id="java" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="c">C</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_c" value="1" checked="checked" id="c" />&nbsp;1&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_c" value="2" id="c" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_c" value="3" id="c" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_c" value="4" id="c" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_c" value="5" id="c" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="cpp">CPP</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_cpp" value="1" checked="checked" id="cpp" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_cpp" value="2" id="cpp" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_cpp" value="3" id="cpp" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_cpp" value="4" id="cpp" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_cpp" value="5" id="cpp" />&nbsp;5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="javascript">Javascript</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_javascript" value="1" checked="checked" id="javascript" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_javascript" value="2" id="javascript" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_javascript" value="3" id="javascript" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_javascript" value="4" id="javascript" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_javascript" value="5" id="javascript" />&nbsp;5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="django">Django</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_django" value="1" checked="checked" id="django" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_django" value="2" id="django" />&nbsp;2&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_django" value="3" id="django" />&nbsp;3&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_django" value="4" id="django" />&nbsp;4&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_django" value="5" id="django" />&nbsp;5 &nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="flask">Flask</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_flask" value="1" checked="checked" id="flask" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_flask" value="2" id="flask" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_flask" value="3" id="flask" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_flask" value="4" id="flask" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_flask" value="5" id="flask" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="spring">Spring</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_spring" value="1" checked="checked" id="spring" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_spring" value="2" id="spring" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_spring" value="3" id="spring" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_spring" value="4" id="spring" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_spring" value="5" id="spring" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="nodeJs">NodeJs</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_nodeJs" value="1" checked="checked" id="nodeJs" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_nodeJs" value="2" id="nodeJs" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_nodeJs" value="3" id="nodeJs" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_nodeJs" value="4" id="nodeJs" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_nodeJs" value="5" id="nodeJs" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="android">Android</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_android" value="1" checked="checked" id="android" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_android" value="2" id="android" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_android" value="3" id="android" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_android" value="4" id="android" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_android" value="5" id="android" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="ios">ios</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_ios" value="1" checked="checked" id="ios" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_ios" value="2" id="ios" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_ios" value="3" id="ios" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_ios" value="4" id="ios" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_ios" value="5" id="ios" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="algorithm">Algorithm</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_algorithm" value="1" checked="checked" id="algorithm" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_algorithm" value="2" id="algorithm" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_algorithm" value="3" id="algorithm" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_algorithm" value="4" id="algorithm" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_algorithm" value="5" id="algorithm" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="dataStructure">Data Structure</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_dataStructure" value="1" checked="checked" id="dataStructure" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_dataStructure" value="2" id="dataStructure" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_dataStructure" value="3" id="dataStructure" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_dataStructure" value="4" id="dataStructure" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_dataStructure" value="5" id="dataStructure" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="machinLearning">Machin Learning</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_machinLearning" value="1" checked="checked" id="machinLearning" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_machinLearning" value="2" id="machinLearning" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_machinLearning" value="3" id="machinLearning" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_machinLearning" value="4" id="machinLearning" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_machinLearning" value="5" id="machinLearning" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="opratingSystem">Oprating System</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_opratingSystem" value="1" checked="checked" id="opratingSystem" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_opratingSystem" value="2" id="opratingSystem" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_opratingSystem" value="3" id="opratingSystem" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_opratingSystem" value="4" id="opratingSystem" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_opratingSystem" value="5" id="opratingSystem" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="computerArchitecture">Computer Architecture</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_computerArchitecture" value="1" checked="checked" id="computerArchitecture" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_computerArchitecture" value="2" id="computerArchitecture" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_computerArchitecture" value="3" id="computerArchitecture" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_computerArchitecture" value="4" id="computerArchitecture" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_computerArchitecture" value="5" id="computerArchitecture" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="designPattern">Design Pattern</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_designPattern" value="1" checked="checked" id="designPattern" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_designPattern" value="2" id="designPattern" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_designPattern" value="3" id="designPattern" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_designPattern" value="4" id="designPattern" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_designPattern" value="5" id="designPattern" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="security">Security</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_security" value="1" checked="checked" id="security"  />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_security" value="2" id="security" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_security" value="3" id="security" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_security" value="4" id="security" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_security" value="5" id="security" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="network">Network</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_network" value="1" checked="checked" id="network" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_network" value="2" id="network" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_network" value="3" id="network" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_network" value="4" id="network" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_network" value="5" id="network" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="mysql">Mysql</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_mysql" value="1" checked="checked" id="mysql" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_mysql" value="2" id="mysql" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_mysql" value="3" id="mysql" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_mysql" value="4" id="mysql" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_mysql" value="5" id="mysql" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="oracle">Oracle</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_oracle" value="1" checked="checked" id="oracle" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_oracle" value="2"  id="oracle" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_oracle" value="3"  id="oracle" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_oracle" value="4"  id="oracle" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_oracle" value="5"  id="oracle" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group">
							<label class="label" for="mongodb">Mongodb</label>
							<div class="ability-form-control">
								&nbsp;&nbsp;(low)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_mongodb" value="1" checked="checked" id="mongodb" />&nbsp;1 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_mongodb" value="2" id="mongodb" />&nbsp;2 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_mongodb" value="3" id="mongodb" />&nbsp;3 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_mongodb" value="4" id="mongodb" />&nbsp;4 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="chk_mongodb" value="5" id="mongodb" />&nbsp;5 &nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;(high)&nbsp;&nbsp;
							</div>
						</div>
						<div class="form-group d-flex justify-content-end mt-4">
							<button type="submit" class="btn btn-primary submit" id="id_all_save">
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


	<script>
		$("#id_all_save").click(function() {
			var radio_id = []; //id 값을 넣을 배열
			var radio_id_val = {};//object
			var radio = $("input[type=radio]"); // 모든 라디오 접근
			$.each(radio, function(key, value) {
				radio_id.push($(value).attr('id')); // id 값만을 추출
			});
			radio_id = $.unique(radio_id.sort()).sort(); //중복요소제거
			var input_radio; // 라디오 id로 접근하기 위해서
			for (var i = 0; i < radio_id.length; i++) {
				input_radio = $("input[id=" + radio_id[i] + "]"); // id값으로 확인
				$.each(input_radio, function(key, value) {
					if ($(this)[0].checked === true) { //체크가 되어 있는지 아닌지확인
						radio_id_val[radio_id[i]] = $(this)[0].value; // 라디오 id 값과 value 값을 매칭
					}
				});
			}
			console.log(radio_id_val); //{python: "1", cpp: "2"}
		});
	</script>



</body>
</html>
