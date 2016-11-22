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

	@Override
	public List<Map<String, Object>> selectBoardList() throws Exception {
		return adminDAO.selectBoardList();
	}

	@Override
	public List<Map<String, Object>> selectMeetingsList() throws Exception {
		return adminDAO.selectMeetingsList();
	}

	@Override
	public List<Map<String, Object>> selectLendplaceList() throws Exception {
		return adminDAO.selectLendplaceList();
	}

	@Override
	public List<Map<String, Object>> selectQnaList() throws Exception {
		return adminDAO.selectQnaList();
	}

	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		return adminDAO.selectQnaList(map);
	}

	@Override
	public Map<String, Object> adminQnaDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		
		Map<String, Object> detail = adminDAO.adminQnaDetail(map);
		Map<String, Object> answer = adminDAO.adminSelectAnswer(map);
		
		resultMap.put("detail", detail);
		resultMap.put("answer", answer);
		
		return resultMap;
		
	}

	@Override
	public void adminDeleteMeetings(int mt_no) throws Exception {
		adminDAO.adminDeleteMeetings(mt_no);
	}

	@Override
	public void adminAnswer(Map<String, Object> map) throws Exception {
		adminDAO.adminAnswer(map);
	}

	@Override
	public void adminLendplaceDelete(int l_no) throws Exception {
		adminDAO.adminLendplaceDelete(l_no);
	}

	@Override
	public void adminBoardDelete(int b_no) throws Exception {
		adminDAO.adminBoardDelete(b_no);
	}

}
