package com.interline.sample.service;

import java.util.List;
import java.util.Map;

public interface blogService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map)  throws Exception;
	List<Map<String, Object>> selectCateList(Map<String, Object> map)  throws Exception;
	 
    void insertBoard(Map<String, Object> map) throws Exception;


}
