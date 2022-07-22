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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.CategoryVO;
import com.demo.domain.ProductVO;
import com.demo.dto.Criteria;
import com.demo.dto.PageDTO;
import com.demo.service.ProductService;
import com.demo.util.UploadFileUtils;

import lombok.extern.log4j.Log4j;

//관리자 - 상풍관리기능

@Controller
@Log4j
@RequestMapping("/admin/product/*")
public class AdProductController {

	// name이 servlet-context의  bean id와 같아야 함
	@Resource(name = "uploadPath")
	private String uploadPath; // "C:/Dev/upload"
	
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
	
	
	
	
	//상품저장
	@PostMapping("/productInsert")
	public String productInsert(ProductVO vo, RedirectAttributes rttr) {
		
		log.info("상품등록정보 : " + vo);
		
		// 파일업로드 작업
		// vo.getPdt_img() null 상태
		// 이미지 파일명이 저장될 pdt_img 필드에 업로드한 후 실제 파일명을 저장한다
		String uploadDateFolderPath = UploadFileUtils.getFolder();
		vo.setPdt_img_folder(uploadDateFolderPath); // 날짜폴더명
		vo.setPdt_img(UploadFileUtils.uploadFile(uploadPath, uploadDateFolderPath, vo.getUploadFile())); // 실제 업로드한 파일명
		
		
		// 상품정보저장
		proService.productInsert(vo);
		
		return "redirect:/admin/product/productList";
	}
	
	
	
	//상품목록:페이징,검색추가
	@GetMapping("/productList")
	public void productList(@ModelAttribute("cri") Criteria cri, Model model) {
		
		List<ProductVO> productList = proService.getProductList(cri);
		
		// 날짜폴더명의 \를 /로 변환하는 작업
		for(int i=0; i<productList.size(); i++) {
			String pdt_img_folder = productList.get(i).getPdt_img_folder().replace("\\", "/");
			productList.get(i).setPdt_img_folder(pdt_img_folder);
		}
		
		
		// 페이징쿼리에 의한 상품목록
		model.addAttribute("productList", productList);
		
		// [prev] 1  2  3  4  5  [next]
		int totalCount = proService.getProductTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
	}
	
	// 상품목록에서 이미지 보여주기
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName){
		
//		log.info("폴더이름: " + folderName);
//		log.info("파일이름: " + fileName);
		
		// 이미지를 바이트배열로 읽어오는 작업
		return UploadFileUtils.getFile(uploadPath, folderName + "\\" + fileName);
	}
	
	
	// 상품목록에서 수정폼
	@GetMapping(value= {"/productModify", "/productCheck"})
	public void productModify(@RequestParam("pdt_num") Integer pdt_num, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("상품코드 : " + pdt_num);
		log.info("페이지관련코드 : " + cri);
		
		// 1차 카테고리 선택
		model.addAttribute("cateList", proService.getCateList());
		
		// 상품정보 - 1차카테고리를 참조한 정보 들어있음
		ProductVO vo = proService.getProductpdt_num(pdt_num);
		// modify로 옮겨갈때 폴더 이름 변경
		vo.setPdt_img_folder(vo.getPdt_img_folder().replace("\\", "/"));
		model.addAttribute("productVO", vo);
		
		// 상품정보에서 1차카테고리 코드를 참조해서 2차카테고리 가져오기.
		Integer cg_num_1 = vo.getCg_num_1();
		// 1차를 부모로 하는 2차 카테고리 정보
		model.addAttribute("subCateList", proService.getsubCateList(cg_num_1));
		
	}
	
	
	// 상품수정 업데이트
	@PostMapping("/productModify")
	public String productModify(ProductVO vo, Criteria cri, RedirectAttributes rttr) {
		
		log.info("상품 수정 정보 : " + vo);
		
		// 상품이미지 변경문제.
		// 파일업로드 변경 유뮤 체크
		if(!vo.getUploadFile().isEmpty()) { // 파일이 있다는 뜻
	
			// 1) 수정전 이미지 파일삭제 (날짜폴더명, 변경전 구 이미지파일명)
			// C:/Dev/upload 2022\07\21\\s_d536cfd6-fb00-4276-8603-1e1cb433f9d9_화면 캡처 2022-07-18 092024.png
			UploadFileUtils.deleteFile(uploadPath, vo.getPdt_img_folder() + "\\s_" + vo.getPdt_img());
			
//			C:\\Dev\\upload, 2022\07\21\\s_ac735c99-18ab-4f26-9883-a70c6d8f2982_화면 캡처 2022-07-18 092024.png
			
			log.info("uploadPath : " + uploadPath);
			log.info("삭제폴더주소 : " + vo.getPdt_img_folder());
			log.info("삭제이미지 이름 : " + vo.getPdt_img());
			
			// 파일수정 업로드
			String uploadDateFolderPath = UploadFileUtils.getFolder();
			vo.setPdt_img_folder(uploadDateFolderPath);
			vo.setPdt_img(UploadFileUtils.uploadFile(uploadPath, uploadDateFolderPath, vo.getUploadFile()));
			
		}
		
	
		// 2) 상품정보 수정. 업데이트
		proService.productModify(vo);
		
		return "redirect:/admin/product/productList" + cri.getListLink();
	}
	
	
	// 상품삭제
	@GetMapping("/productDelete") // 상품코드, 페이지 및 검색 파라미터, 날짜폴더, 파일이름
	public String productDelete(@RequestParam("pdt_num") Integer pdt_num, @ModelAttribute("cri") Criteria cri, String pdt_img_folder, String pdt_img) {
		
		// 이미지 파일삭제
		UploadFileUtils.deleteFile(uploadPath, pdt_img_folder + "\\s_" + pdt_img);
		
		proService.productDelete(pdt_num);
		
		return "redirect:/admin/product/productList" + cri.getListLink();
	}
	
	

}
