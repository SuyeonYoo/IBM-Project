package com.bluewiki.common.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberMapper {

	@Select("SELECT COUNT(*) "
	+ "FROM MEMBER "
	+ "WHERE MEMBER_ID = #{member_id}")
	int selectExistedId(@Param("member_id")String memberId);

}
