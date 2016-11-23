package com.tep.lendplace.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
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
		if(map.get("searchCategory") == null || StringUtils.isBlank(map.get("searchCategory").toString())){
			map.remove("searchCategory");
		}
		if(map.get("searchAddr") == null || StringUtils.isBlank(map.get("searchAddr").toString())){
			map.remove("searchAddr");
		}
		if(map.get("searchWord") == null || StringUtils.isBlank(map.get("searchWord").toString())){
			map.remove("searchWord");
		}		
		
		return lendplaceDAO.selectLendplaceList(map);
	}

	@Override
	public Map<String, Object> selectLendplaceDetail(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> detail = lendplaceDAO.selectLendplaceDetail(map);
		
		detail.put("L_DATE", TepUtils.timeFormat(detail.get("L_SDATE"),detail.get("L_EDATE")));
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

	@Override
	public Map<String, Object> selectLendplaceApplyfor(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		Map<String, Object> result = lendplaceDAO.selectLendplaceDetail(map);
		HttpSession session = request.getSession();
		result.put("M_NAME", session.getAttribute(TepConstants.M_NAME));
		result.put("M_EMAIL", session.getAttribute(TepConstants.M_EMAIL));
		result.put("L_DATE", TepUtils.timeFormat(result.get("L_SDATE"),result.get("L_EDATE")));
		return result;
	}
	
	@Override
	public void insertLendplaceApplyfor(Map<String, Object> map) throws Exception {
		map.put("la_sdate", TepUtils.dateParse(map.get("la_sdate").toString()));
		map.put("la_edate", TepUtils.dateParse(map.get("la_edate").toString()));
		lendplaceDAO.insertLendplaceApplyfor(map);
		
	}

}
