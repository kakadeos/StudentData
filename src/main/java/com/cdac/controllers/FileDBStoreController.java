package com.cdac.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cdac.beans.FileUploader;
import com.cdac.beans.Student;
import com.cdac.services.IFileStoreService;

@Controller
@RequestMapping("fileStore")
public class FileDBStoreController {
	
	@Autowired
	private IFileStoreService iFileStoreService;
	
	@RequestMapping("/uploadFileToDB")    
	public String showUploadForm(Model m){
		return "UploadFileToDB";   
	}
	
	
	@RequestMapping(value = "/uploadFileToDB", method = RequestMethod.POST)
	@ResponseBody
	public String uploadFileHandler(HttpServletRequest servletRequest,@RequestParam("name") String name,
			@RequestParam("file") MultipartFile file) {
		FileUploader fileUploader = new FileUploader();
		fileUploader.setFileName(name);
		try {
			fileUploader.setFileData(file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		String fileContentType = file.getContentType();
		System.out.println(fileContentType);
		fileUploader.setFileContentType(fileContentType);
		
		System.out.println(file.getName() + " "+ file.getContentType());
		int result = iFileStoreService.fileUpload(fileUploader);
		return "OK";	
	}

	@RequestMapping(value = "/viewDatabaseFiles")
	public String viewStud(Model m){
		List<FileUploader> list= iFileStoreService.viewFileList();
		for (FileUploader fileUploader : list) {
			System.out.println(fileUploader);
		}
		m.addAttribute("list",list);  
		return "viewDBFiles";    
	}
	
	
}
