package com.springriders.perfume.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springriders.perfume.common.model.PerfumeDMI;
import com.springriders.perfume.user.model.UserPARAM;
import com.springriders.perfume.user.model.UserVO;

@Mapper
public interface UserMapper {

	int insUser(UserPARAM param);
	int insUserNote(UserPARAM param);
	
	List<PerfumeDMI> selFavoriteList(UserPARAM param);

	UserPARAM selUserPk(UserVO param);
	UserVO selUser(UserVO param);

	int uptUser(UserVO vo);

}