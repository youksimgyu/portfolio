package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.domain.ChartVO;
import com.demo.service.ChartService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/chart/*")
public class ChartController {
	
	@Autowired
	private ChartService chartService;
	
	// 전체
	@GetMapping("/overall")
	public void overall(Model model) {
		
		// 1차 카테고리별 매출
		List<ChartVO> primary_list = chartService.primaryChart();
		
		String primaryData = "[";
		primaryData += "['1차 카테고리', '매출'],";
		
		int i = 0;
		for(ChartVO p_vo : primary_list) {
			primaryData += "['" + p_vo.getPrimary_cd() + "'," + p_vo.getSales_p() + "]";
			i++;
			
			// 마지막 테이터 처리시 콤마(,)는 추가안함
			if(i < primary_list.size()) primaryData += ",";
		}
		
		primaryData += "]";
		
		model.addAttribute("primaryData", primaryData);
		
		// 2차 카테고리별 매출
		List<ChartVO> sub_list = chartService.subChart();
		
		String subData = "[";
		subData += "['2차 카테고리', '매출'],";
		
		int j = 0;
		for(ChartVO s_vo : sub_list) {
			subData += "['" + s_vo.getSecondary_cd() + "'," + s_vo.getSales_s() + "]";
			j++;
			
			// 마지막 테이터 처리시 콤마(,)는 추가안함
			if(j < sub_list.size()) subData += ",";
		}
		
		subData += "]";
		
		model.addAttribute("subData", subData);
	}
	
}
