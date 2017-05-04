package com.interline.blog.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.interline.common.dao.AbstractDAO;

@Repository("blogDAO")
public class BlogDAO extends AbstractDAO{

//	@SuppressWarnings("unchecked")
//	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return (List<Map<String, Object>>)selectList("blog.selectBoardList", map);
//		
//	}
	
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCateList() {
        // TODO Auto-generated method stub
        log.debug("in selectCateList blogDAO");
        return (List<Map<String, Object>>)selectList("blog.selectCateList");
        
    }	
    //ポスト作成
    public void insertBoard(Map<String, Object> map) throws Exception{
        insert("blog.insertBoard", map);
    }
    //hit数
    public void updateHitCnt(Map<String, Object> map) throws Exception{
        update("blog.updateHitCnt", map);
    }
    //ポスト詳細
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBoardDetail(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>) selectList("blog.selectBoardDetail", map);
    }
    //ポスト削除
    public void deleteBoard(Map<String, Object> map) throws Exception{
        update("blog.deleteBoard", map);
    }
    //ポスト削除
    public void updateBoard(Map<String, Object> map) throws Exception{
        //最初のelementがblog_sql.xmlとマッピングされる。
        update("blog.updateBoard", map);
    }
    //カテゴリで検索
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBoardCategory(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectPagingList("blog.selectBoardCategory",map);
    }
    //ページング検索
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectPagingList("blog.selectBoardList", map);
    }
    //コメント登録
    public void insertComment(Map<String, Object> map) throws Exception{
        insert("blog.insertComment", map);
    }
    //コメント詳細
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectComment(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("blog.selectComment", map);
    }
    //ログイン情報を取得する。
    @SuppressWarnings("unchecked")
    public Map<String, Object> selecLoginInfo(Map<String, Object> map) throws Exception{
        return (Map<String, Object>)selectOne("blog.selectLoginInfo", map);
    }
  //コメント登録
    public void insertUser(Map<String, Object> map) throws Exception{
        insert("blog.insertUser", map);
    }
}
