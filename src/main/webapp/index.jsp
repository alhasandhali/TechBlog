<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechBlog</title>

<!-- CSS Linker -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<!-- END -->
</head>
<body>
	<!-- Nav Bar section -->
	<%@include file="normal_navbar.jsp"%>

	<!-- Banner section -->
	<div class="container-fluid p-0 m-0">
		<div class="p-5 mb-4 rounded-3 bg-my-color text-white">
			<!-- instead of jumbotron class -->
			<div class="container">
				<h3 class="display-3">Welcome to TechBlog</h3>
				<p>Thinking about starting a blog, but not sure what to write
					about? If you have an interest in smart devices, gadgets, science,
					or any kind of technological implement, you might consider starting
					a tech blog.</p>
				<p>Thinking about starting a blog, but not sure what to write
					about? If you have an interest in smart devices, gadgets, science,
					or any kind of technological implement, you might consider starting
					a tech blog.</p>
				<a class="btn btn-outline-light my-margin-right-7x"
					href="registration.jsp"> <span
					class="fa fa-user-plus my-margin-right-5x"></span>Sign Up
				</a> <a class="btn btn-outline-light" href="logIn.jsp"> <span
					class="fa fa-user-circle-o my-margin-right-5x fa-spin"></span>Log
					In
				</a>
			</div>
		</div>

		<!-- Card section -->
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="card" style="width: 18rem;">
						<div class="card-body bg-my-color2">
							<h5 class="card-title">Java Programming</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-primary">Read more</a>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card" style="width: 18rem;">
						<div class="card-body bg-my-color2">
							<h5 class="card-title">C Programming</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-primary">Read more</a>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card" style="width: 18rem;">
						<div class="card-body bg-my-color2">
							<h5 class="card-title">C++ Programming</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-primary">Read more</a>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card" style="width: 18rem;">
						<div class="card-body bg-my-color2">
							<h5 class="card-title">C# Programming</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-primary">Read more</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row my-mt-15x">
				<div class="col-md-3">
					<div class="card" style="width: 18rem;">
						<div class="card-body bg-my-color2">
							<h5 class="card-title">Python Programming</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-primary">Read more</a>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card" style="width: 18rem;">
						<div class="card-body bg-my-color2">
							<h5 class="card-title">JavaScript Programming</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-primary">Read more</a>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card" style="width: 18rem;">
						<div class="card-body bg-my-color2">
							<h5 class="card-title">Go Programming</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-primary">Read more</a>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card" style="width: 18rem;">
						<div class="card-body bg-my-color2">
							<h5 class="card-title">Assembly Programming</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-primary">Read more</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer section -->
		<footer>
			<div class="container">
				<div class="p-5 mb-4 rounded-3"></div>
			</div>
		</footer>
	</div>

	<!-- JS Linker -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="js/script.js"></script>
</body>
</html>