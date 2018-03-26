package com.bluewiki.common.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluewiki.common.mapper.MemberMapper;
import com.bluewiki.common.service.MemberService;
import com.bluewiki.common.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	public int selectExistedId (String memberId) {
		return memberMapper.selectExistedId(memberId);
	}
	
	public void insertNewMember(Map<String, Object> paramMap) {
		
		String memberId = (String)paramMap.get("memberId");
		String pwd = (String)paramMap.get("pwd");
		
		memberMapper.insertNewMember(memberId, pwd);
	}

	@Override
	public List<MemberVo> getRptMember() {
		return memberMapper.getRptMember();
	}

	@Override
	public void changeSts(String memberId) {
		memberMapper.changeSts(memberId);
	}
	
	
}
