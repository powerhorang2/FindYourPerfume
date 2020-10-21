package com.springriders.perfume.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springriders.perfume.common.model.BrandCodeVO;
import com.springriders.perfume.common.model.NoteCodeVO;
import com.springriders.perfume.common.model.PerfumeDMI;
import com.springriders.perfume.common.model.PerfumePARAM;
import com.springriders.perfume.crawler.model.CrawlerBrandVO;
import com.springriders.perfume.crawler.model.CrawlerPerfumeVO;

@Service
public class CommonService {

	@Autowired
	private CommonMapper mapper;

	public List<PerfumeDMI> selPerfumeList(PerfumePARAM param) {
		return mapper.selPerfumeList(param);
	}
	
	public List<NoteCodeVO> selPerfumeNoteList(PerfumePARAM param) {
		return mapper.selPerfumeNoteList(param);
	}

	public PerfumeDMI selPerfume(PerfumePARAM param) {
		return mapper.selPerfume(param);
	}

	public List<PerfumeDMI> selBrandAlphabet(PerfumeDMI dm) {
		return mapper.selBrandAlphabet(dm);
	}

//	public List<PerfumeDMI> selBrandNm(PerfumePARAM param) {
//
//		return mapper.selBrandNm(param);
//	}




}
