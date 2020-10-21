package com.springriders.perfume.cmt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springriders.perfume.cmt.model.CmtDMI;
import com.springriders.perfume.cmt.model.CmtPARAM;
import com.springriders.perfume.common.model.PerfumePARAM;
@Service
public class CmtService {

	@Autowired
	private CmtMapper mapper;
	
	public int insCmt(CmtPARAM param) {
		return mapper.insCmt(param);
	}

	public List<CmtDMI> selCmtList(PerfumePARAM param) {
		return mapper.selCmtList(param);
	}

}
