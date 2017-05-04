package com.interline.blog.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.interline.blog.dao.BlogDAO;

@Service("blogService")
public class blogServiceImpl implements blogService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="blogDAO")
    private BlogDAO blogDAO;
	
	@Override
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
        return blogDAO.selectBoardList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectCateList()  throws Exception{
	    log.debug("in selectCateList blogservice");
	    return blogDAO.selectCateList();
	}

    @Override
    public void insertBoard(Map<String, Object> map) throws Exception {
        blogDAO.insertBoard(map);
    };
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBoardDetail(Map<String, Object> map) throws Exception{
        //return typeが異なる理由は、２つの処理を行うためである。
        //hit数
        //blogDAO.updateHitCnt(map);
        List<Map<String, Object>> resultMap = blogDAO.selectBoardDetail(map);
        return resultMap;
    }
    public void updateHitCnt(Map<String, Object> map) throws Exception{
        blogDAO.update("blog.updateHitCnt", map);
    }

    @Override
    public void deleteBoard(Map<String, Object> map) throws Exception {
        blogDAO.deleteBoard(map);
   }

    @Override
    public void updateBoard(Map<String, Object> map) throws Exception {
        blogDAO.updateBoard(map);
    }

    @Override
    public List<Map<String, Object>> selectBoardCategory(Map<String, Object> map) throws Exception {
        // TODO Auto-generated method stub
        return blogDAO.selectBoardCategory(map);
    }

    @Override
    public void insertComment(Map<String, Object> map) throws Exception {
        // TODO Auto-generated method stub
        blogDAO.insertComment(map);
        
    }

    @Override
    public List<Map<String, Object>> selectComment(Map<String, Object> map) throws Exception {
        // TODO Auto-generated method stub
        return blogDAO.selectComment(map);
    }

    @Override
    public Map<String, Object> selectLoginInfo(Map<String, Object> map) throws Exception {
        // TODO Auto-generated method stub
        return blogDAO.selecLoginInfo(map);
    }

    @Override
    public void insertUser(Map<String, Object> map) throws Exception {
        // TODO Auto-generated method stub
        blogDAO.insertUser(map); 
    }
}
