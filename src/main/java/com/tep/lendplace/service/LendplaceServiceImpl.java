package com.tep.lendplace.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.tep.lendplace.dao.LendplaceDAO;

@Service("lendplaceService")
public class LendplaceServiceImpl implements LendplaceService {
	protected Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="lendplaceDAO")
	private LendplaceDAO lendplaceDAO;

	@Override
	public List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception {
		return lendplaceDAO.selectLendplaceList(map);
	}

}
