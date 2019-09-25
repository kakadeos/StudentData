package com.cdac.dao;

import java.util.List;

import com.cdac.beans.FileUploader;

public interface IFileDao {
	public int fileUpload(FileUploader fileUploader);
	public List<FileUploader> viewFileList();
	public FileUploader getDownloadableFile(int id);
}
