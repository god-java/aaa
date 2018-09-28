package com.kg.level;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kg.level.dao.CommentDAO;
import com.kg.level.dao.FollowDAO;
import com.kg.level.dao.HistoryDAO;
import com.kg.level.dao.LikeDAO;
import com.kg.level.dao.MemberDAO;
import com.kg.level.dto.FollowDTO;
import com.kg.level.dto.MemberDTO;
import com.kg.level.dto.ObjectDTO;

@Controller
public class MainController {

	private MemberDAO mdao;
	private HistoryDAO hdao;
	private LikeDAO ldao;
	private CommentDAO cdao;
	private FollowDAO fdao;
	public static ArrayList<String> loginList = new ArrayList<String>();
	@Autowired
	private SqlSessionTemplate sst;

	@RequestMapping("/main")
	public String main(Model m) {
		m.addAttribute("center", "join.jsp");
		m.addAttribute("main","main");
		return "main";
	}
	@RequestMapping("/allHistory")
	public String allHistory(Model m,HttpSession s) {
	/*	DecimalFormat df = new DecimalFormat("##,###");
		Object member_num = s.getAttribute("member_num");
		if(member_num==null) {
			m.addAttribute("center", "myHistory.jsp");
			m.addAttribute("member_num", member_num);
		return "main";
		}
		hdao=sst.getMapper(HistoryDAO.class);
		ldao=sst.getMapper(LikeDAO.class);
		cdao=sst.getMapper(CommentDAO.class);
		ArrayList<ObjectDTO> hlist = hdao.historyList(member_num);
		ArrayList<LikeDTO> llist = ldao.likeList(member_num);
		ArrayList<ObjectDTO> clist = cdao.allCommentList();
		for(int i=0; i<hlist.size(); i++) {
			for(int j=0; j<llist.size(); j++) {
				if(hlist.get(i).getHistory_num()==llist.get(j).getHistory_num()) {
					hlist.get(i).setLike("push");
				}				
			}
			if(hlist.get(i).getFile_name()!=null) {
				String[] sp_name=hlist.get(i).getFile_name().split("/");
				hlist.get(i).setHistory_main_file(sp_name[0]);
				hlist.get(i).setExtension(hlist.get(i).getHistory_main_file().substring(hlist.get(i).getHistory_main_file().length()-3));
			}
		}
		
		ArrayList<ObjectDTO> bestList = hdao.best3_history();
		for(int i=0; i<bestList.size(); i++) {
			if(bestList.get(i).getFile_name()!=null) {
				String[] file_name = bestList.get(i).getFile_name().split("/");
				bestList.get(i).setFile_name(file_name[0]);
			}
			bestList.get(i).setStrLike_count(df.format(bestList.get(i).getLike_count()));
			bestList.get(i).setWrite_date(bestList.get(i).getWrite_date().substring(0, 11));
		}
		
		
		m.addAttribute("bestList", bestList);
		m.addAttribute("hlist", hlist);
		m.addAttribute("clist", clist);*/
		DecimalFormat df = new DecimalFormat("##,###");
		hdao = sst.getMapper(HistoryDAO.class);
		ArrayList<ObjectDTO> bestList = hdao.best3_history();
		for(int i=0; i<bestList.size(); i++) {
			if(bestList.get(i).getFile_name()!=null) {
				String[] file_name = bestList.get(i).getFile_name().split("/");
				bestList.get(i).setFile_name(file_name[0]);
			}
			bestList.get(i).setStrLike_count(df.format(bestList.get(i).getLike_count()));
			bestList.get(i).setWrite_date(bestList.get(i).getWrite_date().substring(0, 11));
		}
		
		
		m.addAttribute("bestList", bestList);
		m.addAttribute("center", "allHistory3.jsp");
		return "main";
	}

	@RequestMapping("/myHistory")
	public String myHistory(Model m, HttpSession s) {
		Object member_num = s.getAttribute("member_num");
		System.out.println(member_num);
		if(member_num==null) {
			m.addAttribute("center", "myHistory.jsp");
			m.addAttribute("member_num", member_num);
			return "main";
		}
		mdao=sst.getMapper(MemberDAO.class);
		fdao=sst.getMapper(FollowDAO.class);
		DecimalFormat df = new DecimalFormat("##,###");
		
		
		hdao=sst.getMapper(HistoryDAO.class);
		ldao=sst.getMapper(LikeDAO.class);
		ArrayList<ObjectDTO> hlist = hdao.memberHistory(member_num);
		for (int i = 0; i < hlist.size(); i++) {
			if(hlist.get(i).getShare_member_num() != 0) { // ������ ��
				ObjectDTO odto = hdao.shareHistory(hlist.get(i).getShare_history_num());
				if (odto.getFile_name()!=null) {
					String[] sp_name = odto.getFile_name().split("/");
					hlist.get(i).setHistory_main_file(sp_name[0]);
				}				
			} else { // ���� �ۼ��� ��
				if (hlist.get(i).getFile_name()!=null) {
					String[] sp_name = hlist.get(i).getFile_name().split("/");
					hlist.get(i).setHistory_main_file(sp_name[0]);
				}	
			}
		}
		
		m.addAttribute("hlist", hlist);
		MemberDTO mdto = mdao.myInfo(member_num);
		int follow_qtt = fdao.followQtt(member_num);
		int following_qtt = fdao.followingQtt(member_num);
		int history_qtt = hdao.historyQtt(member_num);
		String strFollow_qtt = df.format(follow_qtt);
		String strFollowing_qtt = df.format(following_qtt);
		String strHistory_qtt = df.format(history_qtt);
		mdto.setHistory_qtt(strHistory_qtt);
		mdto.setFollow_qtt(strFollow_qtt);
		mdto.setFollowing_qtt(strFollowing_qtt);
		m.addAttribute("mdto", mdto);
		m.addAttribute("center", "myHistory.jsp");
		
		
		return "main";
	}
	@RequestMapping("/history")
	public String history(Model m, int member_num, HttpSession s) {
		mdao=sst.getMapper(MemberDAO.class);
		fdao=sst.getMapper(FollowDAO.class);
		DecimalFormat df = new DecimalFormat("##,###");
		
		hdao=sst.getMapper(HistoryDAO.class);
		ldao=sst.getMapper(LikeDAO.class);
		ArrayList<ObjectDTO> hlist = hdao.memberHistory(member_num);
		for (int i = 0; i < hlist.size(); i++) {
			if(hlist.get(i).getShare_member_num() != 0) { // ������ ��
				ObjectDTO odto = hdao.shareHistory(hlist.get(i).getShare_history_num());
				if (odto.getFile_name()!=null) {
					String[] sp_name = odto.getFile_name().split("/");
					hlist.get(i).setHistory_main_file(sp_name[0]);
				}				
			} else { // ���� �ۼ��� ��
				if (hlist.get(i).getFile_name()!=null) {
					String[] sp_name = hlist.get(i).getFile_name().split("/");
					hlist.get(i).setHistory_main_file(sp_name[0]);
				}	
			}
		}
		
		m.addAttribute("hlist", hlist);
		MemberDTO mdto = mdao.myInfo(member_num);
		int follow_qtt = fdao.followQtt(member_num);
		int following_qtt = fdao.followingQtt(member_num);
		int history_qtt = hdao.historyQtt(member_num);
		String strFollow_qtt = df.format(follow_qtt);
		String strFollowing_qtt = df.format(following_qtt);
		String strHistory_qtt = df.format(history_qtt);
		Object my_num = s.getAttribute("member_num");
		ArrayList<FollowDTO> follower_list = fdao.followerList(my_num);
		for(int i=0; i<follower_list.size(); i++) {
			if(follower_list.get(i).getFollowee_num()==member_num) {
				mdto.setFollow("follow");
			}
		}
		mdto.setHistory_qtt(strHistory_qtt);
		mdto.setFollow_qtt(strFollow_qtt);
		mdto.setFollowing_qtt(strFollowing_qtt);
		m.addAttribute("mdto", mdto);
		m.addAttribute("center", "history.jsp");
		return "main";
	}
	
	@RequestMapping("/socket")
	public String socket() {
		return "socket";
	}
	@RequestMapping("/memberList")
	public String memberList() {
		
		return "memberList";
	}
	@RequestMapping("/hehe")
	public String hehe(Model m) {
		m.addAttribute("center","hehe.jsp");
		return "main";
	}
	@RequestMapping("/index2")
	public String index2() {
		return "index2";
	}
	@RequestMapping("/delete_modify")
	public String delete_modify(Model m,HttpSession s) {
		m.addAttribute("center", "delete_modify.jsp");
		m.addAttribute("main","main");
		Object member_num = s.getAttribute("member_num");
		MemberDTO mdto = mdao.myInfo(member_num);
		m.addAttribute("mdto", mdto);
		return "main";
	}
}
