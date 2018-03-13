package com.bluewiki.board.service;

import java.util.List;

import com.bluewiki.board.vo.BoardVo;

public interface BoardService {
	
	public List<BoardVo> selectBaordByTitle(String title);
	
	public BoardVo selectBaordByNo(int no);
}
