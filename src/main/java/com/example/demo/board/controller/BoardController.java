package com.example.demo.board.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.board.domain.AddVO;
import com.example.demo.board.domain.BoardVO;
import com.example.demo.board.domain.FileVO;
import com.example.demo.board.service.BoardService;

@Controller
public class BoardController {

	// Global session
	HttpSession session;
	int user_id;

	@Resource(name = "com.example.demo.board.service.BoardService")
	BoardService mBoardService;

	@RequestMapping("/index")
	private String boardList(Model model, HttpServletRequest request) throws Exception {

		// session added
		String UUID = "temp1";

		user_id = Integer.parseInt(Integer.toString(mBoardService.userIdService(UUID)));
		System.out.println(user_id);

		session = request.getSession();
		session.setAttribute("user_id", user_id);

		model.addAttribute("user_id", user_id);
		model.addAttribute("list", mBoardService.boardListService(user_id));
		model.addAttribute("myList", mBoardService.boardMyListService(user_id));
		model.addAttribute("recList", mBoardService.boardRecListService(user_id));

		return "index";
	}

	@RequestMapping("/addProc")
	private String boardInsertProc(HttpServletRequest request) throws Exception {

		AddVO adder = new AddVO();
		int pid = Integer.parseInt(request.getParameter("post_id"));
		int uid = Integer.parseInt(request.getParameter("user_id"));

		adder.setPost_id(pid);
		adder.setUser_id(uid);

		mBoardService.addMyList(adder);

		return "redirect:/index?starter=" + pid + "&&viewState=" + "1";

	}

	@RequestMapping("/insert") // 게시글 작성폼 호출
	private String boardInsertForm() {

		return "insert";
	}

	@RequestMapping("/insertProc")
	private String boardInsertProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {

		BoardVO post = new BoardVO();
		FileVO file = new FileVO();

		post.setTitle(request.getParameter("title"));
		post.setWriter(request.getParameter("writer"));
		post.setPhone(request.getParameter("phone"));
		post.setEmail(request.getParameter("email"));
		post.setSubject(request.getParameter("subject"));
		post.setApply_start(request.getParameter("apply_start"));
		post.setApply_end(request.getParameter("apply_end"));
		post.setEvent_start(request.getParameter("event_start"));
		post.setEvent_end(request.getParameter("event_end"));
		post.setDescription(request.getParameter("description"));
		post.setUrl(request.getParameter("url"));
		post.setUser_id(1);

		if (files.isEmpty()) { // 업로드할 파일이 없을 시
			mBoardService.postInsertService(post); // 게시글 insert
		} else {
			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl = "/Users/yechankim/Desktop/2020-02/공프기/notice/src/main/resources/static/images/";
			// String fileUrl = "/app/src/main/webapp/resources/images/"; //heroku

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			post.setImage_url("resources/images/" + destinationFileName);

			mBoardService.postInsertService(post); // 게시글 insert

			file.setPost_id(post.getPost_id());
			file.setFileName(destinationFileName);
			file.setFileOriName(fileName);
			file.setFileUrl(fileUrl);

			mBoardService.fileInsertService(file); // file insert
		}

		return "redirect:/index";
	}

	@RequestMapping("/schedule")
	private String boardSchedule(Model model,
			@RequestParam(value = "status", required = false, defaultValue = "current") String status)
			throws Exception {
		model.addAttribute("list", mBoardService.scheduleService(status));
		model.addAttribute("status", status);
		return "schedule";
	}

	@RequestMapping("/detail/{post_id}")
	private String boardDetail_before(Model model, @PathVariable int post_id) throws Exception {
		System.out.println(post_id);

		// added!
		model.addAttribute("list", mBoardService.postService(post_id)); // attribute
		model.addAttribute("description", mBoardService.postService(post_id).get(0).getDescription().replaceAll("\n", "<br>"));
		model.addAttribute("tagList", mBoardService.postTagService(post_id)); // tag List 전달
		return "detail";
	}

	// Newly added! DetailAdd
	@RequestMapping(value = "detail/{post_id}/{tag_name}/{user_id}", method = RequestMethod.GET)
	private String detailPageAdd(@PathVariable("post_id") String post_id, @PathVariable("tag_name") String tag_name,
			@PathVariable("user_id") String user_id) throws Exception {

		mBoardService.tagAddService(tag_name, user_id);

		return "redirect:/detail/" + post_id;
	}

	@RequestMapping("/tagPage")
	   private String tagPage(Model model) throws Exception {

	      // session added!
	      model.addAttribute("user_id", user_id);
	      model.addAttribute("tagNamePostNumList", mBoardService.tagNamePostNumListService(user_id)); // error?

	      return "tagPage";
	}

	@RequestMapping(value = "tagPage/{user_id}/{tagConcatString}", method = RequestMethod.GET)
	   private String tagNameDelete(@PathVariable("user_id") String user_id, @PathVariable("tagConcatString") String tagConcatString)
	         throws Exception {
	      
	      String[] tempTags = tagConcatString.split("-");   // 스트링 분리
	      //System.out.println("User ID:" + user_id);
	      for(int i = 0; i < tempTags.length; i++) {   // 태그 반복 삭제
	         mBoardService.tagNameDeleteService(tempTags[i], Integer.parseInt(user_id));
	      }
	      

	      return "redirect:/tagPage";
	 }
	
	@RequestMapping("/list") // 게시글 작성폼 호출
	private String writeList(Model model) throws Exception {
		
		model.addAttribute("list", mBoardService.boardListService(user_id));
		
		return "list";
	}
	
	@RequestMapping(value = "update/{post_id}", method = RequestMethod.GET)
	private String postUpdate(@PathVariable("post_id") int post_id, Model model)
			throws Exception {

		model.addAttribute("post", mBoardService.updatePostService(post_id));
		
		return "update";
	}
	
	@RequestMapping("/updateProc")
	private String boardUpdateProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {

		BoardVO post = new BoardVO();
		FileVO file = new FileVO();
		
		post.setPost_id(Integer.parseInt(request.getParameter("post_id")));
		post.setTitle(request.getParameter("title"));
		post.setWriter(request.getParameter("writer"));
		post.setPhone(request.getParameter("phone"));
		post.setEmail(request.getParameter("email"));
		post.setSubject(request.getParameter("subject"));
		post.setApply_start(request.getParameter("apply_start"));
		post.setApply_end(request.getParameter("apply_end"));
		post.setEvent_start(request.getParameter("event_start"));
		post.setEvent_end(request.getParameter("event_end"));
		post.setDescription(request.getParameter("description"));
		post.setUrl(request.getParameter("url"));

		if (files.isEmpty()) { // 업로드할 파일이 없을 시
			mBoardService.updatePostImplService(post); // 게시글 insert
		} else {
			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl = "/Users/yechankim/Desktop/2020-02/공프기/notice/src/main/resources/static/images/";

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			post.setImage_url("resources/images/" + destinationFileName);

			mBoardService.updatePostImplService(post); 

			file.setPost_id(post.getPost_id());
			file.setFileName(destinationFileName);
			file.setFileOriName(fileName);
			file.setFileUrl(fileUrl);

			//mBoardService.fileInsertService(file); // file insert
			mBoardService.fileUpdateService(file);
		}

		return "redirect:/list";
	}
	
	@RequestMapping("/delete")
	private String boardDelete(Model model, HttpServletRequest request) throws Exception {
		
		int result = mBoardService.deletePostService(Integer.parseInt(request.getParameter("post_id")));	
		
		if(result == 0 ) {
			model.addAttribute("msg","실패하였습니다.");
			model.addAttribute("url", "update/"+ request.getParameter("post_id") );
		}
		else {
			model.addAttribute("msg", "성공하였습니다");
			model.addAttribute("url", "list");
		}
		
		return "redirect";
	}
	
	@RequestMapping("/insert/cseeCrawling/{url}") // cseePage crawling
	   private String boardCseeCrawling(Model model, @PathVariable("url") String url) throws Exception {
	      
	      //System.out.println(url.replaceAll("<", "/"));
	      BoardVO crawlVO = mBoardService.cseeCrawlingService(url.replaceAll("<", "/"));
	         
	      if(crawlVO != null) {
	         model.addAttribute("title", crawlVO.getTitle());
	         model.addAttribute("email", crawlVO.getEmail());
	         model.addAttribute("phone", crawlVO.getPhone());
	         model.addAttribute("description", crawlVO.getDescription());
	         model.addAttribute("url", crawlVO.getUrl());
	      }
	         
	      return "insert";
	   }
}
