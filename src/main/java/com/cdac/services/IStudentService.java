package com.cdac.services;

import java.util.List;

import com.cdac.beans.Student;

public interface IStudentService {
	public int save(Student s);
	public List<Student> getStudents();
	public int update(Student student);
	public int delete(int id);
	public Student getStudentById(int id);
}
