package com.sist.change;

public class JspChange {
	private static String[] jsp= {
			"../main/home.jsp",
			"../seoul/location.jsp",
			"../seoul/nature.jsp",
			"../seoul/shop.jsp",
			"../food/food_find.jsp",
			"../databoard/list.jsp",
			"../food/food_detail.jsp",
			"../databoard/insert.jsp",
			"../databoard/detail.jsp",
			"../databoard/delete.jsp",
			"../databoard/update.jsp"
	};
    public static String change(int no) {
    	return jsp[no];
    }
}
