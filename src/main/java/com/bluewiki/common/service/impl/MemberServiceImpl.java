package com.bluewiki.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluewiki.common.mapper.MemberMapper;

public class MemberServiceImpl {

	@Autowired
	MemberMapper memberMapper;
	
	public int selectExistedId (String memberId) {
		return memberMapper.selectExistedId(memberId);
	}
}
