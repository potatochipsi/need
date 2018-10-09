package com.need02.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.need02.pojo.Company;
import com.need02.pojo.Technology;
import com.need02.service.Tservice;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 用户管理控制器
 * */
public class TAction extends ActionSupport {

	private static final long serialVersionUID = -281275682819237996L;

	
	private Technology tec = new Technology(); 
	
	@SuppressWarnings("rawtypes")
	private Tservice<Technology> tService;
	
	private List<Technology> tecs;
	
	private String searchText;
	
	//*********输入框的值***********
	private String txt_1_value1;
	private String txt_2_value1;
	private String txt_3_value1;
	private String txt_4_value1;	
	private String txt_5_value1;
	private String txt_6_value1;
	private String txt_7_value1;
	private String txt_8_value1;
	private String txt_9_value1;
	//********************

	//********多条件查询********************
	public String doSelect() throws Exception{
		//获得输入的值
		txt_1_value1 = getParam("txt_1_value1");
		txt_2_value1 = getParam("txt_2_value1");
		txt_3_value1 = getParam("txt_3_value1");
		txt_4_value1 = getParam("txt_4_value1");
		txt_5_value1 = getParam("txt_5_value1");
		txt_6_value1 = getParam("txt_6_value1");
		txt_7_value1 = getParam("txt_7_value1");
		txt_8_value1 = getParam("txt_8_value1");
		txt_9_value1 = getParam("txt_9_value1");
		//查询
		tecs = tService.queryUsers(txt_1_value1,txt_2_value1,txt_3_value1,txt_4_value1,
				txt_5_value1,txt_6_value1,txt_7_value1,txt_8_value1,txt_9_value1, Technology.class);
		System.out.println("查询成功"+tecs.size());
		return SUCCESS;
	}
	
	// 查询函数
	public String doQuery() throws Exception{
		searchText = getParam("queryText");
		tecs = tService.queryTecs(searchText,Technology.class);
			return SUCCESS;
	}
	
	public String doQuery0()   {
		try{
			searchText = getParam("queryText");
			tecs = tService.queryTecs0(searchText, Technology.class);
			return SUCCESS;
			}catch (Exception e) {
				e.printStackTrace();
				return ERROR;
				}
	}
	
	public String doQuery1() throws Exception{
		try{
			searchText = getParam("queryText");			
			tecs = tService.queryTecs1(searchText, Technology.class);
			System.out.println("x"+tecs.get(0));
			return SUCCESS;
			}catch (Exception e) {
				e.printStackTrace();
				return ERROR;
				}
	}
	
	public String doQuery2()   {
		try{
			searchText = getParam("queryText");
			tecs = tService.queryTecs2(searchText, Technology.class);
			return SUCCESS;
			}catch (Exception e) {
				e.printStackTrace();
				return ERROR;
				}
	}
	
	public String doQuery3()   {
		try{
			searchText = getParam("queryText");
			tecs = tService.queryTecs3(searchText, Technology.class);
			return SUCCESS;
			}catch (Exception e) {
				e.printStackTrace();
				return ERROR;
				}
	}
	
	public String doQuery5()   {
		try{
			searchText = getParam("queryText");
			tecs = tService.queryTecs5(searchText, Technology.class);
			return SUCCESS;
			}catch (Exception e) {
				e.printStackTrace();
				return ERROR;
				}
	}
	
	public String doQuery6()   {
		try{
			searchText = getParam("queryText");
			tecs = tService.queryTecs6(searchText, Technology.class);		
			return SUCCESS;
			}catch (Exception e) {
				e.printStackTrace();
				return ERROR;
				}
	}
	
	public String doQuery4()   {
		System.out.println(1111);
		String tid=getParam("tname");
		System.out.println(tid);
		tec = tService.get(Technology.class,tid);
	    ServletActionContext.getRequest().setAttribute("teclist",tec);
		//ActionContext.getContext().getSession().put("tid", tec.getTid());
		System.out.println("查询成功"+tec.getTid());
	    return SUCCESS;
	}

	// 添加函数
	public String doAdd()
	{
		String result = "";
		System.out.println("添加技术");
		System.out.println(tec.getBm());
		System.out.println(tec.getClassify());
		
		try {
			String param = getParam("param");
			if(Integer.parseInt(param)==1){
				tService.add(tec);
				result = doQuery();
			}else
				result = "addTec";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
public String doEdit() throws Exception{
		try {
			Integer param = Integer.parseInt(getParam("param"));
			if(param == 0){
				
				String tid = getParam("tname");
				//String tid=(String)ActionContext.getContext().getSession().get("tid");
				tec = (Technology) tService.get(Technology.class, tid);
				return "editTec";
			}else if(param == 1){
				System.out.println("修改"+tec.getTid());
				tService.modify(tec);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doQuery();
	}

	public String doDelete() throws Exception{
		try {
			String param = getParam("ttid");
			tService.delete(param,Technology.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doQuery();
	}
	
	protected String getParam(String key)
	{
		return ServletActionContext.getRequest().getParameter(key);
	}

	public Technology getTec()
	{
		return tec;
	}

	public void setTec(Technology tec)
	{
		this.tec = tec;
	}

	public Tservice<Technology> gettService()
	{
		return tService;
	}

	public void settService(Tservice<Technology> tService)
	{
		this.tService = tService;
	}

	public List<Technology> getTecs()
	{
		return tecs;
	}

	public void setTecs(List<Technology> tecs)
	{
		this.tecs = tecs;
	}

	public String getSearchText()
	{
		return searchText;
	}

	public void setSearchText(String searchText)
	{
		this.searchText = searchText;
	}

	public static long getSerialversionuid()
	{
		return serialVersionUID;
	}

	public String getTxt_1_value1()
	{
		return txt_1_value1;
	}

	public void setTxt_1_value1(String txt_1_value1)
	{
		this.txt_1_value1 = txt_1_value1;
	}

	public String getTxt_2_value1()
	{
		return txt_2_value1;
	}

	public void setTxt_2_value1(String txt_2_value1)
	{
		this.txt_2_value1 = txt_2_value1;
	}

	public String getTxt_3_value1()
	{
		return txt_3_value1;
	}

	public void setTxt_3_value1(String txt_3_value1)
	{
		this.txt_3_value1 = txt_3_value1;
	}

	public String getTxt_4_value1()
	{
		return txt_4_value1;
	}

	public void setTxt_4_value1(String txt_4_value1)
	{
		this.txt_4_value1 = txt_4_value1;
	}

	public String getTxt_5_value1()
	{
		return txt_5_value1;
	}

	public void setTxt_5_value1(String txt_5_value1)
	{
		this.txt_5_value1 = txt_5_value1;
	}

	public String getTxt_6_value1()
	{
		return txt_6_value1;
	}

	public void setTxt_6_value1(String txt_6_value1)
	{
		this.txt_6_value1 = txt_6_value1;
	}

	public String getTxt_7_value1()
	{
		return txt_7_value1;
	}

	public void setTxt_7_value1(String txt_7_value1)
	{
		this.txt_7_value1 = txt_7_value1;
	}

	public String getTxt_8_value1()
	{
		return txt_8_value1;
	}

	public void setTxt_8_value1(String txt_8_value1)
	{
		this.txt_8_value1 = txt_8_value1;
	}

	public String getTxt_9_value1()
	{
		return txt_9_value1;
	}

	public void setTxt_9_value1(String txt_9_value1)
	{
		this.txt_9_value1 = txt_9_value1;
	}	
}

