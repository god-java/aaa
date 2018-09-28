package com.kg.level.dto;

public class NoteDTO {

	private int note_num;
	private int sender_num;
	private int receiver_num;
	private String note_content;
	private String send_date;
	private String read_check;
	private String sender_delete;
	private String receiver_delete;
	public String getSender_delete() {
		return sender_delete;
	}
	public void setSender_delete(String sender_delete) {
		this.sender_delete = sender_delete;
	}
	public String getReceiver_delete() {
		return receiver_delete;
	}
	public void setReceiver_delete(String receiver_delete) {
		this.receiver_delete = receiver_delete;
	}
	public int getNote_num() {
		return note_num;
	}
	public void setNote_num(int note_num) {
		this.note_num = note_num;
	}
	public int getSender_num() {
		return sender_num;
	}
	public void setSender_num(int sender_num) {
		this.sender_num = sender_num;
	}
	public int getReceiver_num() {
		return receiver_num;
	}
	public void setReceiver_num(int receiver_num) {
		this.receiver_num = receiver_num;
	}
	public String getNote_content() {
		return note_content;
	}
	public void setNote_content(String note_content) {
		this.note_content = note_content;
	}
	public String getSend_date() {
		return send_date;
	}
	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}
	public String getRead_check() {
		return read_check;
	}
	public void setRead_check(String read_check) {
		this.read_check = read_check;
	}
	
}
