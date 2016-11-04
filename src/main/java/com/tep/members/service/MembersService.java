package com.tep.members.service;

import com.tep.members.model.MembersModel;

public interface MembersService {

	

	MembersModel insertMembers(MembersModel mem);

	MembersModel selectOneMember(MembersModel mem);

	/*
	 * MembersModel MembersLogin(MembersModel mem);
	 * public MembersModel getMembers(String m_email);
	 * 
	 * public Object insertMembers(MembersModel mem);
	 */

}
