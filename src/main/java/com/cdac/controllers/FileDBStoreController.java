package com.cdac.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cdac.beans.FileUploader;
import com.cdac.services.IFileStoreService;

@Controller
public class FileDBStoreController {

	@Autowired
	private IFileStoreService iFileStoreService;

	@RequestMapping("/uploadFileToDB")    
	public String showUploadForm(Model m){
		return "UploadFileToDB";   
	}

	@RequestMapping(value = "/viewDatabaseFiles")
	public String viewStud(Model m){
		List<FileUploader> list= iFileStoreService.viewFileList();
		m.addAttribute("list",list);  
		return "viewDBFiles";    
	}

	@RequestMapping(value="downloadFile/{id}")
	public void downloadFile(@PathVariable("id")int id, HttpServletResponse response) throws IOException {
		FileUploader fileUploader = iFileStoreService.getDownloadableFile(id);
		response.setHeader("Content-Encoding", "UTF-8");
		response.setContentType("application/octet-stream");
		response.setContentType(fileUploader.getFileContentType());
		response.setContentLength(fileUploader.getFileData().length);
		response.setHeader("Content-Disposition","attachment; filename=\"" + fileUploader.getFileName() +"\"");
		FileCopyUtils.copy(fileUploader.getFileData(), response.getOutputStream());
		byte[] fileContent = fileUploader.getFileData();
		response.getOutputStream().write(fileContent); 
	}
	
	
	@RequestMapping(value = "/uploadFileToDB", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView uploadFileHandler(HttpServletRequest servletRequest,@RequestParam("name") String name,
			@RequestParam("file") MultipartFile file) {
		FileUploader fileUploader = new FileUploader();
		fileUploader.setFileName(name);
		try {
			fileUploader.setFileData(file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		String fileContentType = file.getContentType();
		fileUploader.setFileContentType(fileContentType);
		
		iFileStoreService.uploadFilePS(fileUploader.getFileName(), fileUploader.getFileContentType(), file);
		
		return new ModelAndView("UploadFileToDB","filesuccess","File successfully saved!");	
	}
	

}
