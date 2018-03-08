package com.bluewiki.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluewiki.board.domain.BoardDomain;
import com.bluewiki.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public BoardDomain selectBaord(int id) {
		return boardMapper.selectBaord(id);
	}
	
	@Override
	public void insertBoard(BoardDomain boardDomain) {
		boardMapper.insertBoard(boardDomain);
	}
	
	@Override
	public void updateBoard(BoardDomain boardDomain) {
		boardMapper.updateBoard(boardDomain);
	}
	
	@Override
	public void deleteBoard(int id) {
		boardMapper.deleteBoard(id);
	}
	
	@Override
	public List<BoardDomain> selectBoardList() {
		return boardMapper.selectBoardList();
	}
	
}
