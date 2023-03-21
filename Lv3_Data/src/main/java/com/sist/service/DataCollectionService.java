package com.sist.service;

import java.util.*;
import com.sist.dao.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class DataCollectionService {

   public static void main(String[] args) {
      DataCollectionService ds = new DataCollectionService();
      ds.test();
   }
   
   public void test() {
	   DataDAO dao=new DataDAO();
	   try {
		   
		   for(int i=1; i<=6; i++ ) {
			   
			   Document doc = Jsoup.connect("https://www.neateun.com/all/?&page=" + i).get();
			   //System.out.println(doc.html());
			   
			   Elements link = doc.select("div.item-wrap a");
			   for(int j=1; j<link.size(); j++) {
				   
				   if(i==1 && j==8) {
					   continue;
				   }
				   
				   System.out.println("https://www.neateun.com"+link.get(j).attr("href"));
				   
				   StringTokenizer st = new StringTokenizer("https://www.neateun.com"+link.get(j).attr("href"));
				   Document doc2 = Jsoup.connect(st.nextToken()).get();
				   //System.out.println(j);
				   
				   Element elposter = doc2.selectFirst("div.item img");
				   //System.out.println(elposter.attr("src"));
				   
				   String poster=elposter.attr("src");
				   System.out.println(poster);

				   Elements elname = doc2.select("div.view_tit");
				   //System.out.println(elname.get(0).text());
				   
				   String name= elname.get(0).text();
				   System.out.println(name);
				   
				   Element elprice = doc2.selectFirst("span.real_price");
				   //System.out.println(elprice.text());
				   
				   String price = elprice.text();
				   System.out.println(price);
				   
//				   Elements elinfo = doc2.select("div.fr-view p");
//				   System.out.println(elinfo.get(0).text());
//				   System.out.println(elinfo.get(1).attr("ec-data-src"));
//				   System.out.println(elinfo.get(2).attr("ec-data-src"));
//				   System.out.println(elinfo.get(3).attr("ec-data-src"));
//				   
//				   String info1 = elinfo.get(0).attr("ec-data-src");
//				   String info2 = elinfo.get(1).attr("ec-data-src");
//				   String info3 = elinfo.get(2).attr("ec-data-src");
//				   String info4 = elinfo.get(3).attr("ec-data-src");
//				   System.out.println(info1);
//				   System.out.println(info2);
//				   System.out.println(info3);
//				   System.out.println(info4);
//				   
				   System.out.println("=========");
				   
				   DataVO vo=new DataVO();
				   vo.setName(name);
				   vo.setPoster(poster);
				   vo.setPrice(price);
				   dao.dataInsert(vo);
			   }
		   }
		   
	   } catch (Exception e) {}
   }
   
}