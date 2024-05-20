package com.remake.weplay.team.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class TeamApplication {
	
	private int applyNo;
	private int memberNo;
	private int teamNo;
	private String applyContent;
	private String applyDate;
	private String status;
	private String nickName;
	
}
