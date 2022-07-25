package com.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.BoardVO;
import com.demo.domain.CategoryVO;
import com.demo.dto.Criteria;
import com.demo.dto.PageDTO;
import com.demo.service.AdBoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/board/*")
public class AdBoardController {

	@Autowired
	private AdBoardService adBoardService;
	
	@GetMapping("/boardInsert")
	public void boardInsert(Model model) {
		
		log.info("insert");
		
		model.addAttribute("cateList", adBoardService.getCateList());
	}
	
	//2차 카테고리 정보 불러오기. @PathVariable : 경로주소의 일부분을 파라미터로 참조시 사용
	@ResponseBody
	@GetMapping("/subCategoryList/{categoryCode}") // /subCategoryList?category=1
	public ResponseEntity<List<CategoryVO>> subCategoryList(@PathVariable("categoryCode") Integer categoryCode){
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(adBoardService.getsubCateList(categoryCode), HttpStatus.OK);
		
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
	public String boardInsert(BoardVO vo, RedirectAttributes rttr) {
		
		adBoardService.boardInsert(vo);
		
		return "redirect:/admin/board/boardList";
	}
	


	//상품목록:페이징,검색추가
	@GetMapping("/boardList")
	public void boardList(CategoryVO cat_c, @ModelAttribute("cri") Criteria cri, Model model) {
		
		// 1차 카테고리 정보 받아오기
		model.addAttribute("cateList", adBoardService.getCateList());
		
		model.addAttribute("cat_name", adBoardService.getCate_name(cat_c));
		
		List<BoardVO> boardList = adBoardService.getBoardList(cri);
		
		// 페이징쿼리에 의한 상품목록
		model.addAttribute("boardList", boardList);
		
		// [prev] 1  2  3  4  5  [next]
		int totalCount = adBoardService.getBoardTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
	}
	
	
	// 상품목록에서 수정폼
	@GetMapping(value= {"/boardModify", "/boardCheck"})
	public void boardModify(@RequestParam("boa_num") Integer boa_num, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("상품코드 : " + boa_num);
		log.info("페이지관련코드 : " + cri);
		
		// 1차 카테고리 선택
		model.addAttribute("cateList", adBoardService.getCateList());
		
		// 상품정보 - 1차카테고리를 참조한 정보 들어있음
		BoardVO vo = adBoardService.getBoardboa_num(boa_num);

		model.addAttribute("boardVO", vo);
		
		// 상품정보에서 1차카테고리 코드를 참조해서 2차카테고리 가져오기.
		Integer cat_p = vo.getCat_p();
		// 1차를 부모로 하는 2차 카테고리 정보
		model.addAttribute("subCateList", adBoardService.getsubCateList(cat_p));
		
	}

	
	// 상품수정 업데이트
	@PostMapping("/boardModify")
	public String boardModify(BoardVO vo, Criteria cri, RedirectAttributes rttr) {
		
		log.info("상품 수정 정보 : " + vo);
		
	
		// 2) 상품정보 수정. 업데이트
		adBoardService.boardModify(vo);
		
		return "redirect:/admin/board/boardList" + cri.getListLink();
	}
	
	
	// 상품삭제
	@GetMapping("/boardDelete") // 상품코드, 페이지 및 검색 파라미터, 날짜폴더, 파일이름
	public String productDelete(@RequestParam("boa_num") Integer boa_num, @ModelAttribute("cri") Criteria cri) {
		
		adBoardService.boardDelete(boa_num);
		
		return "redirect:/admin/board/boardList" + cri.getListLink();
	}
}
