package com.tep.login.service;

import com.tep.members.model.MembersModel;

public interface LoginService {

	MembersModel selectMember(MembersModel mem) throws Exception;

	MembersModel findId(MembersModel mem) throws Exception;

}
