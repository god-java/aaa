package com.kg.level.socket;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kg.level.dao.MemberDAO;

public class WebSocketHandler extends TextWebSocketHandler{

	@Autowired
	private SqlSessionTemplate sst;
	private MemberDAO mdao;
	
	public static Hashtable<Integer,WebSocketSession> users = new Hashtable<Integer,WebSocketSession>();
	
	private List<WebSocketSession> userList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		userList.add(session);
		System.out.println("~~");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String receive_text = message.getPayload();
		System.out.println(receive_text);
		String[] sp_receive_text = receive_text.split("/");
		System.out.println(sp_receive_text[0]);
		if(sp_receive_text[0].equals("access")) {
			System.out.println("access~~");
			mdao=sst.getMapper(MemberDAO.class);
			mdao.access_status_on(Integer.parseInt(sp_receive_text[1]));
			System.out.println("socket.member_num:"+sp_receive_text[1]);
			users.put(Integer.parseInt(sp_receive_text[1]),session);
			int member_num = Integer.parseInt(sp_receive_text[1]);
			
			
			WebSocketSession ss =  users.get(member_num);
			ss.sendMessage(new TextMessage("main_note/"+member_num));
			
		} else if (sp_receive_text[0].equals("logout")) {
			afterConnectionClosed(session, CloseStatus.NORMAL);
		} else if (sp_receive_text[0].equals("chatting")) {
			int member1_num = Integer.parseInt(sp_receive_text[1]);
			int member2_num = Integer.parseInt(sp_receive_text[2]);
			System.out.println("chat~~"+member1_num+"////"+member2_num);
			WebSocketSession ss =  users.get(member2_num);
			ss.sendMessage(new TextMessage("message/"+member1_num+"/"+member2_num));
		} else if(sp_receive_text[0].equals("note")) {
			System.out.println("노트로 들어옴!!!");
			int receiver_num = Integer.parseInt(sp_receive_text[1]);
			WebSocketSession ss =  users.get(receiver_num);
			ss.sendMessage(new TextMessage("note/"+receiver_num));
		}
		
		
		
		System.out.println(users);
		for(WebSocketSession ss : userList) {
			ss.sendMessage(new TextMessage("list"));
		}

			
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId());
		Enumeration keys = users.keys();
		while(keys.hasMoreElements()) {
			int key=(Integer) keys.nextElement();
			System.out.println("key媛�:"+key);
			WebSocketSession wss = users.get(key);
			if(wss==session) {
				users.remove(key);
				mdao=sst.getMapper(MemberDAO.class);
				mdao.access_status_off(key);
			}
		}
		userList.remove(session);
		for(WebSocketSession ss : userList) {
			ss.sendMessage(new TextMessage("list"));
		}
	}
	

}
