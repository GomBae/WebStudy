package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class FoodModel {
	@RequestMapping("food/food_list.do")
	public String food_list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("msg", "맛집 목록 출력");
		return "food_list.jsp";
	}
	
	@RequestMapping("food/category.do")
	public String food_category(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("msg", "맛집 카테고리 출력");
		return "category.jsp";
	}
	
	@RequestMapping("food/food_detail.do")
	public String food_detail(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("msg", "맛집 상세보기 출력");
		return "food_detail.jsp";
	}
}
