package dev.team3.wantudy.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberDTO {
	int no;
	String id;
	String password;
	String name;
}	
