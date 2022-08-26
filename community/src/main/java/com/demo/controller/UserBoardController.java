package com.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.BoardNameVO;
import com.demo.domain.BoardVO;
import com.demo.domain.CategoryVO;
import com.demo.domain.MemberVO;
import com.demo.domain.RecommendVO;
import com.demo.domain.ReplyListVO;
import com.demo.dto.Criteria;
import com.demo.dto.PageDTO;
import com.demo.service.RecommendService;
import com.demo.service.ReplyService;
import com.demo.service.UserBoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/board/*")
public class UserBoardController {
	
	@Autowired
	private UserBoardService userBoardService;

	@Autowired
	private RecommendService recomendService;
	
	@Autowired
	private ReplyService replyService;
	
	// 1차 카테고리 기준 전체 글
	@GetMapping("/boardList/{cat_c}/{cat_name}")
	public String boardList(@PathVariable("cat_c") Integer cat_c, @PathVariable("cat_name") String cat_name, @ModelAttribute("cri") Criteria cri, Model model) {
		
		// 1차 카테고리에 해당되는 전체 글 가져오기
		List<BoardNameVO> getMainList = userBoardService.getMainBoardList(cat_c, cri);
		model.addAttribute("getMainList", getMainList);
		
		// 2차 카테고리 추출
		List<CategoryVO> getSubList = userBoardService.getSubCategoryList(cat_c);
		model.addAttribute("getSubList", getSubList);
		
		List<RecommendVO> getRecommendList = recomendService.subselect(cat_c, cri);
		model.addAttribute("getRecommendList", getRecommendList);
		
		// [prev] 1  2  3  4  5  [next]
		int totalCount = userBoardService.getBoardTotalCount(cat_c, cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
		return "/user/board/boardList";
	}
	
	
	// 글 가져오기
	@GetMapping("/boardGet")
	public void boardGet(Integer boa_num, Model model, HttpSession session) {
		
		// 게시물 조회수 올리기
		userBoardService.boa_hit(boa_num);
		
		// 수정/삭제버튼이 로그인시 글작성자랑 같으면 표시하기
		if(session.getAttribute("loginStatus") != null) {
			String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
			model.addAttribute("mem_id", mem_id);
		}

		// 글 가져오기
		BoardNameVO boardGet = userBoardService.boardGet(boa_num);
		model.addAttribute("boardGet", boardGet);
		
		// 추천 데이터 가져오기
		RecommendVO rec_get = recomendService.getRecommend(boa_num);
		model.addAttribute("rec_get", rec_get);
		
		// 댓글 리스트 가져오기
		List<ReplyListVO> replyList = replyService.replyList(boa_num);
		model.addAttribute("replyList", replyList);
		
	}
	
	@GetMapping("/boardInsert")
	public void boardInsert(Model model, HttpSession session, BoardVO vo) {
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		model.addAttribute("mem_id", mem_id);
		
		model.addAttribute("cateList", userBoardService.getCategoryList());
		
	}
	
	
	//2차 카테고리 정보 불러오기. @PathVariable : 경로주소의 일부분을 파라미터로 참조시 사용
	@ResponseBody
	@GetMapping("/subCategoryList/{cat_c}") // /subCategoryList?category=1
	public ResponseEntity<List<CategoryVO>> subCategoryList(@PathVariable("cat_c") Integer cat_c){
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(userBoardService.getSubCategoryList(cat_c), HttpStatus.OK);
		
		return entity;
	}
	
	
	//CKEditor 웹 에디터를 통한 이미지 업로드 작업(상세설명에서 사용하는 설명이미지 파일)
	// 이미지 파일 선택하는 창에서 <input name="upload">로 확인됨.
	@PostMapping("/imageUpload")
	public void imageUpload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		
		// 입출력스트림방식으로 파일 업로드 구현
		// request : 
		// response : 
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		// 클라이언트의 브라우저에게 보내는 정보
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		
		try {
			String fileName = upload.getOriginalFilename(); // 클라이언트에서 업로드한 원본파일명
			byte[] bytes = upload.getBytes(); // 업로드 파일
			
			// 서버측의 업로드 폴더 경로 설정작업. 프로젝트 내부 or 외부
			// 내부 : 톰캣이 war 파일로 리눅스서버에 배포를 할 경우, 톰캣이 재시작하면 기존 upload폴더를 삭제할 수 있다
			
			// 내부버전
			String uploadTomcatTempPath = req.getSession().getServletContext().getRealPath("/") + "resources\\upload\\";
			log.info("톰캣 물리적 경로 : " + uploadTomcatTempPath);
			
			// 외부버전
			String uploadPath = "C:\\Dev\\upload\\ckeditor\\"; // 톰캣의 server.xml에 설정정보 참고
			
			log.info("톰캣 물리적 경로 : " + uploadPath);
			
			uploadPath = uploadPath + fileName;
			
			out = new FileOutputStream(new File(uploadPath)); // 파일입출력스트림 객체생성(실제폴더에 파일생성됨)
			out.write(bytes); // 출력스트림에 업로드된 파일을 가르키는 바이트배열을 쓴다. 업로드된 파일크기
			
			// CKEditor에게 보낼 파일정보작업
			
			printWriter = res.getWriter();
			
			// 클라이언트에서 요청할 이미지 주소정보
			String fileUrl = "/upload/" + fileName; // 톰캣의 server.xml에 설정정보 참고
			
			// {"filename":"abc.gif", "uploaded":1, "url":"/upload/abc.gif"} json포맷
			printWriter.println("{\"filename\":\"" + fileName + "\", \"uploaded\":1,\"url\":\"" + fileUrl + "\"}");
			printWriter.flush(); // 전송 (return과 같은 역할: 클라이언트로 보냄)

			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(out != null) {
				try {
					out.close();
				} catch(IOException e) {
					e.printStackTrace();
				}
			}
			if(printWriter != null) {
				printWriter.close();
			}
		}
		
	}
	
	@PostMapping("/boardInsert")
	public String boardInsert(BoardVO vo, RedirectAttributes rttr, HttpSession session) {
		
		userBoardService.boardInsert(vo);
		
		return "redirect:/"; // get주소로 이동
	}
	
	
	@GetMapping("/boardModify")
	public void boardModify(Integer boa_num, Model model) {
		
		// 글 가져오기
		BoardNameVO boardGet = userBoardService.boardGet(boa_num);
		model.addAttribute("boardGet", boardGet);
		
		// 추천 데이터 가져오기
		RecommendVO rec_get = recomendService.getRecommend(boa_num);
		model.addAttribute("rec_get", rec_get);

	}
	
	@PostMapping("/boardModify")
	public String boardModify(BoardVO vo) {
		
		// 업데이트 구문  (제목, 글만)
		userBoardService.boardModify(vo);
		
		return "redirect:/user/board/boardGet?boa_num=" +vo.getBoa_num();
	}
	
	@GetMapping("/boardDelete")
	public String boardDelete(Integer boa_num) {
		
		// 글 삭제
		userBoardService.boardDelete(boa_num);
		
		return "redirect:/";
	}
}
