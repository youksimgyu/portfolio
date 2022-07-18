package com.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.demo.domain.CategoryVO;
import com.demo.service.ProductService;

import lombok.extern.log4j.Log4j;

//관리자 - 상풍관리기능

@Controller
@Log4j
@RequestMapping("/admin/product/*")
public class AdProductController {

	// name이 bean의 id와 같아야 함
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private ProductService proService;
	
	// 상품등록 폼. 1차 카테고리 정보
	@GetMapping("/productInsert")
	public void productInsert(Model model) {
		
		model.addAttribute("cateList", proService.getCateList());
		
	}
	
	//2차 카테고리 정보 불러오기. @PathVariable : 경로주소의 일부분을 파라미터로 참조시 사용
	@ResponseBody
	@GetMapping("/subCategoryList/{categoryCode}") // /subCategoryList?category=1
	public ResponseEntity<List<CategoryVO>> subCategoryList(@PathVariable("categoryCode") Integer categoryCode){
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(proService.getsubCateList(categoryCode), HttpStatus.OK);
		
		return entity;
	}
	
	//CKEditor 웹 에디터를 통한 이미지 업로드 작업(상세설명에서 사용하는 설명이미지 파일)
	// 이미지 파일 선택하는 창에서 <input name="upload">로 확인됨.
	@PostMapping("/imageUpload")
	public void imageUpload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		
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
			String uploadPath = "C:\\Dev\\upload\\ckeditor\\";
			
			log.info("톰캣 물리적 경로 : " + uploadPath);
			
			uploadPath = uploadPath + fileName;
			
			out = new FileOutputStream(new File(uploadPath)); // 파일입출력스트림 객체생성(실제폴더에 파일생성됨)
			out.write(bytes); // 출력스트림에 업로드된 파일을 가르키는 바이트배열을 쓴다. 업로드된 파일크기
			
			// CKEditor에게 보낼 파일정보작업
			
			printWriter = res.getWriter();
			
			// 클라이언트에서 요청할 이미지 주소정보
			String fileUrl = "/upload/" + fileName;
			
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
	
	
}
