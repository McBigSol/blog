package com.interline.sample.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import org.springframework.web.servlet.ModelAndView;

import com.interline.sample.service.blogService;

@Controller
public class blogController {
    Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="blogService")
    private blogService blogService;
    
 
    @RequestMapping(value="/sample/openSampleList.do")
    public ModelAndView openSampleList(Map<String,Object> map) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/boardList");
        
        List<Map<String,Object>> list = blogService.selectBoardList(map);
        mv.addObject("list", list);

        return mv;
    }
}
	
