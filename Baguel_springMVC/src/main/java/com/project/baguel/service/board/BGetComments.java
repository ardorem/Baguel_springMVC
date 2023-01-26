package com.project.baguel.service.board;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.project.baguel.dao.ICommentsRepository;
import com.project.baguel.model.CommentsDTO;

@Service
public class BGetComments implements IBoardService {

	@Autowired
	ICommentsRepository iCommentsRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> BGetComments");
		Map<String, Object> map = model.asMap();
		String boardNum = String.valueOf(map.get("boardNum"));
		ArrayList<CommentsDTO> parentComments = iCommentsRepository.getParentComments(boardNum);
		ArrayList<CommentsDTO> childComments = iCommentsRepository.getChildComments(boardNum);
		
			try {
				for(int i = 0; i < parentComments.size(); i ++) {
					String writeDateBefore = parentComments.get(i).getWriteDate(); // 작성일
					
					Date format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(writeDateBefore); // String to Date
					Date format2 = new Date(); // 현재시간
					long diffSec = (format2.getTime() - format1.getTime()) / 1000; // 초 차이
					long diffMin = (format2.getTime() - format1.getTime()) / 60000; //분 차이
					long diffHor = (format2.getTime() - format1.getTime()) / 3600000; // 시 차이
					long diffDays = diffSec / (24 * 60 * 60);
					String writeDateAfter = null;
					if (diffDays == 0) {
						if (diffHor == 0) {
							writeDateAfter = diffMin+"분전";
						} else {
							writeDateAfter = diffHor + "시간전";
						}
					} else {		
						writeDateAfter = diffDays + "일전";
					}
					parentComments.get(i).setWriteDate(writeDateAfter);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			} 
			
			try {
				for(int i = 0; i < childComments.size(); i ++) {
					String writeDateBefore = childComments.get(i).getWriteDate(); // 작성일
					
					Date format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(writeDateBefore); // String to Date
					Date format2 = new Date(); // 현재시간
					long diffSec = (format2.getTime() - format1.getTime()) / 1000; // 초 차이
					long diffMin = (format2.getTime() - format1.getTime()) / 60000; //분 차이
					long diffHor = (format2.getTime() - format1.getTime()) / 3600000; // 시 차이
					long diffDays = diffSec / (24 * 60 * 60);
					String writeDateAfter = null;
					if (diffDays == 0) {
						if (diffHor == 0) {
							writeDateAfter = diffMin+"분전";
						} else {
							writeDateAfter = diffHor + "시간전";
						}
					} else {		
						writeDateAfter = diffDays + "일전";
					}
					childComments.get(i).setWriteDate(writeDateAfter);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			} 
		
		model.addAttribute("parentComments", parentComments);
		
		model.addAttribute("childComments", childComments);
	}

}
