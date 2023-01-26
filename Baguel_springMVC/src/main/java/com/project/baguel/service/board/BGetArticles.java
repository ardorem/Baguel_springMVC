package com.project.baguel.service.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IBoardRepository;
import com.project.baguel.model.BoardDTO;
import com.project.baguel.model.MemberDTO;

@Service
public class BGetArticles implements IBoardService {

	@Autowired
	IBoardRepository iBoardRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> BGetArticles");
		Map<String, Integer> pagination = new HashMap<String, Integer>();
		Map<String, Object> map = model.asMap();
		pagination = (Map<String, Integer>) map.get("pagination");
		int minArticle = pagination.get("minArticle");
		int maxArticle = pagination.get("maxArticle");
		
		ArrayList<BoardDTO> articles = new ArrayList<BoardDTO>();
		
		articles = iBoardRepository.getArticles(minArticle, maxArticle);
		System.out.println(articles);
		model.addAttribute("articles", articles);
	}

}
