package com.example.demo.board.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.board.domain.AddVO;
import com.example.demo.board.domain.BoardVO;
import com.example.demo.board.domain.FileVO;
import com.example.demo.board.domain.ScheduleVO;
import com.example.demo.board.domain.TagVO;

@Repository("com.example.demo.board.mapper.BoardMapper")
public interface BoardMapper {

	/* Main */
	// 게시글 개수
	public int boardCount() throws Exception;

	public List<BoardVO> boardList(int user_id) throws Exception;

	public List<BoardVO> boardMyList(int user_id) throws Exception;

	public List<BoardVO> boardRecList(int user_id) throws Exception;

	public int addMyList(AddVO adder) throws Exception;

	// 포스트 목록
	public List<BoardVO> boardPost(int post_id) throws Exception;

	// 게시글 태그 추가
	public void tagAdd(HashMap<String, String> tagAddMap) throws Exception;

	// 스케쥴 목록1 ===== 스케쥴
	public List<ScheduleVO> scheduleList_current() throws Exception;

	public List<ScheduleVO> scheduleList_past() throws Exception;
	// =====================================스케쥴

	// 게시글 작성
	public int postInsert(BoardVO board) throws Exception;

	// 파일 업로드.
	public int fileInsert(FileVO file) throws Exception;

	// 파일 다운로드.
	public FileVO fileDetail(int post_id) throws Exception;

	// UUID로 user_id 리턴
	public int userId(String UUID) throws Exception;

	/* Tags session added! */
	// 태그 이름 목록
	public List<TagVO> tagNamePostNumList(int user_id) throws Exception;

	// 테그 이름 삭제
	public int tagNameDelete(HashMap<String, String> tagDeleteMap) throws Exception;

	// Deatil Page post tags deplay
	public List<String> postTag(int post_id) throws Exception;
	
	public BoardVO updatePost(int post_id) throws Exception;
	
	public int updatePostImpl(BoardVO board) throws Exception;
	
	public int deletePost(int post_id) throws Exception;
	
	public int fileUpdate(FileVO file) throws Exception;

}
