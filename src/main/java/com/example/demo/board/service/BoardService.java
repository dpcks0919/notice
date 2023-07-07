package com.example.demo.board.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

import com.example.demo.board.domain.AddVO;
import com.example.demo.board.domain.BoardVO;
import com.example.demo.board.domain.FileVO;
import com.example.demo.board.domain.ScheduleVO;
import com.example.demo.board.domain.TagVO;
import com.example.demo.board.mapper.BoardMapper;

@Service("com.example.demo.board.service.BoardService")
public class BoardService {

	@Resource(name = "com.example.demo.board.mapper.BoardMapper")
	BoardMapper mBoardMapper;

	public List<BoardVO> boardListService(int user_id) throws Exception {

		return mBoardMapper.boardList(user_id);
	}

	public List<BoardVO> boardMyListService(int user_id) throws Exception {

		return mBoardMapper.boardMyList(user_id);
	}

	public List<BoardVO> boardRecListService(int user_id) throws Exception {

		return mBoardMapper.boardRecList(user_id);
	}

	public int addMyList(AddVO adder) throws Exception {

		return mBoardMapper.addMyList(adder);
	}

	public List<BoardVO> postService(int post_id) throws Exception {

		return mBoardMapper.boardPost(post_id);
	}

	public List<ScheduleVO> scheduleService(String status) throws Exception {
		if (status.equals("current"))
			return mBoardMapper.scheduleList_current();
		else
			return mBoardMapper.scheduleList_past();
	}

	public int postInsertService(BoardVO board) throws Exception {

		return mBoardMapper.postInsert(board);
	}

	public int fileInsertService(FileVO file) throws Exception {
		return mBoardMapper.fileInsert(file);
	}

	public FileVO fileDetailService(int post_id) throws Exception {
		return mBoardMapper.fileDetail(post_id);
	}

	public void tagAddService(String tags, String user_id) throws Exception { // 추가
		// both for detail and index page
		String[] addTags = tags.split("-"); // tags 스트링 나눠서 진행
		for (int i = 0; i < addTags.length; i++) { // 이렇게 되나??
			// 변수 2개를 동시 전달하기 위해서 HashMap 사용
			HashMap<String, String> tagAddMap = new HashMap<String, String>();
			tagAddMap.put("add_tag", addTags[i]);
			tagAddMap.put("user_id", user_id); // user_id 변수화
			mBoardMapper.tagAdd(tagAddMap);
		}
	}

	// User ID added!
	public int userIdService(String UUID) throws Exception {

		return mBoardMapper.userId(UUID);
	}

	/* Tags session added! */
	   public List<TagVO> tagNamePostNumListService(int user_id) throws Exception {

	      return mBoardMapper.tagNamePostNumList(user_id);
	   }

	public int tagNameDeleteService(String tag_name, int user_id) throws Exception {
		// 변수 2개를 동시 전달하기 위해서 HashMap 사용
		HashMap<String, String> tagDeleteMap = new HashMap<String, String>();
		tagDeleteMap.put("tag_name", tag_name);
		tagDeleteMap.put("user_id", Integer.toString(user_id)); // user_id 변수화

		return mBoardMapper.tagNameDelete(tagDeleteMap);
	}

	// Detail Page: Post Info service
	public List<String> postTagService(int post_id) throws Exception {

		return mBoardMapper.postTag(post_id);
	}
	
	public BoardVO updatePostService(int post_id) throws Exception {

		return mBoardMapper.updatePost(post_id);
	}
	
	public int updatePostImplService(BoardVO board) throws Exception {

		return mBoardMapper.updatePostImpl(board);
	}
	
	public int deletePostService(int post_id) throws Exception {
		
		return mBoardMapper.deletePost(post_id);
	}
	
	public int fileUpdateService(FileVO file) throws Exception{
		return mBoardMapper.fileUpdate(file);
	}
	
	// CSEE PAGE Crawling
   public BoardVO cseeCrawlingService(String url) throws Exception {
      try {
         Document doc = Jsoup.connect(url).get();

         // if(Document doc = Jsoup.connect(url).get(); // get the document
         BoardVO tempVO = new BoardVO(); // temp VO

         // assigning each values
         tempVO.setTitle(doc.select(".header-post-title-class").text());
         // tempVO.setReg_date(doc.select(".entry-date").attr("datetime")); // 입력 불가?
         tempVO.setUrl(url); // url from parameter

         // description
         String descriptionStr = doc.select(".entry-content").text();
         tempVO.setDescription(descriptionStr);

         // phone
         if (descriptionStr.contains("010")) {
            tempVO.setPhone(
                  descriptionStr.substring(descriptionStr.indexOf("010"), descriptionStr.indexOf("010") + 13));
         } else if (descriptionStr.contains("054")) {
            tempVO.setPhone(
                  descriptionStr.substring(descriptionStr.indexOf("054"), descriptionStr.indexOf("054") + 12));
         }

         // email
         if (descriptionStr.contains("@handong.edu")) {
            tempVO.setEmail(descriptionStr.substring(descriptionStr.indexOf("@handong.edu") - 20,
                  descriptionStr.indexOf("@handong.edu") + 12));
         }
         return tempVO;
         
      } catch (Exception e) {
         return null;
      }

   }
}
