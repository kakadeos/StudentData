package com.cdac.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cdac.beans.Student;
import com.cdac.services.IStudentService;
import com.cdac.validator.StudentValidator;
@Controller
public class StudentController {

	final String filePath = "/home/cdac-kharghar3/OmkarKakade/SpringLearning/StudentData/src/main/webapp/images/";
	final String downloadDirectory = "/StudentData/src/main/webapp/images/";
	@Autowired
	HttpSession session;

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private IStudentService studentService;

	@Autowired
	private StudentValidator studentValidator;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.addValidators(studentValidator);
	}

	@Value("${upload_image_path}")
	private String imagePath;

	@RequestMapping("/")
	public String indexPage() {
		return "index";
	}

	@RequestMapping("/studentform")    
	public String showform(Model m){    
		m.addAttribute("student", new Student());  
		return "studentform";   
	}  


	@RequestMapping(value="/save",method = RequestMethod.GET)    
	public String saveStudentDB(Model m){
		m.addAttribute("student", new Student());
		return "studentform";
	}



	@RequestMapping(value="/save",method = RequestMethod.POST)    
	public String save(@ModelAttribute("student")@Validated Student student, BindingResult result , Locale locale){
		if (result.hasErrors()) {
			return "studentform";
		} else {
			studentService.save(student);    
			return "redirect:/viewstud";
		}
	}    

	@RequestMapping("/viewstud")    
	public String viewStud(Model m){
		List<Student> list=studentService.getStudents();
		m.addAttribute("list",list);  
		return "viewstud";    
	}


	@RequestMapping(value="/studentedit/{id}")    
	public String edit(@PathVariable int id, Model m){    
		Student student=studentService.getStudentById(id);    
		m.addAttribute("command",student);  
		return "studentedit";    
	}    

	@RequestMapping(value="/editsave",method = RequestMethod.POST)    
	public String editsave(@ModelAttribute("student")@Validated Student student, BindingResult result){
		studentService.update(student);    
		return "redirect:/viewstud";
	}  

	@RequestMapping(value="/deletestud/{id}",method = RequestMethod.GET)    
	public String delete(@PathVariable int id){    
		studentService.delete(id);    
		return "redirect:/viewstud";    
	}

	@RequestMapping("/viewstuddatatable")
	public String viewStudentDataTable(Model model, Locale locale) throws JsonGenerationException, JsonMappingException, IOException{
		ObjectMapper mapper = new ObjectMapper();
		model.addAttribute("studentList", mapper.writeValueAsString(studentService.getStudents()));
		return "viewDataTable";    
	}

	@RequestMapping("/uploadFile")    
	public String showUploadForm(Model m){
		return "UploadFile";   
	}  

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public @ResponseBody
	ModelAndView uploadFileHandler(HttpServletRequest servletRequest,@RequestParam("name") String name,
			@RequestParam("file") MultipartFile file) {

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				/* System.out.println(imagePath); */
				File dir = new File(filePath);
				if (!dir.exists())
					dir.mkdirs();
				System.out.println(dir);
				File serverFile = new File(dir.getAbsolutePath() + File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				studentService.storeFile(name, serverFile);
				return new ModelAndView("UploadFile","message","File successfully uploaded!");	
			} catch (Exception e) {
				return new ModelAndView("UploadFile","message","Oops!Error occured");
			}
		} else {
			return new ModelAndView("UploadFile","message","Oops!Failed to upload");
		}
	}

	@RequestMapping(value = "/viewFiles")
	public String viewFiles(Model model, HttpServletRequest request) {
		File uploadLocationDir = new File(filePath);
		String[] files = uploadLocationDir.list();
		System.out.println("files " + Arrays.toString(files));
		model.addAttribute("fileList", files);
		model.addAttribute("filePath", downloadDirectory);
		return "viewFiles";
	}



	@ResponseBody
	@RequestMapping(value = "/downloadFile/{fileName:.+}", produces = {MediaType.IMAGE_JPEG_VALUE, MediaType.APPLICATION_PDF_VALUE, MediaType.IMAGE_PNG_VALUE})
	public byte[] downloadFile(@PathVariable("fileName") String fileName) throws IOException {
		System.out.println(fileName);
		File file = new File(filePath+fileName);
		InputStream in = new FileInputStream(file);
		return IOUtils.toByteArray(in);

	}


}