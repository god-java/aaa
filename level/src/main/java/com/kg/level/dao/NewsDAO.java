package com.kg.level.dao;

import java.util.ArrayList;

import com.kg.level.dto.MemberDTO;
import com.kg.level.dto.NewsDTO;
import com.kg.level.dto.ObjectDTO;

public interface NewsDAO {

	public void sendNews(NewsDTO ndto);
	public ArrayList<ObjectDTO> newsList(int receiver_num);
	public MemberDTO findSender(int member_num);
}
