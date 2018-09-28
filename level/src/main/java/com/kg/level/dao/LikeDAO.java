package com.kg.level.dao;

import java.util.ArrayList;

import com.kg.level.dto.LikeDTO;

public interface LikeDAO {
	
	public void clickLike(LikeDTO ldto);
	public void clickLikeCancel(LikeDTO ldto);
	public ArrayList<LikeDTO> likeList(Object member_num);
	public int likeCount(int history_num);
	public ArrayList<Integer> likeCheck(int history_num);
}
