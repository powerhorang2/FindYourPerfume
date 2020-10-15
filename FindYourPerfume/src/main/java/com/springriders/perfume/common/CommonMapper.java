package com.springriders.perfume.common;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springriders.perfume.common.model.BrandCodeVO;
import com.springriders.perfume.common.model.NoteCodeVO;
import com.springriders.perfume.common.model.PerfumeVO;

@Mapper
public interface CommonMapper {
	List<BrandCodeVO> selBrandCodeList(BrandCodeVO p);
	List<NoteCodeVO> selNoteCodeList(NoteCodeVO p); 
	PerfumeVO selPerfumePk(PerfumeVO vo);
	
	int insPerfume(PerfumeVO vo);
	int insPerfumeNote(NoteCodeVO vo);
	
}

