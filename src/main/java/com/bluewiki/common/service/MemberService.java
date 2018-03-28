package com.bluewiki.common.service;

import java.util.Map;

import com.bluewiki.common.vo.MemberVo;

public interface MemberService {

	public int selectExistedId (String memberId);

	public void insertNewMember(Map<String, Object> paramMap);

	public MemberVo selectMemberInfo(Map<String, Object> paramMap);
}
