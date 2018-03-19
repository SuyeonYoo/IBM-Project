package com.bluewiki.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluewiki.common.mapper.MemberMapper;
import com.bluewiki.common.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	public int selectExistedId (String memberId) {
		return memberMapper.selectExistedId(memberId);
	}
}
