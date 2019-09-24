package com.cdac.beans;

import java.util.Arrays;

public class FileUploader {
	
	private int id;
	private String fileName;
	private byte[] fileData;
	private String fileContentType;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public byte[] getFileData() {
		return fileData;
	}
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	@Override
	public String toString() {
		return "FileUploader [id=" + id + ", fileName=" + fileName + ", fileData=" + Arrays.toString(fileData)
				+ ", fileContentType=" + fileContentType + "]";
	}
	
	
		
}
