package com.task.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.task.entity.User;
import com.task.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService service;
	
	@GetMapping("/")
	public String initialPoint() 
	{
	return "redirect:/Registration";	
	}
	
	@GetMapping("/Registration")
	public String RegistrationURL() 
	{
	return "Registration.jsp";	
	}
	
	@PostMapping("/newRegister")
	public String newUserRegistration(@RequestParam("fullName")String fullName,@RequestParam("email") String email,@RequestParam("password") String password)
	{
		service.newRegistration(new User(fullName,email,password));
		return "redirect:/Registration";
	}
	
}
