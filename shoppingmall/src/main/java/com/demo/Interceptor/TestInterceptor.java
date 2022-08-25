package com.demo.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 클래스가 인터셉터 기능을 갖게 하려면, HandlerInterceptorAdapter 추상클래스를 상속 및 메서드 구현
// 설정 : servlet-context.xml에 클래스정보를 등록해야 한다
public class TestInterceptor extends HandlerInterceptorAdapter {

//	doA 주소요청 : DispatcherServlet 객체담당
//	
//	- 인터셉터가 존재 할 경우
//	preHandle -> doA주소에 매핑된 메서드 -> postHandle -> doA주소에 매핑된 메서드 리턴된 뷰(jsp) 작업 -> afterCompletion
//	
//	- 인터셉터가 존재 안할 경우
//	doA주소에 매핑된 메서드 -> doA주소에 매핑된 메서드 리턴된 뷰(jsp) 작업
	
	// 컨트롤러(메서드) 이전에 동작하는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		return super.preHandle(request, response, handler);
	}

	// 컨트롤러(메서드) 이후에 동작하는 메서드
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
