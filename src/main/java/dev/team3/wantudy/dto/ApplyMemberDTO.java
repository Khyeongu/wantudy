package dev.team3.wantudy.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApplyMemberDTO {
	int no;
	String name;
	int skip;
	int interest_no;
	String interest_name;
	String member_img;
}
