package com.bluewiki.inqBoard.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface InqBoardMapper {

	@Update("UPDATE inq_mod_board "
			+"SET STATE='01' "
			+"WHERE BOARD_NO = #{board_no}")
	public void changeInqBrdSts(@Param("board_no") int brdNo);
	
	
}
