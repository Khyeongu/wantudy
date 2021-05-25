package dev.team3.wantudy.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
	int no;
	String id;
	String password;
	String name;
	
	public MemberDTO(int no, String id, String password, String name) {
		this.no=no;
		this.id=id;
		this.password=password;
		this.name=name;
	}
}	
