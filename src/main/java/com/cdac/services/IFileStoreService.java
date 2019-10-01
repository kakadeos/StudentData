package com.cdac.services;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cdac.beans.FileUploader;

public interface IFileStoreService {
	public List<FileUploader> viewFileList();
	public FileUploader getDownloadableFile(int id);
	public Boolean uploadFilePS(String fileName, String fileContentType, MultipartFile file);
}
