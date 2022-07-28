package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.CategoryVO;
import com.demo.mapper.UserBoardMapper;

@Service
public class UserBoardServiceImpl implements UserBoardService {

	@Autowired
	private UserBoardMapper userBoardMapper;
	
	@Override
	public List<CategoryVO> getCategoryList() {
		// TODO Auto-generated method stub
		return userBoardMapper.getCategoryList();
	}

}
