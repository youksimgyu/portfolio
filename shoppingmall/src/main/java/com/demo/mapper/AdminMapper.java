package com.demo.mapper;

import com.demo.domain.AdminVO;
import com.demo.dto.AdminLoginDTO;

public interface AdminMapper {
	
	AdminVO login_ok(AdminLoginDTO dto);

}
