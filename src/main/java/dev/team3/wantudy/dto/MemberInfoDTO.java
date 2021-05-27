package dev.team3.wantudy.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberInfoDTO {
	int no;
	String id;
	String password;
	String name;
	int member_no;
	int interest1;
	int interest2;
	int interest3;
	int category_no;
}
