package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.AdBoardVO;
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
	public void boardInsert(AdBoardVO vo) {
		// TODO Auto-generated method stub
		adBoardMapper.boardInsert(vo);
	}

	@Override
	public List<AdBoardVO> getBoardList(Criteria cri) {
		// TODO Auto-generated method stub
		return adBoardMapper.getBoardList(cri);
	}

	@Override
	public int getBoardTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return adBoardMapper.getBoardTotalCount(cri);
	}

	@Override
	public AdBoardVO getBoardad_boa_num(Integer ad_boa_num) {
		// TODO Auto-generated method stub
		return adBoardMapper.getBoardad_boa_num(ad_boa_num);
	}

	@Override
	public void boardModify(AdBoardVO vo) {
		// TODO Auto-generated method stub
		adBoardMapper.boardModify(vo);
	}

	@Override
	public void boardDelete(Integer ad_boa_num) {
		// TODO Auto-generated method stub
		adBoardMapper.boardDelete(ad_boa_num);
	}

}
