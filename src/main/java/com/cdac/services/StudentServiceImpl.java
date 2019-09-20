package com.cdac.services;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdac.beans.Student;
import com.cdac.dao.IStudentDao;

@Service
public class StudentServiceImpl implements IStudentService {


	@Autowired
	private IStudentDao studentDao;


	@Override
	public int save(Student s) {
		return studentDao.save(s);
	}

	@Override
	public List<Student> getStudents() {
		return studentDao.getStudents();
	}

	@Override
	public int update(Student student) {
		return studentDao.update(student);
	}

	@Override
	public int delete(int id) {
		return studentDao.delete(id);
	}

	@Override
	public Student getStudentById(int id) {
		return studentDao.getStudentById(id);
	}

	@Override
	public int storeFile(String name, File file) {
		return studentDao.storeFile(name, file);
	}

}
