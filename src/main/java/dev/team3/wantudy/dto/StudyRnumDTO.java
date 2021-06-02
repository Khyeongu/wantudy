package dev.team3.wantudy.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class StudyRnumDTO {
	int rnum; // sql에서 가져온 rownumber
	int no;
	String name;
	String content;
	Date startdate;
	Date enddate;
	int capacity;
	int member_no;
	int category_no;

}
