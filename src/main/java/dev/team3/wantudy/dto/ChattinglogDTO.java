package dev.team3.wantudy.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChattinglogDTO {
	int no;
	int member_no;
	int study_no;
	String content;
	Date time;
}
