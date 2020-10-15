package com.springriders.perfume.crawler;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springriders.perfume.crawler.model.CrawlerBrandVO;
import com.springriders.perfume.crawler.model.CrawlerPerfumeVO;
import com.springriders.perfume.crawler.model.CrawlerVO;

@Mapper
public interface CrawlerMapper {
	List<CrawlerVO> selTest();

	CrawlerPerfumeVO selDetail();

	int insBrands(List<CrawlerBrandVO> list);

	int insPerfumes(CrawlerPerfumeVO vo);
	
	List<CrawlerPerfumeVO> selPerfumeList();

	int insRandomNote(CrawlerPerfumeVO vo);
	
}