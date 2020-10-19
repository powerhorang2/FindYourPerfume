package com.springriders.perfume.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springriders.perfume.common.model.NoteCodeVO;
import com.springriders.perfume.common.model.PerfumeDomain;
import com.springriders.perfume.common.model.PerfumePARAM;

@Service
public class CommonService {

	@Autowired
	private CommonMapper mapper;

	public List<PerfumeDomain> selPerfumeList(PerfumePARAM param) {
		return mapper.selPerfumeList(param);
	}
	
	public List<NoteCodeVO> selPerfumeNoteList(PerfumePARAM param) {
		return mapper.selPerfumeNoteList(param);
	}

	public PerfumeDomain selPerfume(PerfumePARAM param) {
		return mapper.selPerfume(param);
	}
	

}
