package com.tep.members.dao;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;
import com.tep.members.model.MembersModel;

@Repository("membersDAO")
public class MembersDAO extends AbstractDAO {

	public MembersModel insert(MembersModel mem) {
		
		return (MembersModel) insert("members.insertMembers" , mem);
	}

	public MembersModel selectOne(MembersModel mem) {
	
		return (MembersModel) selectOne("members.selectOneMember" , mem);
	}

	public MembersModel selectIdChk(String m_email) {
		return (MembersModel) selectOne("members.selectIdChk", m_email);
	}

}
