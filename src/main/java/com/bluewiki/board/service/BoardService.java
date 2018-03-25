package com.bluewiki.board.service;

import java.util.List;

import com.bluewiki.board.vo.BoardIndexVo;
import com.bluewiki.board.vo.BoardVo;

public interface BoardService {
	
	public List<BoardVo> selectBaordByTitle(String title);
	
	public BoardVo selectMatchTitle(String title);
	
	public List<BoardIndexVo> selectIndexList(int no);
}
