package com.bluewiki.common.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberMapper {

	@Select("SELECT COUNT(*) "
	+ "FROM MEMBER "
	+ "WHERE MEMBER_ID = #{member_id}")
	int selectExistedId(@Param("member_id")String memberId);

	@Insert("INSERT INTO MEMBER ( "
			+ "MEMBER_ID, "
			+ "PWD, "
			+ "STATE, "
			+ "AUTHORITY ) "
			+ "VALUES ( "
			+ "#{member_id}, "
			+ "#{pwd}, "
			+ "'01', "
			+ "'01' ) ")
	void insertNewMember(@Param("member_id")String memberId, @Param("pwd")String pwd);

}
