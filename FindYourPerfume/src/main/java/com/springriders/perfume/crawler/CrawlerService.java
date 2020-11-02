package com.springriders.perfume.crawler;

import java.awt.print.Printable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springriders.perfume.crawler.model.CrawlerBrandVO;
import com.springriders.perfume.crawler.model.CrawlerPerfumeVO;
import com.springriders.perfume.crawler.model.CrawlerVO;

@Service
public class CrawlerService {
	
	@Autowired
	private CrawlerMapper mapper;
	
	public List<CrawlerVO> selHome() {
		return mapper.selTest();
	}

	public CrawlerPerfumeVO selDetail() {
		return mapper.selDetail();
	}

	public int insBrands(List<CrawlerBrandVO> list) {
		return mapper.insBrands(list);
	}

	public void insPerfumes(List<CrawlerPerfumeVO> list) {
		for(CrawlerPerfumeVO vo : list) {
			try {
				mapper.insPerfumes(vo);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	
	public List<CrawlerPerfumeVO> selEmptyNotePerfumeList() {
		return mapper.selEmptyNotePerfumeList();
	}

	public int insRandomNote(List<CrawlerPerfumeVO> list) {
		int result = 0;
		int b[] = new int[4]; // 난수 담을 배열 생성
		
		for(int i=0; i<list.size(); i++) { // i_p의 개수 만큼 반복
			
			for(int k=0; k<4; k++) {	// 중복없는 난수 생성 후 배열에 담기
	            b[k]=(int)(Math.random()*32 + 1);
	            for(int j=0; j<k;j++) {
	                if(b[k]==b[j]) {k--; break;}
	            }    
	         }
			
			for(int z=0; z<4; z++) { // 배열에 담은 난수를 이용 노트 값 넣기
				list.get(i).setNt_d_c(b[z]);
				result += mapper.insRandomNote(list.get(i));
			}
			
			for(int l=0; l<4; l++) { // 배열 초기화
				b[l] = 0;
			}
		
		}
		return result;
	}

}
