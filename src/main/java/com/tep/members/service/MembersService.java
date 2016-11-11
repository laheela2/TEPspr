package com.tep.members.service;

import com.tep.members.model.MembersModel;

public interface MembersService {
	MembersModel insertMembers(MembersModel mem) throws Exception;

	MembersModel selectMEmailMembers(String m_email) throws Exception;

	MembersModel selectMembersLogin(MembersModel mem) throws Exception;

	MembersModel selectFindEmail(MembersModel mem) throws Exception;

	MembersModel selectFindPassword(MembersModel mem) throws Exception;

}
