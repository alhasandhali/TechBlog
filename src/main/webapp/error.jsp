<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry! Something Wrong!!!</title>

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
	<div class="container text-center">
		<img alt="error_img" src="images/computer.png"
			class="img-fluid my-mt-15x">
		<h3 class="display-3">Something went wrong!!!</h3>
		<p class="d-block"><%=exception%></p>
		<a href="index.jsp"
			class="btn btn-lg text-white btn-outline-light bg-my-color3">Go
			to home</a>
	</div>
</body>
</html>