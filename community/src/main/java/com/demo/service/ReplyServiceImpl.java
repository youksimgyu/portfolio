package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
