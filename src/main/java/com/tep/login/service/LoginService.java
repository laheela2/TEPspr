package com.tep.login.service;

import com.tep.members.model.MembersModel;

public interface LoginService {

	MembersModel login(MembersModel mem) throws Exception;

}
