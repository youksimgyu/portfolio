package com.demo.service;

import java.util.List;

import com.demo.domain.RecommendVO;
import com.demo.domain.Reply_RecommendVO;
import com.demo.dto.Criteria;

public interface RecommendService {
	
	RecommendVO getRecommend(Integer boa_num);
	
	// type=1일떄 up
	void insert1(RecommendVO vo);
	
	// type=1일떄 down
	void insert2(RecommendVO vo);

	List<RecommendVO> select(Criteria cri);
	
	List<RecommendVO> subselect(Integer cat_c, Criteria cri);
	
	RecommendVO getrec_id(RecommendVO vo);
	
	// 이 아래로는 댓글 추천기능
	// 댓글 추천 여부
	Reply_RecommendVO getrep_id(Reply_RecommendVO vo);
	
	// type=1일떄 up
	void insert3(Reply_RecommendVO vo);
	
	// type=1일떄 down
	void insert4(Reply_RecommendVO vo);
	
	// 댓글 개수 추출
	Reply_RecommendVO getReply_Recommend(Integer rep_num);
	
	List<Reply_RecommendVO> Replyselect(Integer boa_num);
}
