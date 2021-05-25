package dev.team3.wantudy.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class StudyDTO {
	int no;
	String name;
	String content;
	Date startdate;
	Date enddate;
	int capacity;
	int member_no;
	int category_no;
}
