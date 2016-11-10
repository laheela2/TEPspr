package com.tep.members.service;

import com.tep.members.model.MembersModel;

public interface MembersService {

	MembersModel insertMembers(MembersModel mem) throws Exception;

	MembersModel selectOneMember(MembersModel mem) throws Exception;

	MembersModel selectIdChk(String m_email) throws Exception;

}
