package com.myhome.www.item.service.impl;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ItemMapper {

	@Delete("delete from item where item_no = #{itemNo}")
	public int deleteItem(@Param("itemNo") int itemNo);
	
}


