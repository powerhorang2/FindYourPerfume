package com.springriders.perfume.user;

import org.apache.ibatis.annotations.Mapper;

import com.springriders.perfume.user.model.UserPARAM;
import com.springriders.perfume.user.model.UserVO;

@Mapper
public interface UserMapper {

	int insUser(UserPARAM param);
	
	UserVO selUser(UserVO param);


}