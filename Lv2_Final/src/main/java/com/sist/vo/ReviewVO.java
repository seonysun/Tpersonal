package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ReviewVO {
	private int rno,cno;
	private String content,id,dbday;
	private Date regdate;
}