package com.kg.level.dto;

public class MemberDTO {

	private int member_num;
	private String name;
	private String email;
	private String nickName;
	private String password;
	private String profile_img;
	private String phone1;
	private String phone2;
	private String phone3;
	private String join_date;
	private String introduce;
	private String follow; //db nononono!!
	private String history_qtt;	//db nono
	private String follow_qtt;		//db nono
	private String following_qtt;	//db no
	private int news;
	private String access_status;
	private String leave_code;
	public String getLeave_code() {
		return leave_code;
	}
	public void setLeave_code(String leave_code) {
		this.leave_code = leave_code;
	}
	public String getAccess_status() {
		return access_status;
	}
	public void setAccess_status(String access_status) {
		this.access_status = access_status;
	}
	public int getNews() {
		return news;
	}
	public void setNews(int news) {
		this.news = news;
	}
	public String getHistory_qtt() {
		return history_qtt;
	}
	public void setHistory_qtt(String history_qtt) {
		this.history_qtt = history_qtt;
	}
	public String getFollow_qtt() {
		return follow_qtt;
	}
	public void setFollow_qtt(String follow_qtt) {
		this.follow_qtt = follow_qtt;
	}
	public String getFollowing_qtt() {
		return following_qtt;
	}
	public void setFollowing_qtt(String following_qtt) {
		this.following_qtt = following_qtt;
	}
	public String getFollow() {
		return follow;
	}
	public void setFollow(String follow) {
		this.follow = follow;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	
	
}
