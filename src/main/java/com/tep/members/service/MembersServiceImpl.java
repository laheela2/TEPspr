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
		return membersDAO.insert(mem);
	}

	@Override
	public MembersModel selectOneMember(MembersModel mem) throws Exception {
		return membersDAO.selectOne(mem);
	}

	@Override
	public MembersModel selectIdChk(String m_email) throws Exception {
		return membersDAO.selectIdChk(m_email);
	}

}
