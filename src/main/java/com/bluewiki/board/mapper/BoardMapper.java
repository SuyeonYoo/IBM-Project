package com.bluewiki.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bluewiki.board.vo.BoardVo;

@Mapper
public interface BoardMapper {
	
	@Select("SELECT no, title, state "
	+ "FROM BOARD "
	+ "WHERE title LIKE #{title} LIMIT 5")
public List<BoardVo> selectBaordByTitle(@Param("title") String title);
	
	
	@Select("SELECT no, title, content, state"
			+ "DATE_FORMAT(reg_date, '%Y-%m-%d') reg_date, "
			+ "DATE_FORMAT(reg_time, '%H:%i:%s') reg_time, "
			+ "sec_state, witer, cnt_like, third_cate_id"
	+ "FROM BOARD "
	+ "WHERE id = #{id}")
public BoardVo selectBaordByNo(@Param("no") int no);
	
	
}
