package com.cdac.validator;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cdac.beans.Student;


@Component
public class StudentValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Student.class.equals(clazz);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "user.name.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "standard", "user.standard.empty");
		ValidationUtils.rejectIfEmpty(errors, "gender", "user.gender.empty");

		Student student = (Student)target;
//		Pattern pattern = Pattern.compile("^[a-zA-Z]*$");
//		if (!(pattern.matcher(student.getName()).matches())) {
//			errors.rejectValue("name", "user.name.pattern");
//		}

		ValidationUtils.rejectIfEmpty(errors, "dob", "user.dob.novalue");

		String dobString = student.getDob();
		if(dobString != "") {
			String[] dateSeprate = dobString.split("-");
			Date dob = new Date(Integer.parseInt(dateSeprate[0])-1900, Integer.parseInt(dateSeprate[1])-1, Integer.parseInt(dateSeprate[2]));
			Date today = new Date();
			System.out.println(dob);
			System.out.println(today);
			if(dob.after(today)) {
				errors.rejectValue("dob","user.dob.future");
			}

		}
		
	}

}
