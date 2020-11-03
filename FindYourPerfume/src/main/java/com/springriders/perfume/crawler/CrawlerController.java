package com.springriders.perfume.crawler;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springriders.perfume.crawler.model.CrawlerBrandVO;
import com.springriders.perfume.crawler.model.CrawlerPerfumeVO;

@Controller
@RequestMapping("/crawler")
public class CrawlerController {
	
	@Autowired
	private CrawlerService service;
	
	// 브랜드 크롤링
	@RequestMapping("/brandCrawler") 
	public String brandCrawler(Model model, List<CrawlerBrandVO> brandList) {
		brandList = Crawler.getBrand(brandList);
		int result = service.insBrands(brandList);
		
		model.addAttribute("result", result);
		
		return "brandCrawler";
	}
	
	// 향수 크롤링
	@RequestMapping("/perfumeCrawler")
	public String perfumeCrawler(Model model, List<CrawlerPerfumeVO> list) {
		String[] urlArr = {};
		int result = 0;
		for(int i=0; i<urlArr.length; i++) {
			list = Crawler.getPerfume(list, urlArr[i]);
			result += service.insPerfumes(list);
		}
		
		model.addAttribute("result", result);
		
		return "perfumeCrawler";
	}
	
	// 노트 값이 없는 향수 리스트 찾기
	public List<CrawlerPerfumeVO> selEmptyNotePerfumeList() {
		return service.selEmptyNotePerfumeList();
	}
	
	// 랜덤한 값으로 향수에 노트를 추가하기
	@RequestMapping("/insRandomNote") // 노트 랜덤으로 insert
	public String insRandomNote(Model model, List<CrawlerPerfumeVO> list) {
		
		list = selEmptyNotePerfumeList();
		
		int insNoteResult = service.insRandomNote(list);
		
		model.addAttribute("emptyNotePerfume", list.size());
		model.addAttribute("insNoteResult", insNoteResult);
		
		return "insRandomNote";
	}
	
	
}

