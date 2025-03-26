function doLike(pid, uid) {
	console.log("Post ID: " + pid + ", User ID: " + uid);

	$.ajax({
		url: "LikeServlet",
		type: "GET",
		data: { uid: uid, pid: pid, operation: "like" },
		success: function(response) {
			console.log("Server Response:", response);

			let likeCounter = $("#like-count-" + pid);
			let likeIcon = $("#like-icon-" + pid);
			let currentLikes = parseInt(likeCounter.text());

			if (response.trim() === "liked") {
				likeCounter.text(currentLikes + 1);  // Increase like count
				likeIcon.removeClass("fa-thumbs-o-up").addClass("fa-thumbs-up"); // Change to solid thumbs-up
			} else if (response.trim() === "unliked") {
				likeCounter.text(currentLikes - 1);  // Decrease like count
				likeIcon.removeClass("fa-thumbs-up").addClass("fa-thumbs-o-up"); // Change to outline thumbs-up
			}
		},
		error: function() {
			console.error("Error in liking post.");
		}
	});
}
