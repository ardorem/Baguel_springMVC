package com.project.baguel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.project.baguel.model.CommentsDTO;

public interface ICommentsRepository {
	ArrayList<CommentsDTO> getParentComments(@Param("boardNum") String boardNum);

	ArrayList<CommentsDTO> getChildComments(@Param("boardNum") String boardNum);

	void editComment(@Param("commentNum") String commentNum, @Param("content") String content);

	void addComment(@Param("boardNum") String boardNum, @Param("userId") String userId, @Param("content") String content);

	void addChildComment(@Param("parentComment") String parentComment, @Param("boardNum") String boardNum,
			@Param("userId") String userId, @Param("content") String content);

	void deactiveComment(@Param("commentNum") String commentNum);
}
