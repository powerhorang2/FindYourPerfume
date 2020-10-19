package com.springriders.perfume.common;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springriders.perfume.common.model.BrandCodeVO;
import com.springriders.perfume.common.model.NoteCodeVO;
import com.springriders.perfume.common.model.PerfumeDomain;
import com.springriders.perfume.common.model.PerfumePARAM;
import com.springriders.perfume.common.model.PerfumeVO;

@Mapper
public interface CommonMapper {
	List<BrandCodeVO> selBrandCodeList(BrandCodeVO p);
	List<NoteCodeVO> selNoteCodeList(NoteCodeVO p); 
	List<PerfumeDomain> selPerfumeList(PerfumePARAM param);
	List<NoteCodeVO> selPerfumeNoteList(PerfumePARAM param);
	
	PerfumeVO selPerfumePk(PerfumeVO vo);
	PerfumeDomain selPerfume(PerfumePARAM param);
	
	
	int insPerfume(PerfumeVO vo);
	int insPerfumeNote(NoteCodeVO vo);
	
	
	
}

