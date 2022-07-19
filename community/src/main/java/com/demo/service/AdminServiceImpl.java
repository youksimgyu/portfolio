package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.AdminVO;
import com.demo.dto.AdLoginDTO;
import com.demo.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public AdminVO adLogin_ok(AdLoginDTO dto) {
		// TODO Auto-generated method stub
		return mapper.adLogin_ok(dto);

	}

}
