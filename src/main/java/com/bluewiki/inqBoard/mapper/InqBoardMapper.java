package com.bluewiki.inqBoard.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface InqBoardMapper {

	@Update("UPDATE INQ_MOD_BOARD "
			+"SET STATE='01' "
			+"WHERE BOARD_NO = #{board_no}")
	public void changeInqBrdSts(@Param("board_no") int brdNo);
	
	@Insert("INSERT INTO INQ_MOD_BOARD "
			+ "VALUES "
			+ "( "
			+ "0, "
			+ "#{content}, "
			+ "curdate(), "
			+ "curtime(), "
			+ "'02', " 
			+ "#{board_no}, "
			+ "#{member_id} "
			+ " )")
	public void banBoard(@Param("board_no") int no, @Param("content") String reason, @Param("member_id") String id);
}
