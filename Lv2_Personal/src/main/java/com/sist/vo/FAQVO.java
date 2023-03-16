package com.sist.vo;
import java.util.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FAQVO {
	private int no,cate_no,ano,hit;
	private String subject,content,dbday,name,pwd;
	private Date regdate;
}
