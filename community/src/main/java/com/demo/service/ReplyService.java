package com.demo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.demo.domain.ReplyListVO;
import com.demo.domain.ReplyVO;
import com.demo.dto.Criteria;

public interface ReplyService {
	
	// 댓글 넣기
	void replyInsert(ReplyVO vo);
	
	// 댓글 가져오기 리스트
	List<ReplyListVO> replyList(Integer boa_num);
	
	// 카테고리별 댓글수 리스트
	List<ReplyVO> subselect(@Param("cat_c") Integer cat_c, @Param("cri") Criteria cri);

	// 전체 댓글수 리스트
	List<ReplyVO> select(Criteria cri);

}
