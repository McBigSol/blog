package com.interline.blog.service;

import java.util.List;
import java.util.Map;

public interface blogService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map)  throws Exception;
	List<Map<String, Object>> selectCateList()  throws Exception;
	List<Map<String, Object>> selectBoardDetail(Map<String, Object> map) throws Exception;
	//書き込み 
    void insertBoard(Map<String, Object> map) throws Exception;
    //削除
    void deleteBoard(Map<String, Object> map) throws Exception;
    //修正
    void updateBoard(Map<String, Object> map) throws Exception;
    //カテゴリで検索
    List<Map<String, Object>> selectBoardCategory(Map<String, Object> map) throws Exception;
    //コメント入力
    void insertComment(Map<String, Object> map) throws Exception;
    //コメント詳細
    List<Map<String, Object>> selectComment(Map<String, Object> map) throws Exception;
    //ログイン情報取得
    Map<String, Object> selectLoginInfo(Map<String, Object> map) throws Exception;
    //会員登録
    void insertUser(Map<String, Object> map) throws Exception;
    
}
