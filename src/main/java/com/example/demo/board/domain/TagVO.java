package com.example.demo.board.domain;

import java.util.Date;

public class TagVO {
   private int tag_id;
   private int relatedPostNum;
   private String tag_name;
   private Date reg_date;
   private Date update_date;
   
   public int getTag_id() {
      return tag_id;
   }
   public void setTag_id(int tag_id) {
      this.tag_id = tag_id;
   }
   public String getTag_name() {
      return tag_name;
   }
   public void setTag_name(String tag_name) {
      this.tag_name = tag_name;
   }
   public Date getReg_date() {
      return reg_date;
   }
   public void setReg_date(Date reg_date) {
      this.reg_date = reg_date;
   }
   public Date getUpdate_date() {
      return update_date;
   }
   public void setUpdate_date(Date update_date) {
      this.update_date = update_date;
   }
   public int getRelatedPostNum() {
      return relatedPostNum;
   }
   public void setRelatedPostNum(int relatedPostNum) {
      this.relatedPostNum = relatedPostNum;
   }
}