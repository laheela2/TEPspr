package com.tep.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tep.login.dao.LoginDAO;
import com.tep.members.model.MembersModel;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDAO loginDAO;

	@Override
	public MembersModel login(MembersModel mem) throws Exception {
		return loginDAO.login(mem);
	}

}
