package com.bluewiki.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluewiki.board.mapper.BoardMapper;
import com.bluewiki.board.service.BoardService;
import com.bluewiki.board.vo.BoardIndexVo;
import com.bluewiki.board.vo.BoardVo;
import com.bluewiki.board.vo.InqBoardVo;
import com.bluewiki.inqBoard.mapper.InqBoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	InqBoardMapper inqBoardMapper;
	
	public List<BoardVo> selectBaordByTitle (String title) {
		
		title = title+"%";
				
		return boardMapper.selectBaordByTitle(title);
	}
	
	public BoardVo selectMatchTitle (String title) {

		return boardMapper.selectMatchTitle(title);
	}
	
	public List<BoardIndexVo> selectIndexList(int no) {
		
		return boardMapper.selectIndexList(no);
	}

	@Override
	public List<InqBoardVo> getRptPostList() {
		return boardMapper.getRptPostList();
	}

	@Override
	public void changeSts(int brdNo) {
		boardMapper.changeBrdSts(brdNo);
		inqBoardMapper.changeInqBrdSts(brdNo);
	}
	
	
	
}
