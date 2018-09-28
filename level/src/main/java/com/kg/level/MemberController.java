package com.kg.level;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kg.level.dao.FollowDAO;
import com.kg.level.dao.MemberDAO;
import com.kg.level.dao.NoteDAO;
import com.kg.level.dto.FollowDTO;
import com.kg.level.dto.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private JavaMailSender mailSender;

	private MemberDAO mdao;
	private FollowDAO fdao;
	private NoteDAO ndao;
	
	@RequestMapping("/joinOk")
	public void joinOk(MemberDTO mdto,HttpServletResponse resp) throws IOException {
		System.out.println(mdto.getEmail());
		mdao = sst.getMapper(MemberDAO.class);
		int res = mdao.overlap(mdto.getEmail());
		if(res==0) {
			mdao.join(mdto);
		}else {
			resp.getWriter().print(res);
		}
	}
	@RequestMapping(value="loginOk",produces="application/text; charset=utf-8")
	public @ResponseBody String loginOk(MemberDTO mdto, HttpServletResponse resp, HttpSession s) {
		System.out.println(mdto.getEmail());
		System.out.println(mdto.getPassword());
		mdao = sst.getMapper(MemberDAO.class);
		ndao = sst.getMapper(NoteDAO.class);
		String json="";
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> map = new HashMap<String,Object>();
		
		int login=0;						
		int res=mdao.loginCheckId(mdto);	
		if(res==0) {						
			map.put("res", res);
		}else {
			login=mdao.loginCheckFinal(mdto);		
			if(login>0) {	
				int member_num = mdao.member_num(mdto);
				s.setAttribute("member_num", member_num);
				int note_count = ndao.read_check_count(member_num);
				s.setAttribute("note_count", note_count);
				System.out.println(note_count+"note!!!");
				res=1;
				map.put("res", res);
				map.put("member_num", member_num);
			}else {
				res=2;
				login=2;
				map.put("res", res);
			}
		}
		try {
			json=mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	@RequestMapping("/profile_img_update")
	public String profile_img_update(@RequestParam(value="file") MultipartFile file, int member_num, Model m, HttpSession s) throws IllegalStateException, IOException {

		String upPath="C:/Users/wnstn/Desktop/프로젝트/level33/src/main/webapp/resources/profile_img/";
		File f = new File(upPath+file.getOriginalFilename());
		file.transferTo(f);
		Map<String, Object> map = new HashMap<String, Object>();
		String file_name=file.getOriginalFilename();
		System.out.println("..."+file_name);
		System.out.println("..."+member_num);
		map.put("file_name", file_name);
		map.put("member_num", member_num);
		mdao=sst.getMapper(MemberDAO.class);
		mdao.profile_img_update(map);
		m.addAttribute("center", "history.jsp");
		return "main";
	}
	@RequestMapping("/search")
	public String search(String nickName, Model m,HttpSession s) {
		Object member_num = s.getAttribute("member_num");
		if(member_num==null) {
			m.addAttribute("center", "search.jsp");
			return "main";
		}
		mdao=sst.getMapper(MemberDAO.class);
		String nick = nickName;
		nickName = "%"+nickName+"%";
		System.out.println(nickName);
		ArrayList<MemberDTO> mlist = mdao.memberSearch(nickName);
		
		
		//--------follow block--------
		fdao=sst.getMapper(FollowDAO.class);
		
		ArrayList<FollowDTO> flist = fdao.followerList(member_num);
		
		for(int i=0; i<mlist.size(); i++) {
			for(int j=0; j<flist.size(); j++) {
				if(mlist.get(i).getMember_num()==flist.get(j).getFollowee_num()) {
					mlist.get(i).setFollow("follow");
				}
			}
		}	
		
		m.addAttribute("nickName", nick);
		m.addAttribute("mlist", mlist);
		m.addAttribute("center", "search.jsp");
		return "main";
	}
	
	@RequestMapping(value="/findMember_keyUp", produces="application/text; charset=utf-8")
	public @ResponseBody String findMember_keyUp(MemberDTO mdto) {
		mdto.setNickName("%"+mdto.getNickName()+"%");
		mdto.setEmail("%"+mdto.getEmail()+"%");
		
		mdao=sst.getMapper(MemberDAO.class);
		ArrayList<MemberDTO> mlist = mdao.findMember_keyUp(mdto);
		String json="";
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("mlist", mlist);
		try {
			json=mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping(value="/access_list", produces="application/text; charset=UTF-8")
	public @ResponseBody String access_list(int member_num) {
		mdao=sst.getMapper(MemberDAO.class);
		ArrayList<MemberDTO> socList = mdao.member_access_list(member_num);
		ObjectMapper mapper = new ObjectMapper();
		String json="";
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("socList", socList);
		try {
			json=mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	@RequestMapping("/logout")
	public String logout(HttpSession s) {
		s.invalidate();
		return "redirect:main";
	}
	@RequestMapping(value="/findOk_email", produces="application/text; charset=utf-8")
	public @ResponseBody String findOk_email(MemberDTO mdto) {
		mdao=sst.getMapper(MemberDAO.class);
		MemberDTO dto = new MemberDTO();		
		int res = mdao.findOk_email2(mdto);
		if(res > 0) {
			dto = mdao.findOk_email1(mdto);
			return dto.getEmail();
		} else {
			return "x";
		}		
	}
	
	@RequestMapping(value="/findOk_password", produces="application/text; charset=utf-8")
	public @ResponseBody String findOk_password(MemberDTO mdto) throws MessagingException {
		int ran = (int)(Math.random()*1000000);
		String strRan = String.valueOf(ran);
		mdao=sst.getMapper(MemberDAO.class);
		MemberDTO dto = new MemberDTO();
		int res = mdao.findOk_password2(mdto);
		if(res > 0) {
			mdto.setPassword(strRan);
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper =  new MimeMessageHelper(message ,true,"utf-8");
			helper.setTo(mdto.getEmail());
			helper.setSubject(mdto.getName()+"님 안녕하세요 'level' 입니다.");
			helper.setText("회원님의 임시 비밀번호는 "+strRan+" 입니다");
			mailSender.send(message);
			mdao.modify_password(mdto);
		} else {
			return "x";
		}
		return null;
	}
	
	@RequestMapping(value="/profile_modifyOk", produces="applcation/text; charset=utf-8")
	public @ResponseBody String modifyOk_member(MemberDTO mdto) {
		mdao=sst.getMapper(MemberDAO.class);
		mdao.modify_member(mdto);
		return null;
	}
	
	@RequestMapping(value="/delete_member", produces="applcation/text; charset=utf-8")
	public @ResponseBody String delete_modify_pw(MemberDTO mdto) throws MessagingException {
		System.out.println(mdto.getPassword());
		int ran = (int)(Math.random()*1000000);
		String strRan = String.valueOf(ran);
		mdao=sst.getMapper(MemberDAO.class);
		mdao.delete_Ok_password(mdto);
		int res = mdao.delete_Ok_password(mdto);
		System.out.println(res);
		if(res>0) {
			mdto.setLeave_code(strRan);
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper =  new MimeMessageHelper(message ,true,"utf-8");
			String email = mdao.email_find(mdto);
			helper.setTo(email);
			helper.setSubject(mdto.getName()+"님 안녕하세요 'level' 입니다.");
			helper.setText("회원님의 탈퇴 인증번호는 "+strRan+" 입니다");
			mailSender.send(message);
			mdao.delete_code(mdto);
		}else {
			return "x";
		}
		return null;
	}
	
	@RequestMapping(value="/delete_Ok_member", produces="applcation/text; charset=utf-8")
	public @ResponseBody String delete_modify_Ok_pw(MemberDTO mdto) {
		mdao=sst.getMapper(MemberDAO.class);
		System.out.println(mdto.getLeave_code());
		int res = mdao.delete_Ok_code(mdto);
		if(res>0)
		{
			mdao.delete_Ok(mdto);
		}else
		{
			return "x";
		}
		return null;
	}
	
	@RequestMapping(value="/password_modifyOk", produces="applcation/text; charset=utf-8")
	public void modifyOk_password(MemberDTO mdto, HttpServletResponse resp) throws IOException {
		mdao=sst.getMapper(MemberDAO.class);
		String password = mdao.password_find(mdto);
		if(mdto.getPassword().equals(password)) {
			resp.getWriter().print("o");
		}else {
			resp.getWriter().print("x");
		}
		
		
	}
	
	@RequestMapping(value="/password_modifyOk2", produces="applcation/text; charset=utf-8")
	public @ResponseBody String modifyOk_password2(MemberDTO mdto) {
		mdao=sst.getMapper(MemberDAO.class);
		mdao.modify_password_main2(mdto);
		return null;
	}
}






