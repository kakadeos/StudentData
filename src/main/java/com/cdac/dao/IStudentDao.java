package com.cdac.dao;

import java.util.List;

import com.cdac.beans.Student;

public interface IStudentDao {
	public int save(Student s);
	public List<Student> getStudents();
	public int update(Student student);
	public int delete(int id);
	public Student getStudentById(int id);
}
