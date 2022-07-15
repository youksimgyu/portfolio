package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.AdminVO;
import com.demo.dto.AdminLoginDTO;
import com.demo.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public AdminVO login_ok(AdminLoginDTO dto) {
		
		return mapper.login_ok(dto);
	}

}
