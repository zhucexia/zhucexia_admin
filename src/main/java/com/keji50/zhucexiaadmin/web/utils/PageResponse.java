package com.keji50.zhucexiaadmin.web.utils;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

import com.github.pagehelper.Page;

public class PageResponse<E> {

	public PageResponse(Page<E> page) {
		this.pageBeans = page.getResult();
		this.totalPage = page.getPages();
		this.totalCount = page.getTotal();
		this.pageSize = page.getPageSize();
		this.pageNum = page.getPageNum();
	}
	
	// 目标实例集合
	@Setter @Getter
	private List<E> pageBeans;

	// 每页记录数
	@Setter @Getter
	private int pageSize;

	// 当前页码
	@Setter @Getter
	private int pageNum;

	// 总页数
	@Setter @Getter
	private int totalPage;

	// 总记录数
	@Setter @Getter
	private long totalCount;
}
