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
	
	public BoardVo selectBaordByNo (int no) {

		return boardMapper.selectBaordByNo(no);
	}
	
}
