package dev.team3.wantudy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import dev.team3.wantudy.dto.ChattinglogDTO;

public interface ChattinglogDAO {
	public List<ChattinglogDTO> getChattinglogscroll(@Param("study_no") int study_no,@Param("endNo") int endNo);
	public void insertchattinglog(ChattinglogDTO chattingDTO);
}
