package com.kg.level;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kg.level.dao.CommentDAO;
import com.kg.level.dao.HistoryDAO;
import com.kg.level.dao.LikeDAO;
import com.kg.level.dto.HistoryDTO;
import com.kg.level.dto.LikeDTO;
import com.kg.level.dto.ObjectDTO;

@Controller
public class HistoryController {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	private HistoryDAO hdao;
	private CommentDAO cdao;
	private LikeDAO ldao;
	
	@RequestMapping("/historyWriteOk")
	public String histroyWriteOk(@RequestParam(value="file2") MultipartFile[] file,HistoryDTO hdto,HttpSession s) throws IllegalStateException, IOException {
		String upPath="C:/Users/wnstn/Desktop/프로젝트/level33/src/main/webapp/resources/history_upload_file/";
		//C:/Users/user/Desktop/level23/src/main/webapp/resources/history_upload_file/ 505호
		//C:/Users/kgitbank/Desktop/3조프로젝트/level20/src/main/webapp/resources/history_upload_file/ 501호
		//C:/Users/wnstn/Desktop/프로젝트/level26/src/main/webapp/resources/history_upload_file/ 집
		String file_name = "";
		for(int i=0; i<file.length; i++) {
			if(file[i].getOriginalFilename()=="") {
				break;
			}
			file_name+=file[i].getOriginalFilename()+"/";
			File f = new File(upPath+file[i].getOriginalFilename());
			file[i].transferTo(f);
		}
		hdto.setFile_name(file_name);
		hdto.setMember_num((Integer)s.getAttribute("member_num"));
		hdao=sst.getMapper(HistoryDAO.class);
		hdao.historyWrite(hdto);
		return "main";
	}
	

	@RequestMapping("/historyShareOk")
	public @ResponseBody String historyShareOk(HistoryDTO hdto) {
		// member_num, history_content, share_member_num, share_history_num
		hdao=sst.getMapper(HistoryDAO.class);		
		int res = hdao.historyShare(hdto);
		System.out.println(res);
		return "main";
	}
	
	@RequestMapping(value="/history_view",produces="application/text;charset=utf-8")
	public @ResponseBody String history_view(HttpServletResponse resp, int history_num, HttpSession s, int member_num) throws IOException {
		resp.setContentType("text/html; charset=UTF-8");
		DecimalFormat df = new DecimalFormat("##,###");
		hdao = sst.getMapper(HistoryDAO.class);
		cdao = sst.getMapper(CommentDAO.class);
		ldao = sst.getMapper(LikeDAO.class);
		int like_count = ldao.likeCount(history_num);
		String str_like_count = df.format(like_count); 
		ObjectDTO odto = hdao.historyView(history_num);
		ArrayList<ObjectDTO> clist = cdao.commentList(history_num);
		Map<String,Object> map = new HashMap<String, Object>();		
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + odto.getShare_member_num());
		
		
		if (odto.getShare_member_num() != 0) { //  공유글
			System.out.println(odto.getHistory_content());
			ObjectDTO odto2 = hdao.historyView_share(odto.getShare_history_num()); // 공유 원본 글 정보
			map.put("file_name", odto2.getFile_name());
			map.put("history_content", odto.getHistory_content());
			map.put("share_history_content", odto2.getHistory_content());
			map.put("nickName",odto.getNickName());
			map.put("share_nickName", odto2.getNickName());
			map.put("profile_img", odto.getProfile_img());
			map.put("share_profile_img", odto2.getProfile_img());
			map.put("share_member_num", odto.getShare_member_num());
			map.put("share_history_num", odto.getShare_history_num());
			map.put("write_date", odto.getWrite_date());
			map.put("clist", clist);
			map.put("like_count", str_like_count);
			map.put("owner_num", odto.getMember_num());
			map.put("history_addr", odto.getHistory_addr());
			map.put("x_pos", odto.getX_pos());
			map.put("y_pos", odto.getY_pos());			
		} else {
			map.put("file_name",odto.getFile_name());
			map.put("history_content", odto.getHistory_content());
			map.put("nickName",odto.getNickName());
			map.put("profile_img", odto.getProfile_img());
			map.put("write_date", odto.getWrite_date());
			map.put("clist", clist);
			map.put("like_count", str_like_count);
			map.put("owner_num", odto.getMember_num());
			map.put("history_addr", odto.getHistory_addr());
			map.put("x_pos", odto.getX_pos());
			map.put("y_pos", odto.getY_pos());		
			map.put("share_member_num", odto.getShare_member_num());
			map.put("share_history_content", odto.getHistory_content());
		}
		
		ArrayList<Integer> llist = ldao.likeCheck(history_num);
		for(int i=0; i<llist.size(); i++) {
			if(member_num==llist.get(i)) {
				odto.setLike("push");
			}
		}
		map.put("like_check", odto.getLike());
		
		ObjectMapper mapper = new ObjectMapper();
		String json = "";
		try {
			json=mapper.writeValueAsString(map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return json;		
	}
	
	@RequestMapping(value="/allHistory_add",produces="application/text; charset=utf-8")
	public @ResponseBody String allHistory2(int start_row, int end_row, int member_num, Model m) {
		System.out.println(start_row);
		System.out.println(end_row);
		System.out.println(member_num);
		ObjectMapper mapper = new ObjectMapper();
		hdao = sst.getMapper(HistoryDAO.class);
		Map<String,Object> param_map = new HashMap<String,Object>();		// 출력 개수 만큼 뽑아오기 5개
			param_map.put("start_row", start_row);
			param_map.put("end_row", end_row);
			param_map.put("member_num", member_num);
			
		ArrayList<ObjectDTO> hlist = hdao.historyList(param_map);
		for (int i = 0; i < hlist.size(); i++) {
			if(hlist.get(i).getShare_member_num() != 0) { // 공유한 글
				ObjectDTO odto = hdao.shareHistory(hlist.get(i).getShare_history_num());
				if (odto.getFile_name()!=null) {
					String[] sp_name = odto.getFile_name().split("/");
					hlist.get(i).setHistory_main_file(sp_name[0]);
				}				
			} else { // 내가 작성한 글
				if (hlist.get(i).getFile_name()!=null) {
					String[] sp_name = hlist.get(i).getFile_name().split("/");
					hlist.get(i).setHistory_main_file(sp_name[0]);
				}	
			}
		}
		
		ldao = sst.getMapper(LikeDAO.class);
		ArrayList<LikeDTO> llist = ldao.likeList(member_num);

		for(int i=0; i<hlist.size(); i++) {									//내가 좋아요 누른 게시물 찾기
			for(int j=0; j<llist.size(); j++) {
				if(hlist.get(i).getHistory_num()==llist.get(j).getHistory_num()) {
					hlist.get(i).setLike("push");
				}
			}
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
			map.put("hlist", hlist);
			cdao = sst.getMapper(CommentDAO.class);
		      ArrayList<ObjectDTO> clist = cdao.allCommentList();
		      ArrayList<Integer> overlap_count = cdao.overlap_count();	
		      map.put("clist", clist);
		      map.put("overlap_count", overlap_count.get(0));
		String json="";
		try {
			json=mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DecimalFormat df = new DecimalFormat("##,###");
		
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
		
		
		
		
		return json;
	}
	
	@RequestMapping(value="/historyInfo")
	public String historyInfo(Model m, int history_num, int member_num) {
		
		hdao = sst.getMapper(HistoryDAO.class);
		cdao = sst.getMapper(CommentDAO.class);
		ldao = sst.getMapper(LikeDAO.class);
		ArrayList<Integer> like_list = ldao.likeCheck(history_num);
		int like_count = ldao.likeCount(history_num);
		ArrayList<ObjectDTO> clist = cdao.commentList(history_num);
		ObjectDTO odto = hdao.historyView(history_num);
		ArrayList<Integer> overlap_count = cdao.overlap_count();
		System.out.println(overlap_count);
		for(int i=0; i<like_list.size(); i++) {
			if(like_list.get(i)==member_num) {
				odto.setLike("push");
			}
		}
		String[] file_name = odto.getFile_name().split("/");
		ArrayList<String> img_list = new ArrayList<String>();
		for(int i=0; i<file_name.length; i++) {
			if(file_name[i]==null) {
				return "main";
			}else {
				img_list.add(file_name[i]);
			}
		}
		m.addAttribute("overlap_count", overlap_count.get(0));
		m.addAttribute("like_count",like_count);
		m.addAttribute("clist", clist);
		m.addAttribute("history_num", history_num);
		m.addAttribute("img_list", img_list);
		m.addAttribute("odto", odto);
		m.addAttribute("center", "historyInfo.jsp");
		return "main";
	}
	@RequestMapping("/history_delete")
	public String history_delete(int history_num) {
		hdao=sst.getMapper(HistoryDAO.class);
		hdao.history_delete(history_num);
		
		return "redirect:myHistory";
	}
}
