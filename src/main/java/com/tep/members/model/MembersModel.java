package com.tep.members.model;

import java.util.Date;

//회원정보 테이블
public class MembersModel {

	//번호
	private int m_no;
	
	// 이메일(아이디)
	private String m_email;

	// 사용자이름
	private String m_name;

	// 비밀번호
	private String m_password;

	// 휴대폰번호
	private String m_phone;

	// 가입날짜
	private Date m_date;
	
	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}

}