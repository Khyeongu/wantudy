package dev.team3.wantudy.dao;

import java.util.List;

import dev.team3.wantudy.dto.ChattinglogDTO;

public interface ChattinglogDAO {
	public List<ChattinglogDTO> getCattinglog(int study_no);
}
