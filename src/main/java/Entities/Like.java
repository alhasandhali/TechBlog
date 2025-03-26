package Entities;

public class Like {
	private long id;
	private long pid;
	private int uid;
	
	public Like() {
		
	}
	
	public Like(long pid, int uid) {
		this.pid = pid;
		this.uid = uid;
	}
	
	public Like(long id, long pid, int uid) {
		this.id = id;
		this.pid = pid;
		this.uid = uid;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getPid() {
		return pid;
	}

	public void setPid(long pid) {
		this.pid = pid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
}
