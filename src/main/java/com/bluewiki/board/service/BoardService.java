package com.bluewiki.board.service;

import java.util.List;

import com.bluewiki.board.vo.BoardVo;

public interface BoardService {

	public BoardVo selectBaord(int id);
	
	public void insertBoard(BoardVo boardDomain);
	
	public void updateBoard(BoardVo boardDomain);
	
	public void deleteBoard(int id);
	
	public List<BoardVo> selectBoardList();
	
}
