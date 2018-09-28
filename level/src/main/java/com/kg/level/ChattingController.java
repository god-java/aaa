package com.kg.level;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kg.level.dao.ChattingDAO;
import com.kg.level.dao.MemberDAO;
import com.kg.level.dto.ChattingDTO;
import com.kg.level.dto.MemberDTO;

@Controller
public class ChattingController {

	@Autowired
	SqlSessionTemplate sst;
	ChattingDAO cdao;
	MemberDAO mdao;
	@RequestMapping(value="/chattingContent", produces="application/text; charset=utf-8")
	public @ResponseBody String chattingContent(ChattingDTO cdto) {
		cdao=sst.getMapper(ChattingDAO.class);
		mdao=sst.getMapper(MemberDAO.class);
		MemberDTO mdto = mdao.memberInfo(cdto.getMember2_num());
		ArrayList<ChattingDTO> chatList = cdao.chattingContent(cdto);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("chatList", chatList);
		map.put("mdto", mdto);
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
	
	@RequestMapping("/chatWrite")
	public void chatWrite(ChattingDTO cdto, HttpServletResponse resp) throws IOException {
		System.out.println(cdto.getChatting_content());
		System.out.println(cdto.getChatting_sender_num());
		System.out.println(cdto.getMember1_num());
		System.out.println(cdto.getMember2_num());
		cdao = sst.getMapper(ChattingDAO.class);
		cdao.chatWrite(cdto);
		resp.getWriter().print("!!!");
	}
}
