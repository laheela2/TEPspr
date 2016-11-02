package com.tep.members.model;

import java.util.Date;

//?šŒ?›? •ë³? ?…Œ?´ë¸?
public class MembersModel {

	//ë²ˆí˜¸
	private int m_no;
	
	// ?´ë©”ì¼(?•„?´?””)
	private String m_email;

	// ?‚¬?š©??´ë¦?
	private String m_name;

	// ?‹‰?„¤?„
	private String m_nickname;

	// ë¹„ë?ë²ˆí˜¸
	private String m_password;

	// ?œ´???°ë²ˆí˜¸
	private String m_phone;

	//?†Œ?†
	private String m_company;
	
	// ê´??‹¬ì§??—­
	private String m_fav_area;

	// ê´??‹¬ë¶„ì•¼
	private String m_fav_field;

	// ê°??…?‚ ì§?
	private Date m_date;

	
	
	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_company() {
		return m_company;
	}

	public void setM_company(String m_company) {
		this.m_company = m_company;
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

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
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

	public String getM_fav_area() {
		return m_fav_area;
	}

	public void setM_fav_area(String m_fav_area) {
		this.m_fav_area = m_fav_area;
	}

	public String getM_fav_field() {
		return m_fav_field;
	}

	public void setM_fav_field(String m_fav_field) {
		this.m_fav_field = m_fav_field;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}

}