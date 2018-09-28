package com.kg.level.dao;

import java.util.ArrayList;
import java.util.Map;

import com.kg.level.dto.MemberDTO;

public interface MemberDAO {

	public void join(MemberDTO mdto);
	public int overlap(String email);
	public int loginCheckId(MemberDTO mdto);
	public int loginCheckFinal(MemberDTO mdto);
	public void profile_img_update(Map<String, Object> map);
	public int member_num(MemberDTO mdto);
	public MemberDTO myInfo(Object member_num);
	public MemberDTO memberInfo(int member_num);
	public ArrayList<MemberDTO> memberSearch(String nickName);
	public void newsUpdate(int receiver_num);
	public ArrayList<MemberDTO> findMember_keyUp(MemberDTO mdto);
	public void access_status_on(int member_num);
	public void access_status_off(int member_num);
	public ArrayList<MemberDTO> member_access_list(int member_num);
	public void newsUpdate(Object reciever_num);
	public MemberDTO findOk_email1(MemberDTO mdto);
	public int findOk_email2(MemberDTO mdto);
	public MemberDTO findOk_password1(MemberDTO mdto);
	public int findOk_password2(MemberDTO mdto);
	public void modify_password(MemberDTO mdto);
	public void modify_member(MemberDTO mdto);
	
	public int delete_Ok_password(MemberDTO mdto);
	public void delete_code(MemberDTO mdto);
	public int delete_Ok_code(MemberDTO mdto);
	public void delete_Ok(MemberDTO mdto);
	public String email_find(MemberDTO mdto);
	
	public String password_find(MemberDTO mdto);
	public void modify_password_main2(MemberDTO mdto);
	
	public MemberDTO member_profile(int member_num);
}
