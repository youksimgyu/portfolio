package com.demo.mapper;

import java.util.List;

import com.demo.domain.ReplyVO;

public interface ReplyMapper {

	// 댓글 넣기
	void replyInsert(ReplyVO vo);
	
	// 댓글 가져오기 리스트
	List<ReplyVO> replyList(Integer boa_num);
	
}
