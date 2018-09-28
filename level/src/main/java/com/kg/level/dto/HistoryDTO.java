package com.kg.level.dto;

public class HistoryDTO {

	private int histroy_num;
	private int member_num;
	private String history_content;
	private String file_name;
	private int like_count;
	private String write_date;
	private String like;
	private String history_addr;
	private String x_pos;
	private String y_pos;
	private String strLike_count;
	private int share_member_num;
	private int share_history_num;
	
	public int getShare_member_num() {
		return share_member_num;
	}
	public void setShare_member_num(int share_member_num) {
		this.share_member_num = share_member_num;
	}
	public int getShare_history_num() {
		return share_history_num;
	}
	public void setShare_history_num(int share_history_num) {
		this.share_history_num = share_history_num;
	}
	public String getStrLike_count() {
		return strLike_count;
	}
	public void setStrLike_count(String strLike_count) {
		this.strLike_count = strLike_count;
	}
	public String getHistory_addr() {
		return history_addr;
	}
	public void setHistory_addr(String history_addr) {
		this.history_addr = history_addr;
	}
	public String getX_pos() {
		return x_pos;
	}
	public void setX_pos(String x_pos) {
		this.x_pos = x_pos;
	}
	public String getY_pos() {
		return y_pos;
	}
	public void setY_pos(String y_pos) {
		this.y_pos = y_pos;
	}
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}
	public int getHistroy_num() {
		return histroy_num;
	}
	public void setHistroy_num(int histroy_num) {
		this.histroy_num = histroy_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	public String getHistory_content() {
		return history_content;
	}
	public void setHistory_content(String history_content) {
		this.history_content = history_content;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
}
