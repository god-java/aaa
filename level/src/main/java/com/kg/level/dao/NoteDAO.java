package com.kg.level.dao;

import java.util.ArrayList;
import java.util.Map;

import com.kg.level.dto.NoteDTO;
import com.kg.level.dto.ObjectDTO;

public interface NoteDAO {

	public ArrayList<ObjectDTO> note_list(int member_num);
	public ObjectDTO note_info(int note_num);
	public void read_check(int note_num);
	public void note_reply(NoteDTO note_dto);
	public int read_check_count(int member_num);
	public ArrayList<ObjectDTO> send_note_list(int member_num);
	public int send_note_count(int member_num);
	public ArrayList<ObjectDTO> send_note_list_row(Map<String, Object> map);
	public void send_note_delete(int note_num);
	public NoteDTO note_sender_receiver_delete(int note_num);
	public void note_delete(int note_num);
	public void all_delete_send_note(int member_num);
}
