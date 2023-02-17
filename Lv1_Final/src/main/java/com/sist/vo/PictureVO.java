package com.sist.vo;
/*
	GPNO     NOT NULL NUMBER        
	IMAGE    NOT NULL CLOB          
	TITLE    NOT NULL VARCHAR2(150) 
	NAME     NOT NULL VARCHAR2(60)  
	CONTENT           CLOB          
	CONTENT2          CLOB          
	INFO              VARCHAR2(150) 
	CODE              VARCHAR2(50) 
 */
public class PictureVO {
	private int gpno;
	private String image, title, name, content, content2, info, code, image2;
	
	
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getGpno() {
		return gpno;
	}
	public void setGpno(int gpno) {
		this.gpno = gpno;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
