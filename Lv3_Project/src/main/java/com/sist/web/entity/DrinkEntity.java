package com.sist.web.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "sul_item")
@Getter
@Setter
public class DrinkEntity {
	@Id
	private int ino;
	
	private int icno,hit,vintage,jjim,first_price,price,account;
	private String poster,name,nation,alcohol,capacity,name_sub,place,winery,discount;
}
