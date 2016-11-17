package com.tep.lendplace.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tep.commons.common.TepConstants;
import com.tep.commons.util.FileUploadComponent;
import com.tep.commons.util.TepUtils;
import com.tep.lendplace.dao.LendplaceDAO;


@Service("lendplaceService")
public class LendplaceServiceImpl implements LendplaceService {
	protected Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="lendplaceDAO")
	private LendplaceDAO lendplaceDAO;

	@Autowired
	private FileUploadComponent fileUploadComp;	
	
	@Override
	public List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception {
		return lendplaceDAO.selectLendplaceList(map);
	}

	@Override
	public Map<String, Object> selectLendplaceDetail(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> detail = lendplaceDAO.selectLendplaceDetail(map);
		
		resultMap.put("detail", detail);
		return resultMap;
	}

	@Override
	public void insertLendplace(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception {
		String uploadFilePath = fileUploadComp.saveFile(request.getFile("file"));
		map.put("l_rep_img", uploadFilePath);
		map.put("l_sdate", TepUtils.dateParse(map.get("l_sdate").toString()));
		map.put("l_edate", TepUtils.dateParse(map.get("l_edate").toString()));
		lendplaceDAO.insertLendplace(map);
	}
	

}
