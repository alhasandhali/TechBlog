<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<div class="col-md-6 offset-md-3">
					<div class="card bg-my-color2">
						<div class="card-header">
							<span class="fa fa-user-plus fa-2x" style="margin-right: 5px;"></span>
							<h3 style="display: inline-block;">Sign Up</h3>
						</div>
						<div class="card-body">
							<form id="regi_form" action="RegistrationServlet" method="POST">
								<div class="mb-3">
									<label for="exampleInputName" class="form-label">Enter
										your name</label> <input type="text" name="user_name"
										class="form-control" id="exampleInputName"
										placeholder="Enter your name...">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input type="email" name="user_email"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp"
										placeholder="Enter your e-mail...">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="password" name="user_password1"
										class="form-control" id="exampleInputPassword1"
										placeholder="Enter your password...">
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword2" class="form-label">Re-type
										Password</label> <input type="password" name="user_password2"
										class="form-control" id="exampleInputPassword2"
										placeholder="Re-enter your password...">
								</div>
								<div class="mb-3">
									<label class="form-label">Gender: </label>
									<div class="male d-inline-block my-ml-5x">
										<input type="radio" id="gender" name="gender" value="Male"
											checked> <label for="gender" class="form-label">Male</label>
									</div>
									<div class="female d-inline-block my-ml-20x">
										<input type="radio" id="gender" name="gender" value="Female">
										<label for="gender" class="form-label">Female</label>
									</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputDob" class="form-label">Date of
										Birth</label> <input type="date" name="user_dob" class="form-control"
										id="exampleInputDob">
								</div>
								<div class="mb-3 form-check">
									<input type="checkbox" name="checkBox" class="form-check-input"
										id="exampleCheck1"><a href="#">Agree with Terms &
										Conditions</a>
								</div>
								<div id="loader" class="text-center" style="display: none;">
									<span class="fa fa-refresh fa-spin fa-2x"></span>
									<p>Please wait...</p>
								</div>
								<div id="submit_btn" class="text-center">
									<button type="submit" class="btn btn-primary">Submit</button>
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
	<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
	<script src="js/script.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		console.log("Load...");
		console.log(typeof swal);
		console.log(swal);
		
        $("#regi_form").submit(function(event){
            event.preventDefault(); // Prevent default form submission

            var form = new FormData(this);
            
            $("#submit_btn").hide();
            $("#loader").show();

            $.ajax({
                url: "RegistrationServlet",
                type: 'POST',
                data: form,
                success: function(data){
                    console.log(data);
                    
                    $("#submit_btn").show();
                    $("#loader").hide();
                    
                    /* swal("Click on either the button or outside the modal.")
                    .then((value) => {
                      swal(`The returned value is: ${value}`);
                    }); */
                    
                    if(data.trim() === 'Submit Successfully'){
                    	Swal.fire({
                    		  title: "Good job!",
                    		  text: data,
                    		  icon: "success"
                    		}).then((value) => {
                    		  window.location = "logIn.jsp";
                    		});
                    }  
                    else if(data.trim() === "Not Submit. Something Error!!"){
                    	Swal.fire({
                    		  title: "Not Submit!!!",
                    		  text: "Something Error!",
                    		  icon: "error"
                    		});
                    }
                    else{
                    	Swal.fire({
                  		  title: "Please!!!",
                  		  text: data,
                  		  icon: "warning"
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
	</script>
</body>
</html>