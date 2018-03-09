package com.bluewiki.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluewiki.board.mapper.BoardMapper;
import com.bluewiki.board.service.BoardService;
import com.bluewiki.board.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public BoardVo selectBaord(int id) {
		return boardMapper.selectBaord(id);
	}
	
	@Override
	public void insertBoard(BoardVo boardDomain) {
		boardMapper.insertBoard(boardDomain);
	}
	
	@Override
	public void updateBoard(BoardVo boardDomain) {
		boardMapper.updateBoard(boardDomain);
	}
	
	@Override
	public void deleteBoard(int id) {
		boardMapper.deleteBoard(id);
	}
	
	@Override
	public List<BoardVo> selectBoardList() {
		return boardMapper.selectBoardList();
	}
	
}
