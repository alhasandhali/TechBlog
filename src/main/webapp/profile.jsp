<%@page import="Entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Entities.*"%>
<%@ page import="DAO.PostDAO"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
User user = (User) session.getAttribute("currentUser");

if (user == null) {
	response.sendRedirect("logIn.jsp");
}

Timestamp timestamp = user.getDateTime();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
String formattedDate = dateFormat.format(timestamp);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechBlog - <%=user.getName()%></title>

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

	<!-- Nav Bar section start-->
	<nav
		class="navbar navbar-expand-lg bg-body-tertiary bg-my-color3 navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">TechBlog</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp"><span class="fa fa-home"
							style="margin-right: 5px;"></span>Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <span
							class="fa fa-sitemap" style="margin-right: 5px;"></span>Categories
					</a>
						<ul class="dropdown-menu">
							<%
							PostDAO pd1 = new PostDAO();
							ArrayList<Category> list1 = pd1.getCategories();
							for (Category c : list1) {
							%>
							<li><a class="dropdown-item" href="#"><%=c.getName()%></a></li>
							<%
							}
							%>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Browse for more
									option</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="logIn.jsp"><span
							class="fa fa-user-circle-o" style="margin-right: 5px;"></span>Log
							In</a></li>
					<li class="nav-item"><a class="nav-link"
						href="registration.jsp"><span class="fa fa-user-plus"
							style="margin-right: 5px;"></span>Sign Up</a></li>
					<li class="nav-item"><a class="nav-link" href="profile.jsp"><span
							class="fa fa-user" style="margin-right: 5px;"></span>Profile</a></li>
				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item"><a href="#!" class="nav-link"
						data-bs-toggle="modal" data-bs-target="#profileModal"><span
							class="my-margin-right-5x fa fa-user"></span><%=user.getName()%></a>
					</li>
					<li class="nav-item"><a href="#!" class="nav-link"
						data-bs-toggle="modal" data-bs-target="#postModal"><span
							class="fa fa-plus-square" style="margin-right: 5px;"></span>Do
							post</a></li>
					<li class="nav-item"><a href="LogOutServlet" class="nav-link"><span
							class="my-margin-right-5x fa fa-sign-out"></span>Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Nav Bar section end-->

	<!-- Message Module Start -->
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
	<!-- Message Module Start -->

	<!-- Main body start -->
	<main>
		<div class="container">
			<div class="row mt-4">
				<div class="col-md-4">
					<div class="list-group">
						<a href="#" class="c-link list-group-item list-group-item-action active"
							aria-current="true" onclick="getPost(0, this)"> All Posts </a>
						<%
						PostDAO pd2 = new PostDAO();
						ArrayList<Category> list2 = pd2.getCategories();
						for (Category c : list1) {
						%>
						<a href="#" onclick="getPost(<%=c.getId()%>, this)"
							class="c-link list-group-item list-group-item-action"><%=c.getName()%></a>
						<%
						}
						%>
					</div>
				</div>
				<div class="col-md-8">
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h4 class="mt-2">Loading...</h4>
					</div>
					<div class="container-fluid" id="post-box"></div>
				</div>
			</div>
		</div>
	</main>
	<!-- Main body end -->

	<!-- Profile section start-->
	<!-- Modal -->
	<div class="modal fade" id="profileModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-my-color text-white">
					<h1 class="modal-title fs-5 fw-bold fst-italic"
						id="exampleModalLabel">Basic Information</h1>
					<button type="button" class="btn-close text-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="bg-my-color text-white text-center"
					style="margin-top: -1px;">
					<img alt="default-image" src="images/<%=user.getProfile()%>"
						style="max-height: 125px; max-width: 125px; border-radius: 50%;">
					<h3 id="profile-header-name" style="letter-spacing: 3px;"><%=user.getName()%></h3>
				</div>
				<div class="modal-body">
					<!-- Profile Show-case part -->
					<div class="container my-ml-20x" id="profile-showcase">
						<p>
							<span class="fw-bold" style="margin-right: 134px;">ID </span><span>:
								<%=user.getId()%></span>
						</p>
						<p>
							<span class="fw-bold" style="margin-right: 106px;">Name </span><span>:
								<%=user.getName()%></span>
						</p>
						<p>
							<span class="fw-bold" style="margin-right: 110px;">Email </span><span>:
								<%=user.getEmail()%></span>
						</p>
						<p>
							<span class="fw-bold" style="margin-right: 97px;">Gender </span><span>:
								<%=user.getGender()%></span>
						</p>
						<p>
							<span class="fw-bold" style="margin-right: 55px;">Date of
								birth </span><span>: <%=user.getDob()%></span>
						</p>
						<p>
							<span class="fw-bold" style="margin-right: 22px;">Registration
								time </span><span>: <%=formattedDate%></span>
						</p>
					</div>

					<!-- Edit profile part -->
					<div class="container my-ml-20x" id="profile-edit"
						style="display: none;">
						<form action="ProfileEditServlet" method="POST"
							enctype="multipart/form-data">
							<p>
								<span class="fw-bold" style="margin-right: 134px;">ID </span><span>:
									<%=user.getId()%></span>
							</p>
							<p>
								<span class="fw-bold" style="margin-right: 106px;">Name </span><span>:
									<input class="my-border-color" type="text" name="user_name"
									value="<%=user.getName()%>">
								</span>
							</p>
							<p>
								<span class="fw-bold" style="margin-right: 110px;">Email
								</span><span>: <input class="my-border-color" type="email"
									name="user_email" value="<%=user.getEmail()%>"></span>
							</p>
							<p>
								<span class="fw-bold" style="margin-right: 81px;">Password
								</span><span>: <input class="my-border-color" type="password"
									name="user_pass" value="<%=user.getPassword()%>"></span>
							</p>
							<p>
								<span class="fw-bold" style="margin-right: 97px;">Gender
								</span><span>: <label> <input type="radio" name="gender"
										value="Male" id="male-radio"> Male
								</label> <label> <input type="radio" name="gender"
										value="Female" id="female-radio"> Female
								</label></span>
							</p>
							<p>
								<span class="fw-bold" style="margin-right: 55px;">Date of
									birth </span><span>: <input type="date" name="user_dob"
									value="<%=user.getDob()%>"></span>
							</p>
							<p>
								<span class="fw-bold" style="margin-right: 22px;">Registration
									time </span><span>: <%=formattedDate%></span>
							</p>
							<p>
								<span class="fw-bold" style="margin-right: 11px;">Upload
									new profile</span><span>: <input type="file" name="user_image"
									style="margin-right: -13.8px;"></span>
							</p>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-primary">Save</button>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="profile-edit-btn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Profile section end-->

	<!-- Add post modal start -->
	<!-- Modal -->
	<div class="modal fade" id="postModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Create
						Post</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="POST"
						enctype="multipart/form-data">
						<div class="form-group">
							<select class="form-control" name="ctgry">
								<option selected="selected" disabled="disabled">---
									Select Category ---</option>
								<%
								PostDAO pd = new PostDAO();
								ArrayList<Category> list = pd.getCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getId()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group my-mt-5x">
							<input type="text" class="form-control"
								placeholder="Enter post title..." name="title">
						</div>
						<div class="form-group my-mt-5x">
							<textarea class="form-control"
								placeholder="Enter post content..." style="height: 150px;"
								name="content"></textarea>
						</div>
						<div class="form-group my-mt-5x">
							<input type="text" class="form-control"
								placeholder="Add tags (seperate by comma[,])..." name="tags">
						</div>
						<div class="form-group my-mt-20x my-ml-10x">
							<label class="my-margin-right-10x">Status: </label> <span
								class="my-margin-right-7x"><input type="radio"
								value="draft" id="status_draft" name="status"><label
								class="my-ml-5x">Draft</label></span> <span class="my-margin-right-7x"><input
								type="radio" value="published" id="status_published"
								name="status" checked><label class="my-ml-5x">Published</label></span>
							<span class="my-margin-right-7x"><input type="radio"
								value="archived" id="status_archived" name="status"><label
								class="my-ml-5x">Archived</label></span>
						</div>
						<div class="form-group my-mt-20x my-ml-10x">
							<label>Add image: </label> <input type="file" name="postPic">
						</div>
						<div class="container text-center my-mt-20x">
							<button type="submit" class="btn btn-outline-primary">POST</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Add post modal end -->



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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="js/script.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;

			$('#profile-edit-btn').click(function() {
				if (editStatus == false) {
					$('#profile-showcase').hide();
					$('#profile-edit').show();
					editStatus = true;
					$(this).text("Back");
					$('#profile-header-name').text("Edit your Information");
				} else {
					$('#profile-showcase').show();
					$('#profile-edit').hide();
					editStatus = false;
					$(this).text("Edit");
					$('#profile-header-name').text("<%=user.getName()%>");
				}
			});
			
			var genderFromDB = "<%=user.getGender() != null ? user.getGender().trim() : ""%>";

							if (genderFromDB === "Male") {
								$('#male-radio').prop('checked', true);
							} else if (genderFromDB === "Female") {
								$('#female-radio').prop('checked', true);
							}

						});
	</script>

	<!-- Now add post -->
	<script type="text/javascript">
		$(document).ready(function(e) {
			$("#add-post-form").on("submit", function(event) {
				//this code gets called when form is submitted
				event.preventDefault();
				console.log("Clicked work");
				let form = new FormData(this);

				//now requesting to server
				$.ajax({
					url : "AddPostServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						//success
						console.log(data);
						if (data.trim() == 'success') {
							Swal.fire({
								title : "Successfully Submitted",
								icon : "success",
								draggable : true
							});
						} else if (data.trim() == 'noTitle') {
							Swal.fire({
								title : "Please enter title",
								icon : "warning",
								draggable : true
							});
						} else if (data.trim() == 'notSubmit') {
							Swal.fire({
								title : "Something went wrong!",
								icon : "error",
								draggable : true
							});
						} else if (data.trim() == 'noCat') {
							Swal.fire({
								title : "Please select Cagetory",
								icon : "warning",
								draggable : true
							});
						} else {
							Swal.fire({
								title : "Something went wrong!",
								icon : "error",
								draggable : true
							});
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						//error
						console.log("Error");
						Swal.fire({
							title : "Something went wrong!",
							icon : "error",
							draggable : true
						});
					},
					processData : false,
					contentType : false
				})
			})
		})
	</script>

	<!-- Loading Post AJAX -->
	<script type="text/javascript">
		function getPost(catId, temp) {
			$('.c-link').removeClass('active')
			$.ajax({
				url : "load_post.jsp",
				data : {
					cid : catId,
				},
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$('#loader').hide();
					$('#post-box').html(data);
					$(temp).addClass('active')
				}
			})
		}

		$(document).ready(function(e) {
			getPost(0, $('.c-link')[0]);
		})
	</script>
</body>
</html>