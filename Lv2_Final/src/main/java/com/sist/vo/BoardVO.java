package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class BoardVO {
   private int bno,btype,hit,replyCnt,boardCnt;
   private String id,name,nickname,title,content,tag,dbday,image;
   private Date regdate;
}