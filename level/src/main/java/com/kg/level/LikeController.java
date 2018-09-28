package com.kg.level;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kg.level.dao.HistoryDAO;
import com.kg.level.dao.LikeDAO;
import com.kg.level.dao.MemberDAO;
import com.kg.level.dao.NewsDAO;
import com.kg.level.dto.LikeDTO;
import com.kg.level.dto.NewsDTO;

@Controller
public class LikeController {

	@Autowired
	private SqlSessionTemplate sst;
	
	private LikeDAO ldao;
	private NewsDAO ndao;
	private MemberDAO mdao;
	private HistoryDAO hdao;
	
	@RequestMapping(value="clickLike", produces="application/text; utf-8")
	public @ResponseBody String clickLike(LikeDTO ldto,NewsDTO ndto, int sender_num, int receiver_num) {
		
		System.out.println("�떎�뻾");
		Object reciever_num=ndto.getReceiver_num();
		ldao=sst.getMapper(LikeDAO.class);
		ndao=sst.getMapper(NewsDAO.class);
		mdao=sst.getMapper(MemberDAO.class);
		hdao=sst.getMapper(HistoryDAO.class);
		ldao.clickLike(ldto);
		hdao.up_like_count(ldto.getHistory_num());
		
		if(sender_num!=receiver_num) {			
			ndao.sendNews(ndto);
			mdao.newsUpdate(reciever_num);			
		}
			String json = "";
			Map<String, Object> map = new HashMap<String, Object>();
			int like_count = ldao.likeCount(ldto.getHistory_num());
			map.put("like_count", like_count);
			
			ObjectMapper mapper = new ObjectMapper();
			try {
				json=mapper.writeValueAsString(map);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return json;
	}
	@RequestMapping(value="/clickLikeCancel", produces="application/text; utf-8")
	public @ResponseBody String clickLikeCancel(LikeDTO ldto) {
		System.out.println(ldto.getHistory_num());
		System.out.println(ldto.getMember_num());
		ldao=sst.getMapper(LikeDAO.class);
		ldao.clickLikeCancel(ldto);
		hdao=sst.getMapper(HistoryDAO.class);
		hdao.down_like_count(ldto.getHistory_num());
		Map<String, Object> map = new HashMap<String, Object>();
		int like_count = ldao.likeCount(ldto.getHistory_num());
		map.put("like_count", like_count);
		String json = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			json=mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
}
