package com.bluewiki.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bluewiki.common.vo.MemberVo;

import com.bluewiki.common.vo.MemberVo;

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

	@Select("SELECT MEMBER_ID AS MEMBERID, STATE, AUTHORITY "
	+"FROM MEMBER "
	+"WHERE STATE = '02'")
	public List<MemberVo> getRptMember();
	
	@Update("UPDATE MEMBER " 
			+ "SET STATE='01' "
			+ "WHERE MEMBER_ID = #{member_id}")
	public void changeSts(@Param("member_id")String memberId);

	@Select("SELECT * "
			+ "FROM MEMBER "
			+ "WHERE MEMBER_ID = #{member_id} "
			+ "AND PWD = #{pwd}" )
	MemberVo selectMemberInfo(@Param("member_id")String memberId, @Param("pwd")String pwd);

}
