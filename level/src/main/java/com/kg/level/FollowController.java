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
import com.kg.level.dao.CommentDAO;
import com.kg.level.dao.FollowDAO;
import com.kg.level.dao.MemberDAO;
import com.kg.level.dto.FollowDTO;
import com.kg.level.dto.MemberDTO;
import com.kg.level.dto.ObjectDTO;

@Controller
public class FollowController {

	@Autowired
	private SqlSessionTemplate sst;
	
	private FollowDAO fdao;
	private CommentDAO cdao;
	
	@RequestMapping("/clickFollow")
	public void clickFollow(FollowDTO fdto) {
		System.out.println(fdto.getFollowee_num()+"�ȷ���");
		System.out.println(fdto.getFollower_num()+"�ȷο�");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("follower_num", fdto.getFollower_num());
		map.put("followee_num", fdto.getFollowee_num());
		fdao = sst.getMapper(FollowDAO.class);
		fdao.clickFollow(map);
	}
	@RequestMapping("/clickUnFollow")
	public void clickUnFollow(FollowDTO fdto) {
		System.out.println(fdto.getFollowee_num()+"�ȷ���");
		System.out.println(fdto.getFollower_num()+"�ȷο�");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("follower_num", fdto.getFollower_num());
		map.put("followee_num", fdto.getFollowee_num());
		fdao = sst.getMapper(FollowDAO.class);
		fdao.clickUnFollow(map);
	}
	@RequestMapping(value="/followingList", produces="application/text;charset=utf-8")
	public @ResponseBody String followingList(int member_num) {
		fdao=sst.getMapper(FollowDAO.class);
		System.out.println(member_num);
		String json="";
		Map<String,Object> map = new HashMap<String,Object>();
		ArrayList<ObjectDTO> flist = fdao.followingList(member_num);
		map.put("flist", flist);
		ObjectMapper mapper = new ObjectMapper();
		try {
			json=mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return json;
	}
	
	@RequestMapping(value="/followerList", produces="application/text; charset=utf-8")
	public @ResponseBody String followerList(int member_num) {
		fdao=sst.getMapper(FollowDAO.class);
		String json="";
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ObjectDTO> flist = fdao.follower_List(member_num);
		map.put("flist", flist);
		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return json;
	}
	@RequestMapping(value="/findFollower_keyUp", produces="application/text; charset=utf-8")
	public @ResponseBody String findFollower_keyUp(MemberDTO mdto) {
		mdto.setNickName("%"+mdto.getNickName()+"%");
		mdto.setName("%"+mdto.getName()+"%");
		
		fdao=sst.getMapper(FollowDAO.class);
		cdao=sst.getMapper(CommentDAO.class);
		ArrayList<MemberDTO> mlist = fdao.search_followee(mdto);
		ArrayList<Integer> overlap_count = cdao.overlap_count();
		String json="";
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("mlist", mlist);
		map.put("overlap_count", overlap_count.get(0));
		for(MemberDTO dto : mlist) {
			System.out.println(dto.getName());
		}
		try {
			json=mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
}
