package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class BoardModel {
	@RequestMapping("board/list.do")
	public String aaa(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("msg", "게시판 목록");
		return "list.jsp";
	}
	@RequestMapping("board/insert.do")
	public String bbb(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("msg", "게시판 추가");
		return "insert.jsp";
	}
	@RequestMapping("board/update.do")
	public String ccc(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("msg", "게시판 수정");
		return "update.jsp";
	}
	@RequestMapping("board/delete.do")
	public String ddd(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("msg", "게시판 삭제");
		return "delete.jsp";
	}
}
