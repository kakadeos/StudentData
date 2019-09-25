package com.cdac.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.cdac.beans.FileUploader;

public class FileDaoImpl implements IFileDao{

	@Autowired
	JdbcTemplate template;    
	
	public void setTemplate(JdbcTemplate template) {    
		this.template = template;    
	}
	
	@Override
	public int fileUpload(FileUploader fileUploader) {
		System.out.println(fileUploader);
		String sql="INSERT INTO filestore(filename, filecontenttype, filedata) VALUES ( '"+fileUploader.getFileName()+"','"+fileUploader.getFileContentType()+"','"+fileUploader.getFileData()+"')";    
		System.out.println(sql);
		return template.update(sql);
	}

	@Override
	public List<FileUploader> viewFileList() {
		return template.query("SELECT id, filename, filecontenttype, filedata FROM filestore",new RowMapper<FileUploader>(){    
			public FileUploader mapRow(ResultSet rs, int row) throws SQLException {    
				FileUploader fileUploader=new FileUploader();    
				fileUploader.setId(rs.getInt(1));
				fileUploader.setFileName(rs.getString(2));
				fileUploader.setFileContentType(rs.getString(3));
				fileUploader.setFileData(rs.getBytes(4));
				return fileUploader;    
			}    
		});    
	}
	
	@Override
	public FileUploader getDownloadableFile(int id) {
		String sql="select * from filestore where id=?";    
		return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<FileUploader>(FileUploader.class));  
	}

}