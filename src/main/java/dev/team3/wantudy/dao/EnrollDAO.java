package dev.team3.wantudy.dao;

import java.util.List;

import dev.team3.wantudy.dto.EnrollDTO;
import dev.team3.wantudy.dto.MemberDTO;

public interface EnrollDAO {
	public List<EnrollDTO> selectAllEnrolls(MemberDTO memberDTO);
}
