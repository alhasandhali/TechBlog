package Entities;

import java.sql.Timestamp;

public class Post {
	private Long id;
	private String title;
	private String content;
	private String image;
	private Long views = 0L;
	private String status;
	private Timestamp createdTime;
	private Timestamp updatedTime;
	private Timestamp publishedTime;
	private int cid;
	private int uid;
	private String tags;
	
	
	//Constructor
	public Post() {

	}

	public Post(Long id, String title, String content, String image, Long views, String status,
			Timestamp createdTime, Timestamp updatedTime, Timestamp publishedTime, int cid, int uid, String tags) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.image = image;
		this.views = views;
		this.status = status;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
		this.publishedTime = publishedTime;
		this.cid = cid;
		this.uid = uid;
		this.tags = tags;
	}

	public Post(String title, String content, String image, String status, int cid, int uid, String tags) {
		super();
		this.title = title;
		this.content = content;
		this.image = image;
		this.status = status;
		this.cid = cid;
		this.uid = uid;
		this.tags = tags;
	}

	public Post(Long id, String title, String content, String image, Long views, String status, Timestamp createdTime,
			Timestamp updatedTime, Timestamp publishedTime, int uid, String tags) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.image = image;
		this.views = views;
		this.status = status;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
		this.publishedTime = publishedTime;
		this.uid = uid;
		this.tags = tags;
	}

	// Getters and Setters
	public void setCreatedTime(Timestamp createdTime) {
		this.createdTime = createdTime;
	}

	public void setUpdatedTime(Timestamp updatedTime) {
		this.updatedTime = updatedTime;
	}

	public void setPublishedTime(Timestamp publishedTime) {
		this.publishedTime = publishedTime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Long getViews() {
		return views;
	}

	public void setViews(Long views) {
		this.views = views;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getCreatedTime() {
		return createdTime;
	}

	public Timestamp getUpdatedTime() {
		return updatedTime;
	}

	public Timestamp getPublishedTime() {
		return publishedTime;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}
	
}
