package com.need02.action;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.need02.pojo.Company;
import com.need02.service.service;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 用户管理控制器
 * */
public class userAction extends ActionSupport {

	private static final long serialVersionUID = -281275682819237996L;

	
	private Company user = new Company(); 
	
	@SuppressWarnings("rawtypes")
	private service<Company> userService;
	
	private List<Company> users;
	
	private String searchText;
	
	private String randcode;
	
	
	public String getRandcode()
	{
		return randcode;
	}

	public void setRandcode(String randcode)
	{
		this.randcode = randcode;
	}

	// 登录函数
	public String doLogin() throws UnsupportedEncodingException
	{
		if(this.user.getCname() == null || this.user.getPassword() == null) 
			return INPUT;
		ActionContext actionContext=ActionContext.getContext();
		Map<String,Object> sessions= actionContext.getSession();
		String rightcode=(String) sessions.get("rand");
		
		
		if(!rightcode.equals(randcode))
		{
			this.addActionError("验证码输入错误！");
			return INPUT;
		}
		else
		{
			try 
			{
				System.out.print(1);
			
				Company user = userService.doLogin(this.user.getCname(), this.user.getPassword());

				
				System.out.print(1);
				if(user != null)
				{
					ActionContext.getContext().getSession().put("Company", user);
					ActionContext.getContext().getSession().put("userid", user.getCid());
					//return doQuery();
					int a = user.getWho();
					if(a==1)
					{
						return doQuery();
					}
					else
					{
						ActionContext.getContext().getSession().put("bm", user.getGovernment());
						return doQuery1();
					}
				}
				else
					return INPUT;
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
				return ERROR;
			}
		}
	}

	public String doQuery() throws Exception{
		searchText = getParam("queryText");
		users = userService.queryUsers(searchText,Company.class);
			return SUCCESS;
	}
	
	public String doQuery1() throws Exception{
		searchText = getParam("queryText");
		users = userService.queryUsers(searchText,Company.class);
		
			return "XHSUCCESS";
	}
	
	@SuppressWarnings("unchecked")
	public String doQuery2() throws Exception{
		System.out.println(1111);
		String cid=(String)ActionContext.getContext().getSession().get("userid");
		System.out.println(cid);
		user =userService.getUser(Company.class,cid);
		System.out.println(2222);
	    return SUCCESS;
	}
	

	// 注册函数
	public String doAdd()
	{
		String result = "";
		System.out.println(user.getCname());
		System.out.println(user.getCid());
		
		try {
			String param = getParam("param");
			if(Integer.parseInt(param) > 0){
				userService.addUser(user);
				result = doQuery();
			}else
				result = "addUser";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
public String doEdit() throws Exception{
		try {
			Integer param = Integer.parseInt(getParam("param"));
			if(param == 0){
				String cid = getParam("cid");
				user = (Company) userService.getUser(Company.class, cid);
				return "editUser";
			}else if(param == 1){
				userService.modifyUser(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doQuery();
	}
	public String doDelete() throws Exception{
		try {
			String param = getParam("userid");
			userService.deleteUser(param,Company.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doQuery();
	}
	
	
	//*****************************************************************************
	

	public String menu() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("textml; charset=UTF-8");
		PrintWriter out = response.getWriter();
		user =  (Company) ActionContext.getContext().getSession().get("userInsession");
		List<Company> list = (List<Company>) userService.getUser(Company.class,user.getCid());
		for (Company sysRight : list) {
			System.out.println(sysRight);
		}
			return null;
		}

	//*****************************************************************************
	
	protected String getParam(String key)
	{
		return ServletActionContext.getRequest().getParameter(key);
	}
	

	public String getSearchText() {
		return searchText;
	}

	public Company getUser() {
		return user;
	}

	public void setUser(Company user) {
		this.user = user;
	}

	public service getUserService() {
		return userService;
	}

	public void setUserService(service userService) {
		this.userService = userService;
	}

	public List<Company> getUsers() {
		return users;
	}

	public void setUsers(List<Company> users) {
		this.users = users;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

}

