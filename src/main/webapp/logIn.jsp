<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Entities.Message"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechBlog</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<!-- Nav Bar section -->
	<%@include file="normal_navbar.jsp"%>

	<!-- Log In form -->
	<main class="d-flex align-item-center my-mt-15x" style="height: 70vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card bg-my-color2">
						<div class="card-header">
							<span class="fa fa-user-circle-o fa-2x"
								style="margin-right: 5px;"></span>
							<h3 style="display: inline-block;">Log In</h3>
						</div>
						<%
						Message m = (Message) session.getAttribute("msg");
						if (m != null) {
						%>
						<div class="alert <%=m.getCssClass()%> text-center" role="alert">
							<%=m.getContent()%>
						</div>
						<%
						session.removeAttribute("msg");
						}
						%>
						<div class="card-body">
							<form id="login_form" action="LogInServlet" method="POST">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input name="email" required type="email"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp"
										placeholder="Enter your e-mail...">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input name="password" required type="password"
										class="form-control" id="exampleInputPassword1"
										placeholder="Enter your password...">
								</div>
								<div class="mb-3 form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Remember me</label> <a href="#"
										style="margin-left: 125px;">forgot password?</a>
								</div>
								<div id="loader" class="text-center" style="display: none;">
									<span class="fa fa-refresh fa-spin fa-2x"></span>
									<p>Please wait...</p>
								</div>
								<div class="text-center" id="submit_btn">
									<button type="submit" class="btn btn-primary">
										<span class="my-margin-right-5x fa fa-sign-in"></span>Log In
									</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- JS Linker -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="js/script.js"></script>
	<!-- <script type="text/javascript">
	$(document).ready(function(){
		console.log("Load...");
		console.log(typeof swal);
		console.log(swal);
		
        $("#login_form").submit(function(event){
            event.preventDefault(); // Prevent default form submission

            var form = new FormData(this);
            
            $("#submit_btn").hide();
            $("#loader").show();

            $.ajax({
                url: "LogInServlet",
                type: 'POST',
                data: form,
                success: function(data){
                    console.log(data);
                    
                    $("#submit_btn").show();
                    $("#loader").hide();
                    
                    
                    if(data.trim() === 'Invalid!'){
                    	Swal.fire({
                    		title: "Welcome",
                    		  text: "Enjoy!!!",
                    		  icon: "success"
                    		})/* .then((value) => {
                    		  window.location = "profile.jsp";
                    		}); */
                    }
                    else{
                    	Swal.fire({
                    		  title: data,
                    		  text: "User doesn't exist",
                    		  icon: "error"
                  		});
                    }
                    
                },
                error: function(jqXHR, textStatus, errorThrown){
                    console.error("Error:", textStatus, errorThrown);
                    
                    $("#submit_btn").show();
                    $("#loader").hide();
                },
                processData: false,
                contentType: false
            });
        });
    });
	</script> -->
</body>
</html>