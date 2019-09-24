package com.cdac.dao;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.cdac.beans.Student;

public class StudentDaoImpl implements IStudentDao{
	@Autowired
	JdbcTemplate template;    
	
	public void setTemplate(JdbcTemplate template) {    
		this.template = template;    
	}
	
	public int save(Student s){
		System.out.println(s);
		String checkbox="";
		for(int i=0;i<s.getSports().length;i++) {
			if (s.getSports().length > 0) {
				checkbox+=s.getSports()[i]+',';
			}
		}
		String sql="insert into studentdata(name,standard,gender,city,dob,smssubscribe,sports) "
				+ "values('"+s.getName()+"','"+s.getStandard()+"','"+s.getGender()+"','"+s.getCity()+"','"+s.getDob()+"',"+s.isSmssubscribe()+",'"+checkbox+"')";    
		System.out.println(sql);
		return template.update(sql);	    
	}    

	public List<Student> getStudents(){    
		return template.query("select * from studentdata",new RowMapper<Student>(){    
			public Student mapRow(ResultSet rs, int row) throws SQLException {    
				Student s=new Student();    
				s.setId(rs.getInt(1));    
				s.setName(rs.getString(2));
				s.setStandard(rs.getString(3));
				s.setGender(rs.getString(4));
				s.setCity(rs.getString(5));
				s.setDob(rs.getString(6));
				s.setSmssubscribe(rs.getBoolean(7));
				String checkboxvalues = "";
				checkboxvalues = rs.getString(8);
				if(checkboxvalues != null) {
					String[] values = checkboxvalues.split(",");
					s.setSports(values);
				}
				return s;    
			}    
		});    
	}

	public int update(Student student){
		String checkbox="";
		for(int i=0;i<student.getSports().length;i++) {
			if (student.getSports().length > 0) {
				checkbox+=student.getSports()[i]+',';
			}
		}
		String sql="update studentdata set name='"+student.getName()+"',standard='"+student.getStandard()+"',gender='"+student.getGender()+"',city='"+student.getCity()+"', dob='"+student.getDob()+"', smssubscribe="+student.isSmssubscribe()+", sports='"+checkbox+"' where id="+student.getId()+"";    
		return template.update(sql);    
	}    

	public int delete(int id){    
		String sql="delete from studentdata where id="+id+"";    
		return template.update(sql);    
	}    
	public Student getStudentById(int id){    
		String sql="select * from studentdata where id=?";    
		return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Student>(Student.class));    
	}

	@Override
	public int storeFile(String name, File file) {
		String sql="insert into imagestore(name,imagedata) "
				+ "values('"+name+"','file')";    
		System.out.println(sql);
		return template.update(sql);	 
	}

	@Override
	public Object retriveImageFromDB() {
		String sql = "select * from imagestore where id=1";
		return template.queryForObject(sql, new BeanPropertyRowMapper<Object>(Object.class));
	}
}
