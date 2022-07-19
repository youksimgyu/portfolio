package com.demo.mapper;

import com.demo.domain.AdminVO;
import com.demo.dto.AdLoginDTO;

public interface AdminMapper {
	
	AdminVO adLogin_ok(AdLoginDTO dto);

}
