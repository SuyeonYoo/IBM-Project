package com.bluewiki.common.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	int selectExistedId(String memberId);

}
