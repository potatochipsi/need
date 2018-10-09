package entity;

import java.util.List;

public class Page {

	public Page() {
		// TODO Auto-generated constructor stub
	}
	
	//总页数
	private int totalPage;
	//总记录数
	private int totalRecord;
	//当前页数
	private int currentPage;
	//每页显示的记录数
	private int span;
	//要显示的数据
	private List<Object> dataList;
	//数据表名
	private String tableName;
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getSpan() {
		return span;
	}
	public void setSpan(int span) {
		this.span = span;
	}
	public List getDataList() {
		return dataList;
	}
	public void setDataList(List dataList) {
		this.dataList = dataList;
	}

	
	
	
}
