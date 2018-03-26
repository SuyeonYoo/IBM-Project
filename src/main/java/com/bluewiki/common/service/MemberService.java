package com.bluewiki.common.service;

import java.util.List;
import java.util.Map;

import com.bluewiki.common.vo.MemberVo;

public interface MemberService {

	public int selectExistedId (String memberId);

	public void insertNewMember(Map<String, Object> paramMap);
	
	public List<MemberVo> getRptMember();
	
	public void changeSts(String memberId);
}
