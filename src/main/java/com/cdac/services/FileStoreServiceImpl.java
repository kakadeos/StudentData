package com.cdac.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdac.beans.FileUploader;
import com.cdac.dao.IFileDao;

@Service
public class FileStoreServiceImpl implements IFileStoreService {

	@Autowired
	private IFileDao iFileDao;
	
	
	@Override
	public int fileUpload(FileUploader fileUploader) {
		return iFileDao.fileUpload(fileUploader);
	}

	@Override
	public List<FileUploader> viewFileList() {
		return iFileDao.viewFileList();
	}

	@Override
	public FileUploader getDownloadableFile(int id) {
		return iFileDao.getDownloadableFile(id);
	}
	
}
