package com.tep.members.dao;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;
import com.tep.members.model.MembersModel;

@Repository("membersDAO")
public class MembersDAO extends AbstractDAO {
	private final String NAMESPACE = "members.";

	public int insertMembers(MembersModel mem) {
		return (int) insert(NAMESPACE+"insertMembers" , mem);
	}

	public MembersModel selectMEmailMembers(String m_email) {
		return (MembersModel) selectOne(NAMESPACE+"selectMEmailMembers",m_email);
	}
	
	public MembersModel selectMNoMembers(int m_no) {
		return (MembersModel) selectOne(NAMESPACE+"selectMNoMembers",m_no);
	}

	public MembersModel selectMembersLogin(MembersModel mem) {
		return (MembersModel) selectOne(NAMESPACE+"selectMembersLogin",mem);
	}

	public MembersModel selectFindEmail(MembersModel mem) {
		return (MembersModel) selectOne(NAMESPACE+"selectFindEmail",mem);
	}
	
	public MembersModel selectFindPassword(MembersModel mem) {
		return (MembersModel) selectOne(NAMESPACE+"selectFindPassword",mem);
	}

}
