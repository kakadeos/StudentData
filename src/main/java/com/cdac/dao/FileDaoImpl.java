package com.cdac.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.multipart.MultipartFile;

import com.cdac.beans.FileUploader;

public class FileDaoImpl implements IFileDao{

	@Autowired
	JdbcTemplate template;    

	public void setTemplate(JdbcTemplate template) {    
		this.template = template;    
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

	@Override
	public Boolean uploadFilePS(String fileName, String fileContentType, MultipartFile file) {
		String query= "INSERT INTO filestore(filename, filecontenttype, filedata) VALUES (?,?,?)";  
		return template.execute(query,new PreparedStatementCallback<Boolean>() {
			public Boolean doInPreparedStatement(PreparedStatement ps)  
					throws SQLException, DataAccessException {  
				ps.setString(1, fileName);
				ps.setString(2, fileContentType);
				try {
					ps.setBinaryStream(3, file.getInputStream(), file.getBytes().length);
				} catch (IOException e) {
					e.printStackTrace();
				}
				return ps.execute();  
			}
		}				
				);

	}

}
