package com.springriders.perfume.cmt;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springriders.perfume.cmt.model.CmtDMI;
import com.springriders.perfume.cmt.model.CmtPARAM;
import com.springriders.perfume.common.model.PerfumePARAM;

@Mapper
public interface CmtMapper {

	List<CmtDMI> selCmtList(PerfumePARAM param);

	int InsCmt(CmtPARAM param);

	int DelCmt(CmtPARAM param);

	int UpdCmt(CmtPARAM param);
	

}
