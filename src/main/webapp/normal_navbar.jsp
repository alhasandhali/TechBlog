<%@ page import="DAO.PostDAO"%>
<%@page import="Entities.Category"%>
<%@page import="java.util.ArrayList"%>
<nav
	class="navbar navbar-expand-lg bg-body-tertiary bg-my-color3 navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">TechBlog</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
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
				<li class="nav-item"><a class="nav-link"
					href="profile.jsp"><span class="fa fa-user"
						style="margin-right: 5px;"></span>Profile</a></li>
			</ul>
			<form class="d-flex" role="search">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-light" type="submit">Search</button>
			</form>
		</div>
	</div>
</nav>