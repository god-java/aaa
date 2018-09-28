package com.kg.level.dao;

import java.util.ArrayList;

import com.kg.level.dto.CommentDTO;
import com.kg.level.dto.ObjectDTO;

public interface CommentDAO {

	public void commentWriteOk(CommentDTO cdto);
	public ArrayList<ObjectDTO> commentList(int history_num);
	public ArrayList<ObjectDTO> allCommentList();
	public ArrayList<Integer> overlap_count();
	public void update_overlapCount(CommentDTO cdto);
	public int max_comment_num();
}
