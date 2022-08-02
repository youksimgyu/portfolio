package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.BoardVO;
import com.demo.domain.CategoryVO;
import com.demo.dto.Criteria;
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

	@Override
	public List<BoardVO> getMainBoardList(Integer cat_c, Criteria cri) {
		// TODO Auto-generated method stub
		return userBoardMapper.getMainBoardList(cat_c, cri);
	}

	@Override
	public int getBoardTotalCount(Integer cat_c, Criteria cri) {
		// TODO Auto-generated method stub
		return userBoardMapper.getBoardTotalCount(cat_c, cri);
	}

}
