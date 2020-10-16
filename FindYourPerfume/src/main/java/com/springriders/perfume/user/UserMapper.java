package com.springriders.perfume.user;

import org.apache.ibatis.annotations.Mapper;

import com.springriders.perfume.user.model.UserPARAM;
import com.springriders.perfume.user.model.UserVO;

@Mapper
public interface UserMapper {

	int insUser(UserPARAM param);
	int insUserNote(UserPARAM param);
	
	UserPARAM selUserPk(UserVO param);
	UserVO selUser(UserVO param);
	
	





}