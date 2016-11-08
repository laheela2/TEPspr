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
	public MembersModel selectMember(MembersModel mem) throws Exception {
		return loginDAO.selectMember(mem);
	}

	@Override
	public MembersModel findId(MembersModel mem) throws Exception{
		return loginDAO.findId(mem);
	}

}
