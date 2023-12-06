package com.task.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.task.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

}
