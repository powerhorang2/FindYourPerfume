package com.springriders.perfume.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springriders.perfume.user.model.UserDMI;
import com.springriders.perfume.user.model.UserPARAM;
import com.springriders.perfume.user.model.UserVO;

@Mapper
public interface UserMapper {

	int insUser(UserPARAM param);
	
	UserVO selUser(UserVO param);
	List<UserDMI> selFavoriteList(UserPARAM param);

	int uptUser(UserPARAM param);

}