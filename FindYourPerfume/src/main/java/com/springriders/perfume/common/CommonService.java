package com.springriders.perfume.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springriders.perfume.user.UserMapper;

@Service
public class CommonService {

	@Autowired
	private UserMapper mapper;

}
