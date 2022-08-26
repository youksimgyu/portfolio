package com.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.demo.domain.AdminVO;

//클래스가 인터셉터 기능을 갖게 하려면, HandlerInterceptorAdapter 추상클래스를 상속 및 메서드 구현
//설정 : servlet-context.xml에 클래스정보를 등록해야 한다
public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean result = false;
		
		// 인증된 사용자인지 여부를 체크. 세션객체를 확인
		HttpSession session = request.getSession();
		AdminVO admin = (AdminVO) session.getAttribute("adLoginStatus");
		
		if(admin == null) { // 로그인 인증안됨
			result = false;
			
			// Ajax요청인지 아닌지 체크
			if(isAjaxRequest(request)) { // true로 넘어오면 ajax요청
				response.sendError(400); // ajax요청시 에러 400 리턴
				
			} else {
				getDestination(request); // 원래 요청한 주소 저장
				response.sendRedirect("/admin/adLogin");
			}
			
		} else { // 로그인 인증됨
			result = true;
		}
		
		return result; // true 면, 다음진행은 컨트롤러로 제어가 넘어간다
	}
	
	// ajax요청을 체크한다
	private boolean isAjaxRequest(HttpServletRequest request) {

		boolean isAjax = false;
		
		// ajax구문에서 요청시 헤더에 AJAX : "true" 를 작업해 두어야 한다
		String header = request.getHeader("AJAX");
		if("true".equals(header)) { // ajax인 경우
			isAjax = true;
		} else {
			isAjax = false;
		}
		
		return isAjax;
	}

	// 로그인 하지 않은 상태에서 웹페이지 이동중 마지막 세션을 저장해서 로그인 시 마지막세션으로 이동하게 해준다
	private void getDestination(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI(); // 브라우저에서 요청된 값의 주소. /product/cart
		String query = request.getQueryString(); // /product/cart?pdt_num=10의 주소 뒤에 있는 변수값
		
		if(query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		String destination = uri + query; // /product/cart?pdt_num10 or /product/cart
		
		if(request.getMethod().equals("GET")) {
			// 사용자가 비로그인 상태에서 요청한 원래 주소를 세션으로 저장해둔다
			request.getSession().setAttribute("dest", destination);
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

}
