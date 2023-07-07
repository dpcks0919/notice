package com.example.demo.board.domain;

import java.util.Date;

public class BoardVO {
	private int post_id;
	private int user_id;
	private String writer;
	private String image_url;
	private String title;
	private String apply_start;
	private String apply_end;
	private String event_start;
	private String event_end;
	private String subject;
	private String phone;
	private String email;
	private String url;
	private String description;
	private String reg_date;
	private String update_date;
	private int approve_flag;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getApprove_flag() {
		return approve_flag;
	}
	public void setApprove_flag(int approve_flag) {
		this.approve_flag = approve_flag;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getApply_start() {
		return apply_start;
	}
	public void setApply_start(String apply_start) {
		this.apply_start = apply_start;
	}
	public String getApply_end() {
		return apply_end;
	}
	public void setApply_end(String apply_end) {
		this.apply_end = apply_end;
	}
	public String getEvent_start() {
		return event_start;
	}
	public void setEvent_start(String event_start) {
		this.event_start = event_start;
	}
	public String getEvent_end() {
		return event_end;
	}
	public void setEvent_end(String event_end) {
		this.event_end = event_end;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	
	
}