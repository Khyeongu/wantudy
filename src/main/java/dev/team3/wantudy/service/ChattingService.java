package dev.team3.wantudy.service;

import java.util.List;

import dev.team3.wantudy.dto.ChattinglogDTO;
import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.StudyDTO;

public interface ChattingService {

	public List<EnrollDTO> selectAllEnrolls(MemberDTO memberDTO);
	public StudyDTO getStudy(int study_no);
	public List<ChattinglogDTO> getChattinglog (int study_no);
}
