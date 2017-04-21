package com.interline.sample.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.interline.common.common.CommandMap;
import com.interline.sample.service.blogService;

@Controller
public class blogController {
    Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="blogService")
    private blogService blogService;
    
    
    @RequestMapping(value="/sample/openBoardList.do")
    public ModelAndView openSampleList(Map<String,Object> map) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/boardList");   
        List<Map<String,Object>> list = blogService.selectBoardList(map);
        List<Map<String,Object>> cate_list = blogService.selectBoardList(map);
        
        mv.addObject("list", list);
        mv.addObject("cate_list", cate_list);

        return mv;
    }
    @RequestMapping(value="/sample/testMapArgumentResolver.do")
    public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("");
         
        if(commandMap.isEmpty() == false){
            Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
            Entry<String,Object> entry = null;
            while(iterator.hasNext()){
                entry = iterator.next();
                log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
            }
        }
        return mv;
    }
    //ポスト作成に遷移
    @RequestMapping(value="/sample/openBoardWrite.do")
    public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/boardWrite");
         
        return mv;
    }
    //書き込み
    @RequestMapping(value="/sample/insertBoard.do")
    public ModelAndView insertBoard(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
         
        blogService.insertBoard(commandMap.getMap());
         
        return mv;
    }

}
	
