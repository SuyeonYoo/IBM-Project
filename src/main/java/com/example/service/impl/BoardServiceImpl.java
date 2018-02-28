package com.example.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.BoardDomain;
import com.example.mapper.BoardMapper;
import com.example.service.BoardService;

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
