package com.springriders.perfume;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileUtils {
	
	public static void makeFolder(String path) {
		File dir = new File(path);		
		if(!dir.exists()) {
			dir.mkdirs();
		}
	}
	
	public static String getExt(String fileNm) {
		return fileNm.substring(fileNm.lastIndexOf("."));
	}
	
	public static String getRandomUUID(MultipartFile mf) {
		String originFileNm = mf.getOriginalFilename();
		String ext = getExt(originFileNm);
		return UUID.randomUUID() + ext;
	}
	
	public static String saveFile(String path, MultipartFile mf) {
		if(mf.isEmpty()) { return null; }
		String saveFileNm = getRandomUUID(mf);
		
		try {
			mf.transferTo(new File(path + saveFileNm));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return saveFileNm;
	}
	
	public static boolean delFile(String path) {
		File file = new File(path);
		if(file.exists()) {
			return file.delete();
		}
		return false;
	}
}