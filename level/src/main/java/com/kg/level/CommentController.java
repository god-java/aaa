package com.kg.level;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kg.level.dao.CommentDAO;
import com.kg.level.dao.NewsDAO;
import com.kg.level.dto.CommentDTO;
import com.kg.level.dto.NewsDTO;
import com.kg.level.dto.ObjectDTO;

@Controller
public class CommentController {

	@Autowired
	private SqlSessionTemplate sst;
	
	private CommentDAO cdao;
	private NewsDAO ndao;
	
	@RequestMapping(value="/commentWriteOk",produces="application/text;charset=UTF-8")
	public @ResponseBody String commentWriteOk(CommentDTO cdto, NewsDTO ndto,String tag) {
		System.out.println(tag);
		int history_num=cdto.getHistory_num();
		cdao=sst.getMapper(CommentDAO.class);
		ndao=sst.getMapper(NewsDAO.class);
		cdao.commentWriteOk(cdto);
		int res=cdao.max_comment_num();
		cdto.setComment_num(res);
		if (cdto.getOverlap_count()!=0) {
			cdao.update_overlapCount(cdto);
		}		
		ndao.sendNews(ndto);
		ArrayList<ObjectDTO> clist = cdao.commentList(history_num);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clist", clist);
		ObjectMapper mapper = new ObjectMapper();
		String json="";
		try {
			json=mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(tag==null) {
			tag = "/";
		}
		if(!tag.equals("/")||tag!=null||tag!="") {
			if(!tag.equals("undefined")) {			
				String[] splTag = tag.split("/");
				for(int i=1; i<splTag.length; i++) {
					if(!splTag[i].equals("undefined")) {
						System.out.println(splTag[i]);
						int k = Integer.parseInt(splTag[i].trim());
						System.out.println(k);
						ndto.setReceiver_num(k);
						ndto.setType(7);
						System.out.println(ndto.getType()+"Ÿ��");
						ndao.sendNews(ndto);
						System.out.println("~~~~"+splTag[i]);
					}
				}
			}
		}
		
		return json;
		
	}
	
	@RequestMapping(value="comment_write")
	public void comment_write(String tag) {
		System.out.println(tag);
		String[] splTag = tag.split("/");
		for(int i=0; i<splTag.length; i++) {
				for(int j=0; j<splTag.length; j++) {
					if(!splTag[i].equals(splTag[j])) {
						splTag[j]="";
						System.out.println("!!!!");
					}
				}
		}
		for(int i=0; i<splTag.length; i++) {
			System.out.println(splTag[i]);
		}
	}
}
