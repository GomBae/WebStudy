package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class ListModel {
	public void execute(HttpServletRequest request) {
		request.setAttribute("msg", "데이터 목록 출력");
	}
}
