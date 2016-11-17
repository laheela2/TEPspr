package com.tep.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tep.admin.dao.AdminDAO;
import com.tep.commons.common.CommandMap;
import com.tep.commons.util.FileUploadComponent;
import com.tep.commons.util.TepUtils;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private FileUploadComponent fileUploadComp;
	
	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return adminDAO.selectMemberList(map);
	}

	@Override
	public void insertLendplace(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception {
		String uploadFilePath = fileUploadComp.saveFile(request.getFile("file"));
		map.put("l_rep_img", uploadFilePath);
		map.put("l_sdate", TepUtils.dateParse(map.get("l_sdate").toString()));
		map.put("l_edate", TepUtils.dateParse(map.get("l_edate").toString()));
		adminDAO.insertLendplace(map);
	}

	@Override
	public Map<String, Object> selectDashboard() throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		
		return null;
	}

	@Override
	public Map<String, Object> selectMemberModifyForm(Map<String, Object> map) throws Exception {
		return adminDAO.selectMemberModfiyForm(map);
	}

	@Override
	public void adminMemberModify(Map<String, Object> params) throws Exception {
		adminDAO.adminMemberModify(params);
	}

	@Override
	public void deleteMember(Map<String, Object> params) throws Exception {
		adminDAO.deleteMember(params);
	}

}
