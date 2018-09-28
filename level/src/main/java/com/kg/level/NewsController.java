package com.kg.level;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kg.level.dao.NewsDAO;
import com.kg.level.dto.MemberDTO;
import com.kg.level.dto.ObjectDTO;

@Controller
public class NewsController {

	@Autowired
	private SqlSessionTemplate sst;
	
	private NewsDAO ndao;
	
	@RequestMapping(value="/newsClick", produces="application/text;charset=UTF-8")
	public @ResponseBody String newsClick(int receiver_num){
		ndao=sst.getMapper(NewsDAO.class);
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ObjectDTO> nlist = ndao.newsList(receiver_num);
		ArrayList<MemberDTO> fnlist = new ArrayList<MemberDTO>();
		ArrayList<MemberDTO> lastList = new ArrayList<MemberDTO>();
		for(int i=0; i<nlist.size(); i++) {
			MemberDTO mdto = new MemberDTO();
			mdto = ndao.findSender(nlist.get(i).getSender_num());
			lastList.add(mdto);
		}
		for(int i=0; i<nlist.size(); i++) {
			nlist.get(i).setNickName(lastList.get(i).getNickName());
			nlist.get(i).setProfile_img(lastList.get(i).getProfile_img());
		}
		map.put("nlist", nlist);
		System.out.println(nlist);
		/*map.put("fff", "fff");*/
		String json="";
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
