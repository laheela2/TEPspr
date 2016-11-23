package com.tep.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tep.admin.dao.AdminDAO;
import com.tep.commons.util.FileUploadComponent;

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
		String uploadFilePath1 = fileUploadComp.saveFile(request.getFile("file1"));
		map.put("l_image1", fileUploadComp.getProjectPath());

		String uploadFilePath2 = fileUploadComp.saveFile(request.getFile("file2"));
		map.put("l_image2", fileUploadComp.getProjectPath());

		String uploadFilePath3 = fileUploadComp.saveFile(request.getFile("file3"));
		map.put("l_image3", fileUploadComp.getProjectPath());

		String uploadFilePath4 = fileUploadComp.saveFile(request.getFile("file4"));
		map.put("l_image4", fileUploadComp.getProjectPath());

//		map.put("l_sdate", TepUtils.dateParse(map.get("l_sdate").toString()));
//		map.put("l_edate", TepUtils.dateParse(map.get("l_edate").toString()));
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

		return adminDAO.adminQnaDetail(map);

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
