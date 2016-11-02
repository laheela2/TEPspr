package com.tep.members.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


import com.tep.members.dao.MembersDAO;
import com.tep.members.model.MembersModel;

@Service("membersService")
public class MembersServiceImpl implements MembersService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="membersDAO")
	private MembersDAO membersDAO;

	@Override
	public MembersModel MembersLogin(MembersModel mem) {
	
		return membersDAO.membersLogin(mem);
	}

	
}
