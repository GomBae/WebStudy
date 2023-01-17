package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class UpdateModel {
	public void execute(HttpServletRequest request) {
		request.setAttribute("msg", "데이터 수정");
	}
}
