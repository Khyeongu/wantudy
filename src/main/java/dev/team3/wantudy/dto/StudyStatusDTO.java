package dev.team3.wantudy.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
/*
 * studyDTO에 현재 진행중인 인원 정보를 포함한 DTO. search 페이지에서 스터디 정보를 카드로 보여줄 때 사용.
 */
public class StudyStatusDTO {
	int no;
	String name;
	String content;
	Date startdate;
	Date enddate;
	int capacity;
	int member_no;
	int category_no;
	int member_count;
	String category;

}
