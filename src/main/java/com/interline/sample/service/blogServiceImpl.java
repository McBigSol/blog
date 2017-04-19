package com.interline.sample.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.interline.sample.dao.BlogDAO;

@Service("blogService")
public class blogServiceImpl implements blogService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="blogDAO")
    private BlogDAO blogDAO;
	
	@Override
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
        return blogDAO.selectBoardList(map);
	}
}
