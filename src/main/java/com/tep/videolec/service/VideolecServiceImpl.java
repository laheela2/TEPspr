package com.tep.videolec.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tep.videolec.dao.VideolecDAO;

@Service
public class VideolecServiceImpl implements VideolecService {
	protected Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private VideolecDAO videolecDao;
	
	@Override
	public void insertVideolec(Map<String, Object> map) throws Exception {
		String url = map.get("v_url").toString();
		log.debug("input video url : "+url);
		if(map.get("v_url_chk") == null){
			String video_id = url.substring(url.indexOf("=")+1,url.length());
			log.debug("video url : "+video_id);
			map.put("v_video_id", video_id);
			map.put("v_list_id", null);
		} else if(map.get("v_url_chk") != null && Boolean.parseBoolean(map.get("v_url_chk").toString())){
			url = url.substring(url.indexOf("=")+1,url.length());
			String video_id = url.substring(0, url.indexOf("&"));
			String list_id = "";
			if(url.indexOf("#") > 0){
				list_id = url.substring(url.indexOf("=")+1,url.indexOf("#"));
			} else {
				list_id = url.substring(url.indexOf("=")+1,url.length());
			}
			log.debug("video id : "+video_id);
			log.debug("list id : "+list_id);
			map.put("v_video_id", video_id);
			map.put("v_list_id", list_id);
		}
		
		videolecDao.insertVideolec(map);
	}

	@Override
	public List<Map<String, Object>> selectAdminVideolecList() throws Exception {
		return videolecDao.selectAdminVideolecList();
	}

	@Override
	public void deleteVideolec(int v_no) throws Exception {
		videolecDao.deleteVideolec(v_no);
	}

}
