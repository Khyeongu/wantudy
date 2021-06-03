package dev.team3.wantudy.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;


@Getter
@Setter
@ToString
public class MemberStudyDTO {
	int enroll_member_no;
	int enroll_study_no;
	String enroll_status;
	int enroll_skip;
	

	String study_name;
	String study_content;
	Date study_startdate;
	Date study_enddate;
	int study_capacity;
	int study_member_no;
	String study_category;
	String category_imgpath;
	
	int study_member_count;
	String statusImg;
}
