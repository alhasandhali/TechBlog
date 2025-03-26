<%@page import="java.text.DateFormat"%>
<%@page import="java.util.zip.DataFormatException"%>
<%@page import="Entities.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Entities.*"%>
<%@ page import="DAO.*"%>
<%@ page errorPage="error.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");

if (user == null) {
	response.sendRedirect("logIn.jsp");
}
%>
<%
long postId = Long.parseLong(request.getParameter("post_id"));

PostDAO postDao = new PostDAO();
UserDAO userDao = new UserDAO();

Post post = postDao.getPostByPostId(postId);

Category cat = postDao.getCatByCatId(post.getCid());

User auth = userDao.getUserByUserId(post.getUid());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechBolg | <%=post.getTitle()%></title>
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
							ArrayList<Category> list1 = postDao.getCategories();
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
					<li class="nav-item"><a href="profile.jsp" class="nav-link"><span
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

	<!-- Main content start -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header">
						<h1><%=post.getTitle()%></h1>
						<p
							style="display: flex; justify-content: space-between; width: 100%; margin-top: 10px; margin-bottom: -2px">
							<span>Author: <b><a href="#!"
									class="text-decoration-none"><%=auth.getName()%></a></b></span> <span>Posted:
								<%=DateFormat.getDateTimeInstance().format(post.getCreatedTime())%></span>
						</p>
					</div>
					<div class="card-body">
						<div
							style="display: flex; justify-content: space-between; width: 100%; margin-bottom: 10px;">
							<span>Category: <b><%=cat.getName()%></b></span> <span>Last
								update: <%
 if (post.getUpdatedTime() == null) {
 %> <%=DateFormat.getDateTimeInstance().format(post.getCreatedTime())%>
								<%
								} else {
								%> <%=DateFormat.getDateTimeInstance().format(post.getUpdatedTime())%>
								<%
								}
								%>
							</span>
						</div>
						<img alt="post_img" src="images/<%=post.getImage()%>"
							style="max-width: 100%;">
						<p style="margin-top: 20px; text-align: justify;"><%=post.getContent()%></p>
						<p>
							Tags:
							<%=post.getTags()%></p>
					</div>
					<div class="card-footer my-mb-20x bg-my-color">
						<div
							style="display: flex; justify-content: space-between; width: 100%;">
							<%
							LikeDAO ld = new LikeDAO();
							boolean isLiked = ld.isLikeByUser(post.getId(), user.getId());
							%>

							<a href="#!" onclick="doLike(<%=post.getId()%>, <%=user.getId()%>)"
								class="text-white like-btn"
								style="margin-right: 50px; text-decoration: none;"> <i
								id="like-icon-<%=post.getId()%>"
								class="<%=isLiked ? "fa fa-thumbs-up" : "fa fa-thumbs-o-up"%>"></i>
								<span id="like-count-<%=post.getId()%>"><%=ld.countLikeOnPost(post.getId())%></span>
							</a> <span class="text-white"><i class="fa fa-eye my-margin-right-5x"></i><%=post.getViews()%>views</span>
							<a href="#!" style="text-decoration: none;" class="text-white"><i
								class="fa fa-commenting-o"></i><span>10</span></a>
						</div>

					</div>
				</div>



			</div>
		</div>
	</div>
	<!-- Main content end -->

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
</body>
</html>