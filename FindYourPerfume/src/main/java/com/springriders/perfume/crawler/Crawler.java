package com.springriders.perfume.crawler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.springriders.perfume.crawler.model.CrawlerBrandVO;
import com.springriders.perfume.crawler.model.CrawlerPerfumeVO;
 
public class Crawler {
	
    public static List<CrawlerBrandVO> getBrand(List<CrawlerBrandVO> list) {
        String url = "https://www.celeconc.com/ajax/brand_search.exe.php?flag=brand_main&cno1=&brand_type=&brand_type_s=&lang=ABC&brand_text=ALL";
        String selEng = ".tbl_brand_list tr p.eng a";
        String selKor = ".tbl_brand_list tr p.kor a";
        Document doc = null;    
        
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        
        Elements selEngEle = doc.select(selEng);
        Elements selKorEle = doc.select(selKor);
        
        for(int i=0; i<selEngEle.size(); i++) {
        	CrawlerBrandVO vo = new CrawlerBrandVO();
        	list.add(vo);
        	
        	String eng = selEngEle.get(i).text();
        	String kor= selKorEle.get(i).text();
        	eng = eng.replace("'", "_");
        	kor = kor.replace("'", "_");
        	vo.setB_nm_eng(eng);
        	vo.setB_nm_kor(kor);
        	
        }
        System.out.println("list size : "+list.size());
        
        for(CrawlerBrandVO vo : list) {
        	System.out.println(vo.getB_nm_eng());
        	System.out.println(vo.getB_nm_kor());
        }
        
        return list;
    }
 
    public static List<CrawlerPerfumeVO> getPerfume(List<CrawlerPerfumeVO> list, String str) {
        	String url = str;
            String selImg = ".box .prdimg img"; // 이미지 주소
            String selBrand = ".box .info .brand a"; // 브랜드
            String selNm = ".box .info .name a"; // 이름과 사이즈 값이 둘다 들어있음 분리해야함
            String selPrice = ".box .info .price .consumer"; // 가격 (, / 원)빼줘야함
            Document doc = null;    
            
            try {
                doc = Jsoup.connect(url).get();
            } catch (IOException e) {
                System.out.println(e.getMessage());
            }
            
            Elements selImgEle = doc.select(selImg);
            Elements selBrandEle = doc.select(selBrand);
            Elements selNmEle = doc.select(selNm); // 이름과 사이즈 값이 둘다 들어있음 분리해야함
            Elements selPriceEle = doc.select(selPrice);
            
            for(int i=0; i<selNmEle.size(); i++) {
            	CrawlerPerfumeVO vo = new CrawlerPerfumeVO();
            	
            	String img = selImgEle.get(i).attr("src");
            	String brand = selBrandEle.get(i).text();
            	String nm = selNmEle.get(i).text();
            	
            	if(nm.contains("ml")) {
            		System.out.println("ml 있음!");
            		if(
            			nm.contains("세트") || nm.contains("택1") || nm.contains("로션") || nm.contains("샴푸")
                		|| nm.contains("토너") || nm.contains("타월") || nm.contains("랜덤") || nm.contains("메세지창")
                		|| nm.contains("틴트")|| nm.contains("+")|| nm.contains("X")|| nm.contains("x")
                		|| nm.contains("세럼")|| nm.contains("g")|| nm.contains("미스트")|| nm.contains("크림")
                		|| nm.contains("쿠션")|| nm.contains("젤")|| nm.contains("립스틱")|| nm.contains("파운데이션")
                		|| nm.contains("콤플렉스")|| nm.contains("메이크업")|| nm.contains("마스크")|| nm.contains("누드")
                		|| nm.contains("클렌징")|| nm.contains("커버")|| nm.contains("트리트먼트")|| nm.contains("리피니셔")
                		|| nm.contains("EDP100")|| nm.contains("네일")|| nm.contains("리무버")|| nm.contains("호")
                		|| nm.contains("글로우")|| nm.contains("컨실러")|| nm.contains("글로시")|| nm.contains("2.5"))
            		{continue;}
                    	
                	String beforeStr = nm.substring(0, nm.lastIndexOf("ml"));
            		int LastSpaceIdx = beforeStr.lastIndexOf(" ");
            		String ml = beforeStr.substring(LastSpaceIdx).trim(); // 용량 가져오기
            		
            		beforeStr = beforeStr.substring(0, LastSpaceIdx); // 용량 전 문자 가져오기
            		
            		String afterStr = nm.substring(nm.lastIndexOf("ml")+2, nm.length()); // 용량 뒤 문자 가져오기 
            		
            		String perfumeNm = beforeStr.concat(afterStr); // 문자 합치기 (향수 이름 완성)
                	
                	
                	int mLiter = Integer.parseInt(ml);
                	 
                	String strPrice = selPriceEle.get(i).text();
                	strPrice = strPrice.replace(",", "");
                	strPrice = strPrice.replace("원", "");
                	int price = Integer.parseInt(strPrice);
                	
                	vo.setP_pic(img);
                	vo.setP_brand_nm(brand);
                	vo.setP_nm(perfumeNm);
                	vo.setP_size(mLiter);
                	vo.setP_price(price);
                	
                	list.add(vo);
            	} else {
                	System.out.println("ml 없음!");
                	continue;
                }
            	
            }
            
            System.out.println("list size : " + list.size());
            
            for(CrawlerPerfumeVO vo : list) {
            	System.out.println(vo.getP_pic());
            	System.out.println(vo.getP_brand_nm());
            	System.out.println(vo.getP_nm());
            	System.out.println(vo.getP_size());
            	System.out.println(vo.getP_price());
            }
        
    	
        
        return list;
    }
    
}
