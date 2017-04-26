package com.interline.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.interline.common.dao.AbstractDAO;

@Repository("blogDAO")
public class BlogDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);
		
	}
	
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCateList(Map<String, Object> map) {
        // TODO Auto-generated method stub
        return (List<Map<String, Object>>)selectList("sample.selectCateList", map);
        
    }	
    
    public void insertBoard(Map<String, Object> map) throws Exception{
        insert("sample.insertBoard", map);
    }

}
