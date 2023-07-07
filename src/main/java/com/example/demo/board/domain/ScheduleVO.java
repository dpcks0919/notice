package com.example.demo.board.domain;

public class ScheduleVO {
   private int post_id;
   private String image_url;
   private String title;
   private String apply_start;
   private String apply_end;
   private String event_start;
   private String event_end;
   public int getPost_id() {
      return post_id;
   }
   public String getImage_url() {
      return image_url;
   }
   public String getTitle() {
      return title;
   }
   public String getApply_start() {
      return apply_start;
   }
   public String getApply_end() {
      return apply_end;
   }
   public String getEvent_start() {
      return event_start;
   }
   public String getEvent_end() {
      return event_end;
   }
   public void setPost_id(int post_id) {
      this.post_id = post_id;
   }
   public void setImage_url(String image_url) {
      this.image_url = image_url;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public void setApply_start(String apply_start) {
      this.apply_start = apply_start;
   }
   public void setApply_end(String apply_end) {
      this.apply_end = apply_end;
   }
   public void setEvent_start(String event_start) {
      this.event_start = event_start;
   }
   public void setEvent_end(String event_end) {
      this.event_end = event_end;
   }
}
