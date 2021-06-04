package dev.team3.wantudy.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

/*
 * jsp 에서 date를 읽을 때 정상적으로 받아오지 못하므로 date 를 string으로 받는 dto
 */
public class StudyStatusForJspDTO {

	int no;
	String name;
	String content;
	String startdate;
	String enddate;
	int capacity;
	int member_no;
	int category_no;
	int member_count;
	String category;
	String category_imgpath;
}
