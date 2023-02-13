package com.project.baguel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import com.project.baguel.model.BoardDTO;

public interface IBoardRepository {
	int countArticles();

	ArrayList<BoardDTO> getArticles(@Param("minArticle") int minArticle, @Param("maxArticle") int maxArticle);

	void insertArticle(@Param("eventFrom") String eventFrom, @Param("eventTo") String eventTo,
			@Param("eventPlace") String eventPlace, @Param("eventType") String eventType, @Param("event") String event,
			@Param("eventDesc") String eventDesc, @Param("userId") String userId);
	
	void increaseViews(@Param("boardNum")String boardNum);
	
	BoardDTO getArticle(@Param("boardNum")String boardNum);
	
	void editArticle(@Param("eventFrom")String eventFrom,
			@Param("eventTo")String eventTo,
			@Param("eventPlace")String eventPlace,
			@Param("eventType")String eventType,
			@Param("event")String event,
			@Param("eventDesc")String eventDesc,
			@Param("boardNum")String boardNum);
	
	void deactiveArticle(@Param("boardNum")String boardNum);
	
	ArrayList<BoardDTO> getEvents();
}
