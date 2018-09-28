package com.kg.level.dao;

import java.util.ArrayList;
import java.util.Map;

import com.kg.level.dto.HistoryDTO;
import com.kg.level.dto.ObjectDTO;

public interface HistoryDAO {

	public void historyWrite(HistoryDTO hdto);
	public ArrayList<ObjectDTO> historyList(Map<String, Object> map);
	public ArrayList<ObjectDTO> memberHistory(Object member_num);
	public ObjectDTO historyView(int history_num);
	public int historyQtt(Object member_num);
	public void up_like_count(int history_num);
	public void down_like_count(int history_num);
	public ArrayList<ObjectDTO> best3_history();
	public void history_delete(int history_num);
	
	// share
	public int historyShare(HistoryDTO odto);
	public ObjectDTO shareHistory(int share_history_num);
	public ObjectDTO historyView_share(int share_history_num);
}
