package com.tep.members.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.tep.members.dao.MembersDAO;
import com.tep.members.model.MembersModel;

@Service("membersService")
public class MembersServiceImpl implements MembersService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "membersDAO")
	private MembersDAO membersDAO;

	@Override
	public MembersModel insertMembers(MembersModel mem) throws Exception {
		int m_no = membersDAO.insertMembers(mem);
		return membersDAO.selectMNoMembers(m_no);
	}

	@Override
	public MembersModel selectMEmailMembers(String m_email) throws Exception {
		return membersDAO.selectMEmailMembers(m_email);
	}

	@Override
	public MembersModel selectMembersLogin(MembersModel mem) throws Exception {
		return membersDAO.selectMembersLogin(mem);
	}
	
	@Override
	public MembersModel selectFindPassword(MembersModel mem) throws Exception {
		return membersDAO.selectFindPassword(mem);
	}

	@Override
	public MembersModel selectFindEmail(MembersModel mem) throws Exception {
		return membersDAO.selectFindEmail(mem);
	}

}
