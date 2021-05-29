package dev.team3.wantudy.service;

import java.util.List;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;
import dev.team3.wantudy.dto.StudyDTO;

public interface MemberStudyService {

	public List<EnrollDTO> selectAllEnrolls(MemberDTO memberDTO);
	public StudyDTO getStudy(int study_no);
}
