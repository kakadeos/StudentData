package com.cdac.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cdac.beans.FileUploader;

public interface IFileDao {
	public List<FileUploader> viewFileList();
	public FileUploader getDownloadableFile(int id);
	public Boolean uploadFilePS(String fileName, String fileContentType, MultipartFile file);
}
