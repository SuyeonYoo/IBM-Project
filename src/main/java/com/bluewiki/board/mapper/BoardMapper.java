package com.bluewiki.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bluewiki.board.domain.BoardDomain;

@Mapper
public interface BoardMapper {

	@Select("SELECT id, title, contents, "
						+ "DATE_FORMAT(reg_date, '%Y-%m-%d %H:%i:%s') reg_date, "
						+ "DATE_FORMAT(mod_date, '%Y-%m-%d %H:%i:%s') mod_date "
				+ "FROM BOARD "
				+ "WHERE id = #{id}")
	public BoardDomain selectBaord(@Param("id") int id);
	
	@Insert("INSERT INTO BOARD (title, contents, reg_date, mod_date) "
				+ "VALUES (#{title}, #{contents}, CURRENT_TIMESTAMP, NULL)")
	@Options(useGeneratedKeys=true, keyProperty="id", keyColumn = "id")
	public void insertBoard(BoardDomain boardDomain);
	
	@Update("UPDATE BOARD "
				+ "SET title = #{title}, "
						+ "contents = #{contents}, "
						+ "mod_date = CURRENT_TIMESTAMP "
				+ "WHERE id = #{id}")
	public void updateBoard(BoardDomain boardDomain);
	
	@Delete("DELETE FROM BOARD WHERE id = #{id}")
	public void deleteBoard(@Param("id") int id);
	
	@Select("SELECT id, title, contents, "
						+ "DATE_FORMAT(reg_date, '%Y-%m-%d %H:%i:%s') reg_date, "
						+ "DATE_FORMAT(mod_date, '%Y-%m-%d %H:%i:%s') mod_date "
				+ "FROM BOARD")
	public List<BoardDomain> selectBoardList();
}
