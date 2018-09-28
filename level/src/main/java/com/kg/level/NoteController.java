package com.kg.level;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kg.level.dao.MemberDAO;
import com.kg.level.dao.NoteDAO;
import com.kg.level.dto.MemberDTO;
import com.kg.level.dto.NoteDTO;
import com.kg.level.dto.ObjectDTO;

@Controller
public class NoteController {
	@Autowired
	private SqlSessionTemplate sst;
	
	private NoteDAO ndao;
	private MemberDAO mdao;
	
	@RequestMapping(value="/note_list",produces="application/text; charset=utf-8")
	public @ResponseBody String note_list(int member_num){
		ndao=sst.getMapper(NoteDAO.class);
		ArrayList<ObjectDTO> note_list = ndao.note_list(member_num);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("note_list", note_list);
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
	@RequestMapping(value="/note_info", produces="application/text; charset=utf-8")
	public @ResponseBody String note_info(int note_num, int member_num, HttpSession s) {
		ndao = sst.getMapper(NoteDAO.class);
		ObjectDTO odto = ndao.note_info(note_num);
		ndao.read_check(note_num);
		int note_count = ndao.read_check_count(member_num);
		s.setAttribute("note_count", note_count);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("note_count", note_count);
		map.put("note_info", odto);
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
	@RequestMapping(value="/note_reply")
	public void note_reply(NoteDTO note_dto, HttpServletResponse resp) {
		System.out.println("ï¿½ï¿½ï¿½Ã¶ï¿½ï¿½ï¿½");
		int res = 0;
		ndao = sst.getMapper(NoteDAO.class);
		ndao.note_reply(note_dto);
		res = 1;
		try {
			resp.getWriter().print(res);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/note_count")
	public void note_count(int member_num, HttpServletResponse resp) throws IOException {
		System.out.println("!@#!@#!@$!@%%!@%@#jjj");
		ndao = sst.getMapper(NoteDAO.class);
		int note_count = ndao.read_check_count(member_num);
		resp.getWriter().println(note_count);
	}
	@RequestMapping(value="send_note_list", produces="application/text; charset=utf-8")
	public @ResponseBody String send_note_list(int member_num) {
		System.out.println("!!~~SS");
		ndao = sst.getMapper(NoteDAO.class);
		mdao = sst.getMapper(MemberDAO.class);
		ArrayList<ObjectDTO> send_note_list = ndao.send_note_list(member_num);
		for(int i=0; i<send_note_list.size(); i++) {
			MemberDTO mdto = mdao.member_profile(send_note_list.get(i).getReceiver_num());
			send_note_list.get(i).setProfile_img(mdto.getProfile_img());
			send_note_list.get(i).setNickName(mdto.getNickName());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("send_note_list", send_note_list);
		String json="";
		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	@RequestMapping("/noteList")
	public String all_note_list(Model m, int member_num, String pageNum, String receive, String send) {
		ndao = sst.getMapper(NoteDAO.class);
		int pageSize = 19;
		String pageNumber = pageNum;
		int currentPage;
		if(pageNumber==null) {
			currentPage=1;
			System.out.println("³Î~");
		}else {
			currentPage = Integer.parseInt(pageNumber);
			System.out.println("³ë³Î~");
		}
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int count=ndao.send_note_count(member_num);
		
		
		if(count>0) {
			int pageCount = count/pageSize+(count%pageSize==0?0:1);
			int startPage = 0;
			if(currentPage%10==0) {
				startPage = ((int)(currentPage/10)-1)*10+1;
				System.out.println("µé¾î¿È");
			}else {
				startPage = (currentPage/10)*10+1;
			}
			int pageBlock = 10;
			int endPage = startPage+pageBlock-1;
			if(endPage>pageCount) endPage=pageCount;
			System.out.println(startPage+"start");
			System.out.println(endPage+"end");
			m.addAttribute("startPage", startPage);
			m.addAttribute("endPage", endPage);
			m.addAttribute("currenPage", currentPage);
			m.addAttribute("pageCount", pageCount);
			
		}
		
		if(receive==null) {
			receive="1";
		}
		if(send==null) {
			send="0";
		}
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("member_num", member_num);
		map.put("sender_delete", "x");
		ArrayList<ObjectDTO> nlist = ndao.send_note_list_row(map);
		
		m.addAttribute("center", "noteList.jsp");
		m.addAttribute("receive", receive);
		m.addAttribute("send", send);
		m.addAttribute("nlist", nlist);
		return "main";
	}
	@RequestMapping("/delete_send_note")
	public String delete_send_note(@RequestParam(value="note_num") List<Integer> note_num,Model m, int member_num) {
		ndao = sst.getMapper(NoteDAO.class);
		for(int i=0; i<note_num.size(); i++) {
			ndao.send_note_delete(note_num.get(i));								//sender_delete¸¦ "o"·Î ¹Ù²ãÁÖ±â
			NoteDTO ndto = ndao.note_sender_receiver_delete(note_num.get(i));
			if(ndto.getSender_delete().equals("o") && ndto.getReceiver_delete().equals("o")) {//sender_delete, receiver_delete µÑ ´Ù "o"¸é
				ndao.note_delete(note_num.get(i));										//»èÁ¦
				System.out.println("»èÁ¦~!~!");
			}
		}
		m.addAttribute("member_num", member_num);
		return "redirect:noteList";
		
	}
	@RequestMapping("/all_delete_send_note")
	public String all_delete_send_note(int member_num, Model m) {
		ndao=sst.getMapper(NoteDAO.class);
		ndao.all_delete_send_note(member_num);
		m.addAttribute("member_num", member_num);
		return "redirect:noteList";
		
	}
}
