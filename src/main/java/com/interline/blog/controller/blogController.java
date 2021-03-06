package com.interline.blog.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.interline.blog.service.blogService;
import com.interline.common.common.CommandMap;

@Controller
public class blogController {
    Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="blogService")
    private blogService blogService;
    
    @RequestMapping(value="/blog/login.do")
    public ModelAndView login(Map<String, Object> map) throws Exception{
        ModelAndView mv = new ModelAndView("/common/Login");
        //mv.setView("redirect:/blog/openBoardList.do");
        
        
        return mv;
    }
    @RequestMapping(value="/blog/loginConfirm.do")
    public ModelAndView loginConfirm(CommandMap commandMap, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/blog/openBoardList.do");
          for(String key : commandMap.getMap().keySet()){
              String value = commandMap.getMap().get(key).toString();
              log.debug(key + " : " + value);
          }
          
        Map<String, Object> loginInfo = blogService.selectLoginInfo(commandMap.getMap());
        //mv.addObject("loginInfo", loginInfo);
        
        
        log.debug("selectlogininfo return : ");
        boolean logchk = true;
        if(null == loginInfo){
            logchk = false;
            mv.setViewName("/common/Login");
            mv.addObject("loginFlg", false);
        }
        
        log.debug("selectlogininfo size : " + logchk);
        
        request.getSession().setAttribute("loginInfo", loginInfo);
        mv.addObject(request);
        return mv;
    }
    
    @RequestMapping(value="/blog/openBoardList.do")
    public ModelAndView openSampleList(Map<String,Object> map, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("/blog/boardList");   
        List<Map<String,Object>> cate_list = blogService.selectCateList();
        mv.addObject("cate_list", cate_list);
        
        return mv;
    }
    @RequestMapping(value="/blog/selectBoardList.do")
    public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("jsonView");
         
        List<Map<String,Object>> list = blogService.selectBoardList(commandMap.getMap());
        mv.addObject("list", list);
        mv.addObject("list_type", "board");
        if(list.size() > 0){
            mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
        }
        else{
            mv.addObject("TOTAL", 0);
        }
        
        return mv;
    }
    
    //ポスト作成に遷移
    @RequestMapping(value="/blog/openBoardWrite.do")
    public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/blog/boardWrite");
        List<Map<String,Object>> cate_list = blogService.selectCateList();
        
        for (Map<String, Object> map : cate_list) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
            log.debug("cate list size : "+cate_list.size()+
                    "\n cate value" + entry.getKey() + " - " + entry.getValue());
            }
        }
        mv.addObject("cate_list", cate_list);
        return mv;
    }
    //書き込み
    @RequestMapping(value="/blog/insertBoard.do")
    public ModelAndView insertBoard(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/blog/openBoardList.do");
        blogService.insertBoard(commandMap.getMap());
         
        return mv;
    }
    
    //ポスト詳細
    @RequestMapping(value="/blog/openBoardDetail.do")
    public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/blog/boardDetail");
        
        

        List<Map<String,Object>> map = blogService.selectBoardDetail(commandMap.getMap());
        List<Map<String,Object>> cate_list = blogService.selectCateList();
        List<Map<String,Object>> comment_list = blogService.selectComment(commandMap.getMap());
        mv.addObject("map",map);
        mv.addObject("cate_list",cate_list);
        mv.addObject("comment_list",comment_list);
        return mv;
    } 
    
    @RequestMapping(value="/blog/deleteBoard.do")
    public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/blog/openBoardList.do");
        blogService.deleteBoard(commandMap.getMap());
        
        return mv;
    }
    
    //更新するため詳細の取得と繊維をするメソード
    @RequestMapping(value="/blog/updateDetail.do")
    public ModelAndView updateDetail(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/blog/boardWrite");
        List<Map<String, Object>> map = blogService.selectBoardDetail(commandMap.getMap());
        List<Map<String, Object>> cate_list = blogService.selectCateList();
        
        mv.addObject("uDetail", map);
        mv.addObject("cate_list",cate_list);
        
        return mv;
    }
    
    //詳細画面で更新した内容をUPDATEするメソード
    @RequestMapping(value="/blog/updateBoard.do")
    public ModelAndView updateBoard(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/blog/openBoardList.do");
       
        System.out.println("POST_IDX : " + commandMap.get("POST_IDX"));
       System.out.println("WRITER : " + commandMap.get("WRITER"));
        //ポスト更新のSQLを実行
        blogService.updateBoard(commandMap.getMap());
        
        //修正された内容を確認のため、再取得
        List<Map<String,Object>> map = blogService.selectBoardDetail(commandMap.getMap());
        //左のカテゴリ区分を取得
        List<Map<String,Object>> cate_list = blogService.selectCateList();
        //上記で取得した情報を利用するために、ModelAndViewにセット
        mv.addObject("map",map);
        mv.addObject("cate_list",cate_list);
        
        return mv;
    }
    
    @RequestMapping(value="/blog/openBoardCate.do")
    public ModelAndView openBoardCategory(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/blog/boardList");
        //左のカテゴリ区分を取得
        List<Map<String,Object>> cate_list = blogService.selectCateList();
        mv.addObject("cate_list",cate_list);
        
        Map<String, Object> map = commandMap.getMap();
        mv.addObject("CATE_CODE",map.get("CATE_CODE"));
        mv.addObject("list_type", "cate");
        
        return mv;
    }
    @RequestMapping(value="/blog/selectBoardCate.do")
    public ModelAndView selectBoardCategory(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("jsonView");
        //選択したカテゴリのみで検索結果を抽出
        List<Map<String, Object>> map = blogService.selectBoardCategory(commandMap.getMap());
        //上記で取得した情報を利用するために、ModelAndViewにセット
        mv.addObject("list",map);
        if(map.size() > 0){
            mv.addObject("TOTAL", map.get(0).get("TOTAL_COUNT"));
        }
        else{
            mv.addObject("TOTAL", 0);
        }
        return mv;
    }
    
    @RequestMapping("/blog/insertComment.do")
    public ModelAndView insertComment(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/blog/boardDetail");
        //コメント登録
        blogService.insertComment(commandMap.getMap());
        //登録後再表示のための処理
        List<Map<String,Object>> map = blogService.selectBoardDetail(commandMap.getMap());
        List<Map<String,Object>> cate_list = blogService.selectCateList();
        List<Map<String,Object>> comment_list = blogService.selectComment(commandMap.getMap());
        //mvオブジェクトにセット
        mv.addObject("map",map);
        mv.addObject("cate_list",cate_list);
        mv.addObject("comment_list",comment_list);

        return mv;
    }
    @RequestMapping("/blog/join.do")
    public ModelAndView join(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/common/Join");
        return mv;
    }
    //ログイン認証アクション
    @RequestMapping("/blog/joinConfirm.do")
    public ModelAndView joinConfirm(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/blog/login.do");
        Map<String, Object> map = commandMap.getMap();
        blogService.insertUser(map);
        return mv;
    }
    //ポストリスト取得
    @RequestMapping("/blog/postList.do")
    public ModelAndView postList(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/blog/boardDetail");
        List<Map<String,Object>> map = blogService.selectBoardDetail(commandMap.getMap());
        List<Map<String,Object>> cate_list = blogService.selectCateList();
        List<Map<String,Object>> comment_list = blogService.selectComment(commandMap.getMap());
        //mvオブジェクトにセット
        mv.addObject("map",map);
        mv.addObject("cate_list",cate_list);
        mv.addObject("comment_list",comment_list);
        return mv;
    }
    @RequestMapping("/blog/logout.do")
    public ModelAndView logout(CommandMap commandMap, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("/blog/boardList");
        List<Map<String,Object>> cate_list = blogService.selectCateList();
        mv.addObject("cate_list", cate_list);
        request.getSession().removeAttribute("loginInfo");
        return mv;
    }
}
	
//内容確認のため
//for(String key : commandMap.getMap().keySet()){
//  String value = commandMap.getMap().get(key).toString();
//  log.debug(key + " : " + value);
//}
//for(String key : map.keySet()){
//  String value = map.get(key).toString();
//  log.debug(key + " : " + value);
//}
