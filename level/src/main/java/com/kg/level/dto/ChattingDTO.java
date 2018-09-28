package com.kg.level.dto;

public class ChattingDTO {

	private int chatting_num;
	private int member1_num;
	private int member2_num;
	private int chatting_sender_num;
	private String send_date;
	private String chatting_content;
	public int getChatting_num() {
		return chatting_num;
	}
	public void setChatting_num(int chatting_num) {
		this.chatting_num = chatting_num;
	}
	public int getMember1_num() {
		return member1_num;
	}
	public void setMember1_num(int member1_num) {
		this.member1_num = member1_num;
	}
	public int getMember2_num() {
		return member2_num;
	}
	public void setMember2_num(int member2_num) {
		this.member2_num = member2_num;
	}
	public int getChatting_sender_num() {
		return chatting_sender_num;
	}
	public void setChatting_sender_num(int chatting_sender_num) {
		this.chatting_sender_num = chatting_sender_num;
	}
	public String getSend_date() {
		return send_date;
	}
	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}
	public String getChatting_content() {
		return chatting_content;
	}
	public void setChatting_content(String chatting_content) {
		this.chatting_content = chatting_content;
	}
	
	
}
