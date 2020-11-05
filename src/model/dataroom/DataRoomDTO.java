package model.dataroom;

import java.sql.Date;

/*
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 NO                                        NOT NULL NUMBER
 NAME                                      NOT NULL NVARCHAR2(10)
 TITLE                                     NOT NULL NVARCHAR2(50)
 CONTENT                                   NOT NULL NVARCHAR2(2000)
 POSTDATE                                           DATE
 ATTACHFILE                                NOT NULL VARCHAR2(50)
 DOWNCOUNT                                          NUMBER
 PASSWORD                                  NOT NULL VARCHAR2(10)
 */
public class DataRoomDTO {
	String no;
	String name;
	String title;
	String content;
	Date postDate;
	String attachFile;
	String downCount;
	String password;
	
	public DataRoomDTO() {}

	public DataRoomDTO(
			String no, String name, String title, String content, 
			Date postDate, String attachFile,String downCount, String password) {
		this.no = no;
		this.name = name;
		this.title = title;
		this.content = content;
		this.postDate = postDate;
		this.attachFile = attachFile;
		this.downCount = downCount;
		this.password = password;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getAttachFile() {
		return attachFile;
	}

	public void setAttachFile(String attachFile) {
		this.attachFile = attachFile;
	}

	public String getDownCount() {
		return downCount;
	}

	public void setDownCount(String downCount) {
		this.downCount = downCount;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
