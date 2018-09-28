package com.kg.level.dao;

import java.util.ArrayList;

import com.kg.level.dto.ChattingDTO;

public interface ChattingDAO {
	
	public void chatWrite(ChattingDTO cdto);
	public ArrayList<ChattingDTO> chattingContent(ChattingDTO cdto);
}
