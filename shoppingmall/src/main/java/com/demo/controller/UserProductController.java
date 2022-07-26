package com.demo.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.domain.CategoryVO;
import com.demo.domain.ProductVO;
import com.demo.dto.Criteria;
import com.demo.dto.PageDTO;
import com.demo.service.UserProductService;
import com.demo.util.UploadFileUtils;

import lombok.extern.log4j.Log4j;

@RequestMapping("/user/product/*")
@Controller
@Log4j
public class UserProductController {

	// 1차 카테고리 정보를 불러오는 작업은 생략.
	// 그부분을 @ControllerAdvice 어노테이션을 적용된 클래스가 카테고리 Model작업을 함
	
	@Autowired
	private UserProductService proService;
	
	// name이 servlet-context의  bean id와 같아야 함
	@Resource(name = "uploadPath")
	private String uploadPath; // "C:/Dev/upload"
	
	// 2차 카테고리 정보. ajax 사용
	@GetMapping("/subCategoryList/{cg_code_c}")
	@ResponseBody
	public ResponseEntity<List<CategoryVO>> subCategoryList(@PathVariable("cg_code_c") Integer cg_code_c) {
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(proService.getSubCagegoryList(cg_code_c), HttpStatus.OK);
		
		return entity;
		
	}
	
	//상품리스트. 페이징기능추가.(검색기능 제외)
	@GetMapping("/productList/{cg_code_c}")
	public String productList(@PathVariable("cg_code_c") Integer cg_code_c, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("2차 카테고리 코드 : " + cg_code_c);
		
		List<ProductVO> productList = proService.getProductListbysubCategory(cg_code_c, cri);
		
		cri.setAmount(9);
		
		// 날짜폴더명의 \를 /로 변환하는 작업
		for(int i=0; i<productList.size(); i++) {
			String pdt_img_folder = productList.get(i).getPdt_img_folder().replace("\\", "/");
			productList.get(i).setPdt_img_folder(pdt_img_folder);
		}
		
		
		// 페이징쿼리에 의한 상품목록
		model.addAttribute("productList", productList);
		
		// [prev] 1  2  3  4  5  [next]
		int totalCount = proService.getProductCountbysubCategory(cg_code_c, cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
		return "/user/product/productList";
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
	
	
	// 모달에서 사용할 상품 상세정보
	@ResponseBody
	@GetMapping("/productDetail/{pdt_num}")
	public ResponseEntity<ProductVO> productDetail(@PathVariable("pdt_num") Integer pdt_num) {
		ResponseEntity<ProductVO> entity = null;
		
		ProductVO vo = proService.getProductpdt_num(pdt_num);
		vo.setPdt_img_folder(vo.getPdt_img_folder().replace("\\", "/"));
		
		entity = new ResponseEntity<ProductVO>(vo, HttpStatus.OK);
		
		return entity;
	}
}
