package com.need02.service;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.need02.dao.Tbase;
import com.need02.pojo.Company;
import com.need02.pojo.Technology;
import com.opensymphony.xwork2.ActionContext;

/**
 * 用户管理业务逻辑的实现
 * */
public class Tservice<T> {
	
private Tbase tBase;

//选择查询的类型
private String txt_1_sel;
private String txt_2_sel;
private String txt_3_sel;
private String txt_4_sel;
private String txt_5_sel;
private String txt_6_sel;
private String txt_7_sel;
private String txt_8_sel;
private String txt_9_sel;
//是否是模糊查询,是否是%
private String txt_1_special1;
private String txt_2_special1;
private String txt_3_special1;
private String txt_4_special1;
private String txt_5_special1;
private String txt_6_special1;
private String txt_7_special1;
private String txt_8_special1;
private String txt_9_special1;
//或者or、并且and、不含not

private String txt_2_logical;
private String txt_3_logical;
private String txt_4_logical;
private String txt_5_logical;
private String txt_6_logical;
private String txt_7_logical;
private String txt_8_logical;
private String txt_9_logical;

//
public List<Technology> queryUsers(String txt_1_value1,
		String txt_2_value1, String txt_3_value1, String txt_4_value1,
		String txt_5_value1, String txt_6_value1, String txt_7_value1,
		String txt_8_value1, String txt_9_value1, Class<Technology> class1)
				throws Exception{
	//第一个
	txt_1_sel = getParam("txt_1_sel");
	txt_1_special1 = getParam("txt_1_special1");//是否是%
	String queryString="SELECT u FROM Technology u WHERE u."+txt_1_sel+" like '"+txt_1_special1+""+txt_1_value1+""+txt_1_special1+"'";				
	//select * from Technology where txt_1_sel like'%txt_1_special1%'
	//第二个
	txt_2_logical = getParam("txt_2_logical");//第二个和第一个的关系
	txt_2_sel = getParam("txt_2_sel");
	txt_2_special1 = getParam("txt_2_special1");
	if(txt_2_logical==null){
		queryString = queryString;
	}
	else
	{
		if(txt_2_value1 == null||txt_2_value1.equals(""))
		{
			txt_2_special1 = "%";
		}
		queryString = queryString+""+txt_2_logical+" u."+txt_2_sel+" like '"+txt_2_special1+""+txt_2_value1+""+txt_2_special1+"'";	
	}
	
	//第三个
	txt_3_logical = getParam("txt_3_logical");
	txt_3_sel = getParam("txt_3_sel");
	txt_3_special1 = getParam("txt_3_special1");
	if(txt_3_logical==null){
		queryString = queryString;
	}
	else{
	if(txt_3_value1 == null||txt_3_value1.equals(""))
	{
		txt_3_special1 = "%";
	}
	queryString = queryString+""+txt_3_logical+" u."+txt_3_sel+" like '"+txt_3_special1+""+txt_3_value1+""+txt_3_special1+"'";
	}
	//第四个
	txt_4_logical = getParam("txt_4_logical");
	txt_4_sel = getParam("txt_4_sel");
	txt_4_special1 = getParam("txt_4_special1");	
	if(txt_4_logical==null){
		queryString = queryString;
	}
	else{
	if(txt_4_value1 == null||txt_4_value1.equals(""))
	{
		txt_4_special1 = "%";
	}
	queryString = queryString+""+txt_4_logical+" u."+txt_4_sel+" like '"+txt_4_special1+""+txt_4_value1+""+txt_4_special1+"'";	
	}
		
	//第五个
	txt_5_logical = getParam("txt_5_logical");
	txt_5_sel = getParam("txt_5_sel");
	txt_5_special1 = getParam("txt_5_special1");	
	if(txt_5_logical==null){
		queryString = queryString;
	}
	else{
	if(txt_5_value1 == null||txt_5_value1.equals(""))
	{
		txt_5_special1 = "%";
	}
	queryString = queryString+""+txt_5_logical+" u."+txt_5_sel+" like '"+txt_5_special1+""+txt_5_value1+""+txt_5_special1+"'";	
	}
	//第六个
	txt_6_logical = getParam("txt_6_logical");
	txt_6_sel = getParam("txt_6_sel");
	txt_6_special1 = getParam("txt_6_special1");	
	if(txt_6_logical==null){
		queryString = queryString;
	}
	else{
		if(txt_6_value1 == null||txt_6_value1.equals(""))
		{
			txt_6_special1 = "%";
		}
		queryString = queryString+""+txt_6_logical+" u."+txt_6_sel+" like '"+txt_6_special1+""+txt_6_value1+""+txt_6_special1+"'";	
	}
	
	//第7个
	txt_7_logical = getParam("txt_7_logical");
	txt_7_sel = getParam("txt_7_sel");
	txt_7_special1 = getParam("txt_7_special1");	
	if(txt_7_logical==null){
		queryString = queryString;
	}
	else{
		if(txt_7_value1 == null||txt_7_value1.equals(""))
		{
			txt_7_special1 = "%";
		}
		queryString = queryString+""+txt_7_logical+" u."+txt_7_sel+" like '"+txt_7_special1+""+txt_7_value1+""+txt_7_special1+"'";	
	}
	
	//第8个
	txt_8_logical = getParam("txt_8_logical");
	txt_8_sel = getParam("txt_8_sel");
	txt_8_special1 = getParam("txt_8_special1");	
	if(txt_8_logical==null){
		queryString = queryString;
	}
	else{
		if(txt_8_value1 == null||txt_8_value1.equals(""))
		{
			txt_8_special1 = "%";
		}
		queryString = queryString+""+txt_8_logical+" u."+txt_8_sel+" like '"+txt_8_special1+""+txt_8_value1+""+txt_8_special1+"'";	
	}
	
	//第9个
		txt_9_logical = getParam("txt_9_logical");
		txt_9_sel = getParam("txt_9_sel");
		txt_9_special1 = getParam("txt_9_special1");	
		if(txt_9_logical==null){
			queryString = queryString;
		}
		else{
			if(txt_9_value1 == null||txt_9_value1.equals(""))
			{
				txt_9_special1 = "%";
			}
			queryString = queryString+""+txt_9_logical+" u."+txt_9_sel+" like '"+txt_9_special1+""+txt_9_value1+""+txt_9_special1+"'";	
		}
		return tBase.getObjects(queryString);   
}	

	
	private String getParam(String key)
{
	// TODO Auto-generated method stub
		return ServletActionContext.getRequest().getParameter(key);
}


	public List<Technology> queryTecs(String searchText,Class<Technology> clazz) throws Exception{
		if(searchText == null || "".equals(searchText))
			return tBase.getAllObjects(clazz);
		String queryString = "select u from Technology u where u.tid like '"+searchText+"%'";
		return tBase.getObjects(queryString);
	}
	
	public List<Technology> queryTecs0(String tid,Class<Technology> clazz) throws Exception {
		String queryString = "SELECT u FROM Technology u WHERE u.sh like '%审核%'";
		return tBase.getObjects(queryString);
	}
	
	public List<Technology> queryTecs1(String tid,Class<Technology> clazz) throws Exception {
		String cid=(String)ActionContext.getContext().getSession().get("userid");
		if(tid == null || "".equals(tid))
		{
		String queryString = "SELECT u FROM Technology u WHERE u.sh like '保存' and u.cid = '"+cid+"' ";
		return tBase.getObjects(queryString);
		}
		String queryString = "SELECT u FROM Technology u WHERE u.sh like '保存' and  u.tid like '"+tid+"%' u.cid = '"+cid+"' ";
		return tBase.getObjects(queryString);
	}
	
	public List<Technology> queryTecs2(String tid,Class<Technology> clazz) throws Exception {
		String cid=(String)ActionContext.getContext().getSession().get("userid");
		if(tid == null || "".equals(tid))
		{
		String queryString = "SELECT u FROM Technology u WHERE u.sh like '%审核通过%' and u.cid = '"+cid+"' ";
		return tBase.getObjects(queryString);
		}
		String queryString = "SELECT u FROM Technology u WHERE u.sh like '%审核通过%' and  u.tid like '"+tid+"%' u.cid = '"+cid+"' ";
		return tBase.getObjects(queryString);
	}
	
	public List<Technology> queryTecs3(String tid,Class<Technology> clazz) throws Exception {
		String cid=(String)ActionContext.getContext().getSession().get("userid");
		if(tid == null || "".equals(tid))
		{
		String queryString = "SELECT u FROM Technology u WHERE u.sh like '%审核不通过' and u.cid = '"+cid+"' ";
		return tBase.getObjects(queryString);
		}
		String queryString = "SELECT u FROM Technology u WHERE u.sh like '%审核不通过' and  u.tid like '"+tid+"%' u.cid = '"+cid+"' ";
		return tBase.getObjects(queryString);
	}
	
	public List<Technology> queryTecs4(String tid,Class<Technology> clazz) throws Exception{
		if(tid == null || "".equals(tid))
			return tBase.getAllObjects(clazz);
		String queryString = "SELECT u FROM Technology u WHERE u.tid like '"+tid+"%'";
		return tBase.getObjects(queryString);
	}
	
	public List<Technology> queryTecs5(String tid,Class<Technology> clazz) throws Exception {
		//String bm=(String)ActionContext.getContext().getSession().get("bm");
		if(tid == null || "".equals(tid))
		{
		String queryString = "SELECT u FROM Technology u WHERE u.sh like '等待形式审核%' ";
		return tBase.getObjects(queryString);
		}
		String queryString = "SELECT u FROM Technology u WHERE u.sh like '等待形式审核%' and  u.tid like '"+tid+"%' ";
		return tBase.getObjects(queryString);
	}
	
	public List<Technology> queryTecs6(String tid,Class<Technology> clazz) throws Exception {
		String bm=(String)ActionContext.getContext().getSession().get("bm");
		if(tid == null || "".equals(tid))
		{
		String queryString = "SELECT u FROM Technology u WHERE u.sh like '等待技术审核%' and u.bm = '"+bm+"' ";
		return tBase.getObjects(queryString);
		}
		String queryString = "SELECT u FROM Technology u WHERE u.sh like '等待技术审核%' and  u.tid like '"+tid+"%' u.bm = '"+bm+"' ";
		return tBase.getObjects(queryString);
	}
	
	public void add(T tec) throws Exception{
		tBase.addObject(tec);
	}
	
	public void modify(T tec) throws Exception{
		tBase.updateObject(tec);
	}
	
	public void delete(String tid,Class<T> clazz) throws Exception{
		T u = tBase.getObject(clazz, tid);
		tBase.deleteObject(u);
	}
	
	public T get(Class<T> clazz, String tid){
		return tBase.getObject(clazz, tid);
	}

	public Tbase gettBase()
	{
		return tBase;
	}

	public void settBase(Tbase tBase)
	{
		this.tBase = tBase;
	}

}
