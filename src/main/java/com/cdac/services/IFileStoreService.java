package com.cdac.services;

import java.util.List;

import com.cdac.beans.FileUploader;

public interface IFileStoreService {
	public int fileUpload(FileUploader fileUploader);
	public List<FileUploader> viewFileList();
}
