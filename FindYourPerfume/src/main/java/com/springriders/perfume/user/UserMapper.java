package com.springriders.perfume.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springriders.perfume.common.model.PerfumeDMI;
import com.springriders.perfume.user.model.UserDMI;
import com.springriders.perfume.common.model.PerfumePARAM;
import com.springriders.perfume.user.model.UserPARAM;
import com.springriders.perfume.user.model.UserVO;

@Mapper
public interface UserMapper {

	int insUser(UserPARAM param);
	int insUserNote(UserPARAM param);
	int changeAuth(UserPARAM param);
	
	List<PerfumeDMI> selFavoriteList(UserPARAM param);
	List<PerfumeDMI> selFavNotes(UserPARAM p);

	UserPARAM selUserPk(UserVO param);
	UserDMI selUser(UserPARAM param);
	List<UserVO> selUserList(UserVO param);
	List<UserVO> selAdminList(UserVO param);

	int uptUser(UserVO vo);

	int delUserFavorite(UserPARAM param);
	int insUserFavorite(UserPARAM param);

	int ajaxAddFavNotes(PerfumePARAM param);
	int ajaxDelFavNotes(PerfumePARAM param);

}