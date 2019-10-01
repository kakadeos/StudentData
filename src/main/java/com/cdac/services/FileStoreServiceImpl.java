package com.cdac.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cdac.beans.FileUploader;
import com.cdac.dao.IFileDao;

@Service
public class FileStoreServiceImpl implements IFileStoreService {

	@Autowired
	private IFileDao iFileDao;
	
	
	@Override
	public List<FileUploader> viewFileList() {
		return iFileDao.viewFileList();
	}

	@Override
	public FileUploader getDownloadableFile(int id) {
		return iFileDao.getDownloadableFile(id);
	}

	@Override
	public Boolean uploadFilePS(String fileName, String fileContentType, MultipartFile file) {
		return iFileDao.uploadFilePS(fileName,fileContentType,file);
	}
	
}
