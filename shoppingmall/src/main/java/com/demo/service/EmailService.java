package com.demo.service;

import com.demo.dto.EmailDTO;

public interface EmailService {

	void sendMain(EmailDTO dto, String message);
	
}
