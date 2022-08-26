package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.ReplyListVO;
import com.demo.domain.ReplyVO;
import com.demo.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;
	
	@Override
	public void replyInsert(ReplyVO vo) {
		// TODO Auto-generated method stub
		replyMapper.replyInsert(vo);
	}

	@Override
	public List<ReplyListVO> replyList(Integer boa_num) {
		// TODO Auto-generated method stub
		return replyMapper.replyList(boa_num);
	}

}
