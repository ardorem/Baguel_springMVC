package com.project.baguel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.baguel.model.BoardDTO;
import com.project.baguel.model.CommentsDTO;
import com.project.baguel.service.board.BGetComments;
import com.project.baguel.service.board.IBoardService;

import oracle.net.aso.b;

@Controller
public class BController {

	@Autowired
	@Qualifier("BCalcPages")
	IBoardService bCalcPages;
	
	@Autowired
	@Qualifier("BGetArticles")
	IBoardService bGetArticles;
	
	@Autowired
	@Qualifier("BIncreaseViews")
	IBoardService bIncreaseViews;
	
	@Autowired
	@Qualifier("BInsertArticle")
	IBoardService bInsertArticle;
	
	@Autowired
	@Qualifier("BGetArticle")
	IBoardService bGetArticle;
	
	@Autowired
	@Qualifier("BGetComments")
	IBoardService bGetComments;
	
	@Autowired
	@Qualifier("BEditArticle")
	IBoardService bEditArticle;
	
	@Autowired
	@Qualifier("BDeactiveArticle")
	IBoardService bDeactiveArticle;
	
	@Autowired
	@Qualifier("BEditComment")
	IBoardService bEditComment;
	
	@Autowired
	@Qualifier("BDeactiveComment")
	IBoardService bDeactiveComment;
	
	
	@Autowired
	@Qualifier("BAddComment")
	IBoardService bAddComment;
	
	
	@Autowired
	@Qualifier("BAddChildComment")
	IBoardService bAddChildComment;
	
	@RequestMapping("cal_list")
	public String viewList(String page, Model model) {
		System.out.println("> BController → viewList");
		int currentPage;
		if(page != null) {
			currentPage = Integer.parseInt(page); //요청받은 페이지 번호
		} else {
			currentPage = 1;
		}
		model.addAttribute("currentPage",currentPage);
		bCalcPages.execute(model);
		bGetArticles.execute(model);

		return "cal_list";
	}
	
	@RequestMapping(value = "cal_add", method = RequestMethod.GET)
	public String calAddNavigate(Model model) {
		System.out.println("> BController → calAdd GET");
		return "cal_add";
	}
	
	@RequestMapping(value = "cal_add", method = RequestMethod.POST)
	public String calAdd(BoardDTO boardDTO, Model model, RedirectAttributes redirectAttributes) {
		System.out.println("> BController → calAdd");
		model.addAttribute("boardDTO", boardDTO);
		
		bInsertArticle.execute(model);
		String eventPlace  = boardDTO.getEventPlace();
		String event = boardDTO.getEvent();
		System.out.println("eventPlace:" + eventPlace);
		System.out.println("event:" + event);
		redirectAttributes.addFlashAttribute("eventPlace", eventPlace); // as POST method
		redirectAttributes.addFlashAttribute("event", event); // as POST method
		return "redirect:cal_add_ok";
	}
	
	@RequestMapping("cal_add_ok")
	public String calAddOkNevigate() {
		System.out.println("> BController → calAddOkNevigate");
		return "cal_add_ok";
	}
	
	@RequestMapping("cal_list_view/{boardNum}")
	public String cal_list_view(@PathVariable String boardNum, Model model) {
		System.out.println("> BController → cal_list_view");
		
		// boardNum에 숫자가 아닌 문자가 섞여있는 경우 -> 에러 페이지로
    String pattern = "^[0-9]*$"; //숫자만
    boolean isOnlyNumber = Pattern.matches(pattern, boardNum);
    if(!isOnlyNumber) {
    	return "error";
    }
    
		model.addAttribute("boardNum", boardNum);
		
		bIncreaseViews.execute(model);
		bGetArticle.execute(model);
		
		// boardNum에 해당하는 게시물이 없는 경우 -> 에러 페이지로
		Map<String, Object> map = model.asMap();
		BoardDTO boardArticle = (BoardDTO) map.get("boardArticle");
		if (boardArticle == null) {
			System.out.println("it's null");
			return "error";
		}
		bGetComments.execute(model);
		
		return "cal_list_view";
	}
	
	@RequestMapping(value="edit_article", method = RequestMethod.GET)
	public String editArticleNevigate(String boardNum, Model model) {
		System.out.println("> BController → editArticleNevigate");
		model.addAttribute("boardNum", boardNum);
		bGetArticle.execute(model);
		return "cal_edit";
	}
	
	@RequestMapping(value="edit_article", method = RequestMethod.POST)
	public String editArticle(BoardDTO boardDTO, Model model) {
		System.out.println("> BController → editArticle");
		model.addAttribute("boardDTO", boardDTO);
		bEditArticle.execute(model);
		return "redirect:cal_edit_ok";
	}
	
	@RequestMapping("cal_edit_ok")
	public String calAddOkNavigate(Model model) {
		System.out.println("> BController → calAdd GET");
		return "cal_edit_ok";
	}
	
	@RequestMapping("deactive_article/{boardNum}")
	public String deactiveArticle(@PathVariable String boardNum, Model model) throws IOException {
		System.out.println("> BController → deactiveArticle");
		model.addAttribute("boardNum", boardNum);
		bDeactiveArticle.execute(model);
		return "cal_delete_ok";
	}
	
	@RequestMapping("edit_comment")
	public String editComment(CommentsDTO commentsDTO, Model model) {
		System.out.println("> BController → editComment");
//		Map<String, Object> map = model.asMap();
		String boardNum = commentsDTO.getBoardNum();
		String commentNum = commentsDTO.getCommentNum();
		System.out.println("So the boardNum is " + boardNum);
		System.out.println("So the commentNum is " + commentNum);
		model.addAttribute("commentsDTO");
		bEditComment.execute(model);
		return "redirect:/cal_list_view/"+boardNum;
	}
	
	@RequestMapping("delete_comment/{boardNum}/{commentNum}")
	public String deleteComment(@PathVariable String boardNum,@PathVariable String commentNum, Model model) {
		System.out.println("> BController → deleteComment");
		model.addAttribute("commentNum", commentNum);
		bDeactiveComment.execute(model);
		
		return "redirect:/cal_list_view/"+boardNum;
	}
	
	@RequestMapping("add_comment")
	public String addComment(CommentsDTO commentsDTO, Model model) {
		System.out.println("> BController → addComment");
//		Map<String, Object> map = model.asMap();
		String boardNum = commentsDTO.getBoardNum();
		String userId = commentsDTO.getUserId();
		String content = commentsDTO.getContent();
		System.out.println("So the boardNum is " + boardNum);
		System.out.println("So the userId is " + userId);
		System.out.println("So the commentNum is " + content);
		
		model.addAttribute("commentsDTO");
		bAddComment.execute(model);
		return "redirect:/cal_list_view/"+boardNum;
	}
	
	@RequestMapping("add_child_comment")
	public String addChildComment(CommentsDTO commentsDTO, Model model) {
		System.out.println("> BController → addChildComment");
//		Map<String, Object> map = model.asMap();
		String parentComment = commentsDTO.getParentComment();
		String boardNum = commentsDTO.getBoardNum();
		String userId = commentsDTO.getUserId();
		String content = commentsDTO.getContent();
		
		System.out.println("So the parentComment is " + parentComment);
		System.out.println("So the boardNum is " + boardNum);
		System.out.println("So the userId is " + userId);
		System.out.println("So the commentNum is " + content);
		
		model.addAttribute("commentsDTO");
		bAddChildComment.execute(model);
		return "redirect:/cal_list_view/"+boardNum;
	}
}
