package dev.team3.wantudy.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
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
