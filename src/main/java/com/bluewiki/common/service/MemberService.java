package com.bluewiki.common.service;

import java.util.Map;

public interface MemberService {

	public int selectExistedId (String memberId);

	public void insertNewMember(Map<String, Object> paramMap);
}
