package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.BoardVO;
import com.demo.domain.CategoryVO;
import com.demo.dto.Criteria;
import com.demo.mapper.AdBoardMapper;

@Service
public class AdBoardServiceImpl implements AdBoardService {

	@Autowired
	private AdBoardMapper adBoardMapper;
	

	@Override
	public List<CategoryVO> getCateList() {
		// TODO Auto-generated method stub
		return adBoardMapper.getCateList();
	}

	@Override
	public List<CategoryVO> getsubCateList(Integer categoryCode) {
		// TODO Auto-generated method stub
		return adBoardMapper.getsubCateList(categoryCode);
	}
	
	@Override
	public void boardInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		adBoardMapper.boardInsert(vo);
	}

	@Override
	public List<BoardVO> getBoardList(Criteria cri) {
		// TODO Auto-generated method stub
		return adBoardMapper.getBoardList(cri);
	}

	@Override
	public int getBoardTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return adBoardMapper.getBoardTotalCount(cri);
	}

	@Override
	public BoardVO getBoardboa_num(Integer boa_num) {
		// TODO Auto-generated method stub
		return adBoardMapper.getBoardboa_num(boa_num);
	}

	@Override
	public void boardModify(BoardVO vo) {
		// TODO Auto-generated method stub
		adBoardMapper.boardModify(vo);
	}

	@Override
	public void boardDelete(Integer boa_num) {
		// TODO Auto-generated method stub
		adBoardMapper.boardDelete(boa_num);
	}

	@Override
	public BoardVO getCate_name(CategoryVO cat_c) {
		// TODO Auto-generated method stub
		return adBoardMapper.getCate_name(cat_c);
	}

}
