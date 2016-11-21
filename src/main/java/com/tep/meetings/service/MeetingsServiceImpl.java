package com.tep.meetings.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.tep.meetings.dao.MeetingsDAO;
import com.tep.meetings.model.MeetingsModel;

@Service
public class MeetingsServiceImpl implements MeetingsService {
	protected Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private MeetingsDAO meetingsDAO;

	@Autowired
	private FileUploadComponent fileUploadComp;

	@Override
	public List<Map<String, Object>> selectMeetingsList(Map<String, Object> map) throws Exception {
		if(map.get("searchCategory") == null || StringUtils.isBlank(map.get("searchCategory").toString())){
			map.remove("searchCategory");
		}
		if(map.get("searchAddr") == null || StringUtils.isBlank(map.get("searchAddr").toString())){
			map.remove("searchAddr");
		}
		if(map.get("searchMStart") == null || StringUtils.isBlank(map.get("searchMStart").toString())){
			map.remove("searchMStart");
		}
		if(map.get("searchMEnd") == null || StringUtils.isBlank(map.get("searchMEnd").toString())){
			map.remove("searchMEnd");
		}
		if(map.get("searchWord") == null || StringUtils.isBlank(map.get("searchWord").toString())){
			map.remove("searchWord");
		}

		List<Map<String, Object>> resultList = meetingsDAO.selectMeetingsList(map);
//		for (int i = 0; i < resultList.size(); i++) {
//			int mt_no = Integer.parseInt(resultList.get(i).get("MT_NO").toString());
//			resultList.get(i).put("MT_LIKEIT", meetingsDAO.selectLikeitCount(mt_no));
//		}
		return resultList;
	}

	@Override
	public void insertMeetings(MeetingsModel meet, MultipartHttpServletRequest request) throws Exception {
		String uploadFilePath = fileUploadComp.saveFile(request.getFile("file"));
		meet.setMt_rep_img(uploadFilePath);
		meet.setMt_r_sdate(TepUtils.dateParse(meet.getMt_rsdate()));
		meet.setMt_r_edate(TepUtils.dateParse(meet.getMt_redate()));
		meet.setMt_m_sdate(TepUtils.dateParse(meet.getMt_msdate()));
		meet.setMt_m_edate(TepUtils.dateParse(meet.getMt_medate()));
		meet.setM_no(Integer.parseInt(request.getSession().getAttribute(TepConstants.M_NO).toString()));
    	meetingsDAO.insertMeetings(meet);
	}

	@Override
	public void insertLikeit(Map<String, Object> map, HttpServletRequest request) throws Exception {
		map.put("m_no", request.getSession().getAttribute(TepConstants.M_NO));
		Map<String, Object> resultMap = meetingsDAO.selectLikeitExist(map);
		if(resultMap == null){
			meetingsDAO.insertLikeit(map);
		} else {
			meetingsDAO.deleteLikeit(map);
		}
	}

	@Override
	public Map<String, Object> selectMeetingsDetail(Map<String, Object> map, boolean readcount) throws Exception {
		if(readcount){
			meetingsDAO.updateMeetingsReadCount(map);
		}

		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> detail = meetingsDAO.selectMeetingsDetail(map);
		List<Map<String, Object>> cmtList = meetingsDAO.selectCmtList(map);
		List<Map<String, Object>> recList = meetingsDAO.meetingsRecommend();

		if(map.get("m_no") != null && !StringUtils.isEmpty(map.get("m_no").toString())){
			Map<String, Object> likeit = meetingsDAO.selectLikeitExist(map);
			if(likeit != null){
				detail.put("MT_LIKEIT",likeit.get("M_NO"));
			} else {
				detail.put("MT_LIKEIT", null);
			}
		} else {
			detail.put("MT_LIKEIT", null);
		}
		detail.put("MT_MEETDATE", TepUtils.dateFormat(detail.get("MT_M_SDATE"),detail.get("MT_M_EDATE")));
		detail.put("MT_REGISTERDATE", TepUtils.dateFormat(detail.get("MT_R_SDATE"),detail.get("MT_R_EDATE")));

		resultMap.put("detail", detail);
		resultMap.put("cmtList", cmtList);
		resultMap.put("recList", recList);

		return resultMap;
	}

	@Override
	public void insertComments(Map<String, Object> map) throws Exception {
		meetingsDAO.insertComments(map);
	}

	@Override
	public void deleteComments(Map<String, Object> map) throws Exception {
		meetingsDAO.deleteComments(map);
	}

	@Override
	public Map<String, Object> selectMeetingsModify(Map<String, Object> map) throws Exception {
		Map<String, Object> result = meetingsDAO.selectMeetingsDetail(map);
		result.put("MT_M_SDATE", TepUtils.dateParseFormat(result.get("MT_M_SDATE")));
		result.put("MT_M_EDATE", TepUtils.dateParseFormat(result.get("MT_M_EDATE")));
		result.put("MT_R_SDATE", TepUtils.dateParseFormat(result.get("MT_R_SDATE")));
		result.put("MT_R_EDATE", TepUtils.dateParseFormat(result.get("MT_R_EDATE")));
		return result;
	}

	@Override
	public void updateMeetings(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception {
		String uploadFilePath = fileUploadComp.saveFile(request.getFile("file"));
		if(uploadFilePath != null){
			map.put("mt_rep_img", uploadFilePath);
		}
		map.put("mt_m_sdate", TepUtils.dateParse(map.get("mt_msdate").toString()));
		map.put("mt_m_edate", TepUtils.dateParse(map.get("mt_medate").toString()));
		map.put("mt_r_sdate", TepUtils.dateParse(map.get("mt_rsdate").toString()));
		map.put("mt_r_edate", TepUtils.dateParse(map.get("mt_redate").toString()));
		map.put("m_no", request.getSession().getAttribute(TepConstants.M_NO));
		meetingsDAO.updateMeetings(map);
	}

	@Override
	public void deleteMeetings(Map<String, Object> map) throws Exception {
		meetingsDAO.deleteMeetings(map);
	}

	@Override
	public Map<String, Object> selectMeetingsApplyfor(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String, Object> result = meetingsDAO.selectMeetingsDetail(map);
		HttpSession session = request.getSession();
		result.put("MT_NAME", session.getAttribute(TepConstants.M_NAME));
		result.put("MT_EMAIL", session.getAttribute(TepConstants.M_EMAIL));
		result.put("MT_PHONE", session.getAttribute(TepConstants.M_PHONE));
		result.put("MT_MEETDATE", TepUtils.dateFormat(result.get("MT_M_SDATE"),result.get("MT_M_EDATE")));

		return result;
	}

	@Override
	public void insertMeetingsApplyfor(Map<String, Object> map) throws Exception {
		meetingsDAO.updateMeetingsApplyforNum(map);
		meetingsDAO.insertMeetingsApplyfor(map);
	}
}
