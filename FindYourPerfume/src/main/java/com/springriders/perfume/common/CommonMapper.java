package com.springriders.perfume.common;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springriders.perfume.common.model.BrandCodeVO;
import com.springriders.perfume.common.model.NoteCodeVO;
import com.springriders.perfume.common.model.PerfumeDMI;
import com.springriders.perfume.common.model.PerfumePARAM;
import com.springriders.perfume.common.model.PerfumeVO;
import com.springriders.perfume.crawler.model.CrawlerBrandVO;
import com.springriders.perfume.crawler.model.CrawlerPerfumeVO;

@Mapper
public interface CommonMapper {
	List<BrandCodeVO> selBrandCodeList(BrandCodeVO p);
	List<NoteCodeVO> selNoteCodeList(NoteCodeVO p); 

	List<NoteCodeVO> selUserNoteList(PerfumePARAM param);
	List<PerfumeDMI> selTopPerfumeList(PerfumePARAM param);
	List<PerfumeDMI> selRecPerfumeList(NoteCodeVO vo);

	List<PerfumeDMI> selPerfumeList(PerfumePARAM param);
	List<NoteCodeVO> selPerfumeNoteList(PerfumePARAM param);
	List<PerfumeDMI> selPerfumeChoice(PerfumeDMI vo);
	List<PerfumeDMI> selBrandAlphabet(PerfumeDMI dm);
	List<PerfumeDMI> selBrandNm(PerfumePARAM param);
	
	PerfumeVO selPerfumePk(PerfumeVO vo);
	PerfumeDMI selPerfume(PerfumePARAM param);
	
	int insPerfume(PerfumeVO vo);
	int insPerfumeNote(NoteCodeVO vo);
	
	int delPerfume(PerfumePARAM param);
	

}

