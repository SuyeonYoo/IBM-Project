package com.bluewiki.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bluewiki.board.vo.BoardContentVo;
import com.bluewiki.board.vo.BoardIndexVo;
import com.bluewiki.board.vo.BoardVo;
import com.bluewiki.board.vo.InqBoardVo;

@Mapper
public interface BoardMapper {
	
	@Select("SELECT no, title, state "
	+ "FROM BOARD "
	+ "WHERE title LIKE #{title} LIMIT 5")
public List<BoardVo> selectBaordByTitle(@Param("title") String title);
	
	
	@Select("SELECT no, title, state, "
			+ "DATE_FORMAT(reg_date, '%Y-%m-%d') reg_date, "
			+ "sec_state, writer, cnt_like, third_cate_id "
	+ "FROM BOARD "
	+ "WHERE title = #{title}")
	public BoardVo selectMatchTitle(@Param("title") String title);
	
	@Select("SELECT * "
	+ "FROM BOARD_CONTENT "
	+ "WHERE board_no = #{board_no}")
	public List<BoardContentVo> selectContent(@Param("board_no") String board_no);
	
	@Select("SELECT numbering, title "
			+ "FROM BOARD_INDEX "
			+ "WHERE board_no = #{no}")
	public List<BoardIndexVo> selectIndexList(@Param("no") int no);
	
	@Insert("INSERT INTO BOARD"
			+"(title, writer, reg_date, reg_time) "
			+"VALUES"
			+"(#{title}, #{writer}, convert(varchar(10), getdate(), 120), convert(varchar, getdate(), 108))")
	public BoardVo insertBoard(BoardVo vo);
	
	@Insert("INSERT INTO BOARD_INDEX"
			+"(numbering, title, board_no) "
			+"VALUES"
			+"(#{numbering}, #{title}, #{board_no})")
	public BoardIndexVo insertIndex(BoardIndexVo vo);
	
	@Insert("INSERT INTO BOARD_CONTENT"
			+"(numbering, title, board_no) "
			+"VALUES"
			+"(#{numbering}, #{title}, #{board_no})")
	public BoardContentVo insertContent(BoardContentVo vo);
	
	@Select("SELECT " 
				+"INQ.NO AS INQNO, "
				+"INQ.CONTENT AS INQCONTENT, "
				+"INQ.DATE AS INQDATE, "
				+"INQ.TIME AS INQTIME, "
				+"INQ.MEMBER_ID AS REQMEMID, "
				+"BRD.TITLE, "
				+"BRD.NO AS BRDNO "
			+"FROM INQ_MOD_BOARD INQ "
				+"LEFT OUTER JOIN BOARD BRD "
				+"ON INQ.BOARD_NO = BRD.NO "
			+"WHERE BRD.STATE = '02' "
				+"AND INQ.STATE = '02' "
			+"ORDER BY INQ.DATE ASC")
	public List<InqBoardVo> getRptPostList();
	
	
	@Update("UPDATE BOARD "
			+"SET STATE='01' "
			+"WHERE NO = #{no}")
	public void changeBrdSts(@Param("no") int brdNo);
	
}
