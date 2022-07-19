package com.demo.util;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

public class UploadFileUtils {

	// 업로드시 날짜폴더 생성해서 파일관리.
	// Thumnail 이미지 생성
	// byte[] 배열로 다운로드.

	// 1) 파일업로드 작업. 리턴값 : 업로드한 실제파일명(DB저장)
	public static String uploadFile(String uploadFolder, String uploadDateFolderPath, MultipartFile uploadFile) {

		String uploadFileName = ""; // 실제 업로드한 파일명
		
		// 1)업로드 날짜폴더 생성
		// String uploadDateFolderPath = getFolder(); // "2022\06\30"
		File uploadPath = new File(uploadFolder, uploadDateFolderPath); // C:\\Dev\\upload\\2022\\07\\19
		
		// 폴더 존재여부 폴더 없으면 생성하도록 설계
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs(); // 하위 디렉토리 생성
		}
		
		// 클라이언트에서 업로드한 파일명
		String uploadClientFileName = uploadFile.getOriginalFilename();
		
		// 중복되지 않는 문자열 생성
		UUID uuid = UUID.randomUUID();
		
		// 중복되지 않는 파일이름을 생성_원래 파일이름 생성
		uploadFileName = uuid.toString() + "_" + uploadClientFileName;
		
		
		try {
			// 유일한 파일이름으로 객체생성
			File saveFile = new File(uploadPath, uploadClientFileName);
			uploadFile.transferTo(saveFile); // 파일업로드 됨(파일복사)
			
			if(checkImageType(saveFile)) {
				
				// 섬네일 작업 : 원본이미지를 대상으로 사본이미지를 해상도의 손실을 줄이고, 크기를 작게 작업한다
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				
				Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 100, 100);
				
				thumbnail.close();
				
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
		return uploadFileName; // 실제 업로드한 파일명(날짜폴더명 포함)
	}

	// 날짜를 이용한 업로드 폴더생성 및 폴더이름 반환
	public static String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	//이미지 파일여부 체크
	private static boolean checkImageType(File saveFile) {
		
		boolean isImage = false;
		
		try {
			
		String contentType = Files.probeContentType(saveFile.toPath()); // text/html, text/plain, image/jpeg
		
		isImage = contentType.startsWith("image");
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isImage;
	}

}
