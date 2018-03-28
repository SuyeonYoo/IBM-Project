package com.bluewiki.board.service;

import java.util.List;

import com.bluewiki.board.vo.BoardIndexVo;
import com.bluewiki.board.vo.BoardVo;
import com.bluewiki.board.vo.InqBoardVo;

public interface BoardService {
	
	public List<BoardVo> selectBaordByTitle(String title);
	
	public BoardVo selectMatchTitle(String title);
	
	public List<BoardIndexVo> selectIndexList(int no);
	
	public List<InqBoardVo> getRptPostList();
	
	public void changeSts(int brdNo);
	
	public void banBoard(int no, String reason, String id);
}
