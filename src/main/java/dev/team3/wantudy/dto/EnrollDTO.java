package dev.team3.wantudy.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EnrollDTO {
	int member_no;
	int study_no;
	String status;
	int skip;
}
