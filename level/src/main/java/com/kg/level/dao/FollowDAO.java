package com.kg.level.dao;

import java.util.ArrayList;
import java.util.Map;

import com.kg.level.dto.FollowDTO;
import com.kg.level.dto.MemberDTO;
import com.kg.level.dto.ObjectDTO;

public interface FollowDAO {

	public void clickFollow(Map<String, Object> map);
	public ArrayList<FollowDTO> followerList(Object member_num);
	public ArrayList<FollowDTO> followeeList(Object member_num);
	public void clickUnFollow(Map<String, Object> map);
	public int followQtt(Object member_num);
	public int followingQtt(Object member_num);
	public ArrayList<ObjectDTO> followingList(int member_num);
	public ArrayList<ObjectDTO> follower_List(int member_num);
	public ArrayList<MemberDTO> search_followee(MemberDTO mdto);
}
