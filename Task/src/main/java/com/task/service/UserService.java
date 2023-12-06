package com.task.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.task.entity.User;
import com.task.repo.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository repo;
	
	public void newRegistration(User usr)
	{
		repo.save(usr);
	}
}
