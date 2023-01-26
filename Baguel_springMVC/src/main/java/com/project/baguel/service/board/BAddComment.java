package com.project.baguel.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.project.baguel.dao.ICommentsRepository;
import com.project.baguel.model.CommentsDTO;

@Service
public class BAddComment implements IBoardService {

	@Autowired
	ICommentsRepository iCommentsRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> BEditComment");
		Map<String, Object> map = model.asMap();
		CommentsDTO commentsDTO = (CommentsDTO)map.get("commentsDTO");
		String boardNum = commentsDTO.getBoardNum();
		String userId = commentsDTO.getUserId();
		String content = commentsDTO.getContent();
		
		iCommentsRepository.addComment(boardNum, userId, content);
	}

}
