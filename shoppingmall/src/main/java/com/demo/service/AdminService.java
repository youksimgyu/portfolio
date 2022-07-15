package com.demo.service;

import com.demo.domain.AdminVO;
import com.demo.dto.AdminLoginDTO;

public interface AdminService {
	
	AdminVO login_ok(AdminLoginDTO dto);

}
