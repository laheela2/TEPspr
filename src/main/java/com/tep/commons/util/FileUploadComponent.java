package com.tep.commons.util;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.tep.commons.common.TepConstants;

@Component
public class FileUploadComponent {
	private final String filePath = TepConstants.UPLOAD_PATH_IMAGE;
	private String projectPath;

	public String saveFile(MultipartFile multipartFile) throws IllegalStateException, IOException{
		if(multipartFile == null || multipartFile.isEmpty()){
			return null;
		}

		File file = new File(filePath);
		if(file.exists() == false){
			file.mkdirs();
		}
		String generatePath1 = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();
		String generatePath2 = multipartFile.getOriginalFilename();
		projectPath = "/tepspr/resources/image/"+generatePath2;
    	file = new File(filePath+generatePath2);
    	multipartFile.transferTo(file);
    	return file.getAbsolutePath();
	}

	public String getProjectPath() {
		return projectPath;
	}

}
