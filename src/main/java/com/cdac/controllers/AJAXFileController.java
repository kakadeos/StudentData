package com.cdac.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AJAXFileController {


	@RequestMapping("/uploadFileUsingAJAX")    
	public String showUploadForm(Model m){
		return "UploadFileUsingAjax";   
	}

	  // Handling file upload request
	   @RequestMapping(value="/fileUpload", method = RequestMethod.POST)
	   public ResponseEntity<Object> fileUpload(@RequestParam("file") MultipartFile file)
	         throws IOException {

	      // Save file on system
	      if (!file.getOriginalFilename().isEmpty()) {
	         BufferedOutputStream outputStream = new BufferedOutputStream(
	               new FileOutputStream(
	                     new File("/home/cdac-kharghar3/OmkarKakade/SpringLearning/StudentData/", file.getOriginalFilename())));
	         outputStream.write(file.getBytes());
	         outputStream.flush();
	         outputStream.close();
	      }else{
	    	  return new ResponseEntity<>("Invalid file.",HttpStatus.BAD_REQUEST);
	      }
	      
	      return new ResponseEntity<>("File Uploaded Successfully.",HttpStatus.OK);	   }
}
