<%@page import="DAO.*"%>
<%@page import="Entities.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<div class="row">
	<%
	User user = (User) session.getAttribute("currentUser");

	if (user == null) {
		response.sendRedirect("logIn.jsp");
	}

	PostDAO postDao = new PostDAO();
	List<Post> posts = new ArrayList<>();

	int cid = Integer.parseInt(request.getParameter("cid"));

	if (cid == 0) {
		posts = postDao.getPost();
	} else {
		posts = postDao.getPostCS(cid);
	}

	if (posts.size() == 0) {
		out.println("<p class='display-6 text-center'>No post available in this category</p>");
	}

	for (Post p : posts) {
	%>
	<div class="col-md-4 mt-2">
		<div class="card h-100 d-flex flex-column border-info">
			<img src="images/<%=p.getImage()%>" class="card-img-top" alt="...">
			<div class="card-body d-flex flex-column">
				<b> <%
 String tResult = p.getTitle().length() > 100 ? p.getTitle().substring(0, 50) + "..." : p.getTitle();
 %> <%=tResult%>
				</b>
				<hr style="margin-top: 5px; margin-bottom: 5px;">
				<p class="flex-grow-1" style="text-align: justify;">
					<%
					String cResult = p.getContent().length() > 100 ? p.getContent().substring(0, 102) : p.getContent();
					%>
					<%=cResult%>
					<a href="blog_page.jsp?post_id=<%=p.getId()%>"
						style="text-decoration: none;"><span class="text-dark">...</span>read
						more</a>
				</p>
			</div>
			<div class="card-footer bg-my-color text-center">
				<%
				LikeDAO ld = new LikeDAO();
				boolean isLiked = ld.isLikeByUser(p.getId(), user.getId());
				%>

				<a href="#!" onclick="doLike(<%=p.getId()%>, <%=user.getId()%>)"
					class="text-white like-btn"
					style="margin-right: 50px; text-decoration: none;"> <i
					id="like-icon-<%=p.getId()%>"
					class="<%=isLiked ? "fa fa-thumbs-up" : "fa fa-thumbs-o-up"%>"></i>
					<span id="like-count-<%=p.getId()%>"><%=ld.countLikeOnPost(p.getId())%></span>
				</a> <a href="#!" class="text-white" style="text-decoration: none;"><i
					class="fa fa-commenting-o"></i><span>10</span></a>
			</div>
		</div>
	</div>
	<%
	}
	%>
</div>