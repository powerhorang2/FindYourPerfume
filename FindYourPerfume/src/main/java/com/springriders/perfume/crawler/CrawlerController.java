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

/**
 * Handles requests for the application home page.
 */
@Controller
public class CrawlerController {
	
	@Autowired
	private CrawlerService service;
	
	@RequestMapping("/test")
	public String test(Model model) {
		model.addAttribute("data", service.selHome());
		return "test";
	}
	
	@RequestMapping("/crawler") // 크롤링
	public String crawler(Model model) {
//		List<CrawlerBrandVO> brnadList = new ArrayList();
//		brnadList = Crawler.getBrand(brnadList);
//		int result = service.insBrands(brnadList); // 브랜드 크롤링
		List<CrawlerPerfumeVO> list = new ArrayList();
		String[] urlArr = {};
		for(int i=0; i<urlArr.length; i++) {
			list = Crawler.getPerfume(list, urlArr[i]);
			service.insPerfumes(list);
		}
		
		return "crawler";
	}
	
	@RequestMapping("/insRandomNote") // 노트 랜덤으로 insert
	public String insRandomNote(Model model) {
		List<CrawlerPerfumeVO> list = new ArrayList();
		list = service.selEmptyNotePerfumeList();
		int result = service.insRandomNote(list);
		model.addAttribute("data", result);
		return "insRandomNote";
	}
}

