package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import entity.HibernateSessionFactory;
import entity.InstitutionInfo;
import entity.UserInfo;

import whw.Service;

@WebServlet(urlPatterns = {"/UserServlet"}, asyncSupported = true, 
name = "UserServlet") 
public class UserServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		this.doPost(request, response);
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String action = request.getParameter("action");
		System.out.println("UserServlet传递过来的参数是action     "+action);
		//显示所用用户
		if("showUser".equals(action))
		{
			System.out.println("显示用户");
			request.getRequestDispatcher("/admin/showUser.jsp").forward(request, response);
		}
		//添加用户
		else if("addUser".equals(action))
		{
			request.getRequestDispatcher("/admin/addUser.jsp").forward(request, response);
			
		}
		//提交添加用户的信息
		else if("addUserHandin".equals(action))
		{
			String userName = request.getParameter("userName");
			String pwd = request.getParameter("pwd");
			String instName = request.getParameter("instName");
			String userDec = request.getParameter("userDec");
			System.out.println("获取的描述参数是"+userDec);
			String roleName = request.getParameter("role");
			int roleId = Service.getRoleIdByName(roleName);
			
			UserInfo user = new UserInfo();
			user.setInsName(instName);
			user.setPwd(pwd);
			user.setRoleId(roleId);
			user.setUserDec(userDec);
			System.out.println("设置的描述属性"+user.getUserDec());
			user.setUserName(userName);
			
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			session.save(user);
			session.getTransaction().commit();
			session.close();
			request.getRequestDispatcher("/admin/showUser.jsp").forward(request, response);
		}
		//显示用户的详细信息
		else if("showDetail".equals(action))
		{
			//如果是通过管理员添加的用户 只显示用户名  用户所属机构名称   用户简介
			String name = new String(request.getParameter("name").toString().getBytes("iso8859-1"),"utf-8");
			System.out.println("UserServlet 传递过来的组织机构名称为"+name);
			//根据用户名去组织机构表中去找这个用户名是否存在  如果存在就表明这个用户是某机构对应的注册用户
			//找不到就表明这是审核人员或者是管理员
			Session session = HibernateSessionFactory.getSession();  
			Criteria criteria = session.createCriteria(InstitutionInfo.class);
			criteria.add(Restrictions.eq("name",name)); 
			//不是机构注册用户
			if(criteria.list().size() == 0)
			{
				session.close();
				Session session1 = HibernateSessionFactory.getSession();
				//去用户基础信息表里面去找当前用户的基础信息
				Criteria criteria1 = session1.createCriteria(UserInfo.class);
				criteria1.add(Restrictions.eq("insName",name));
				if(criteria1.list().size() == 0)
				{
					out.write("<script language='javascript'>alert('查找失败');</script>");
				}
				else
				{
					UserInfo user = (UserInfo)criteria1.list().get(0);
					session1.close();
					request.setAttribute("institutionName",user.getInsName());
					request.setAttribute("introduction",user.getUserDec());
					request.getRequestDispatcher("/admin/userInfo.jsp").forward(request, response);
				
				}
			}
			//机构注册用户
			else 
			{
				InstitutionInfo ins = (InstitutionInfo)criteria.list().get(0);
				session.close();
				request.setAttribute("institution",ins);
				request.getRequestDispatcher("/user/userInfo.jsp").forward(request, response);
			}
		}
		
		//编辑用户信息
		else if("edit".equals(action))
		{
			String institutionCoding = request.getParameter("institutionCoding");
			System.out.println("组织机构代码是"+institutionCoding);
			if(institutionCoding != null)
			{
				//找到机构的基础信息
				Session session = HibernateSessionFactory.getSession();  
				Criteria criteria = session.createCriteria(InstitutionInfo.class);
				criteria.add(Restrictions.eq("institutionCoding",institutionCoding));
				InstitutionInfo ins = (InstitutionInfo)criteria.list().get(0);
				System.out.println("要编辑的机构是"+ins.getInstitutionCoding()+"       "+ins.getEmail());
				session.close();
				request.setAttribute("institution",ins);
				
				//对机构的地域进行处理
				String area = request.getParameter("loc");
				String[] areaArray = {"石家庄市","唐山市","秦皇岛市","邯郸市","邢台市","保定市","张家口市","承德市","沧州市","廊坊市","衡水市","定州市","辛集市","其他"};
				String[] showAreaArray = new String[14];
				showAreaArray[0] = area;
				changeArrayOrder(areaArray,area);
				request.setAttribute("areaArray",areaArray);
				request.getRequestDispatcher("/user/editInstitution.jsp").forward(request, response);
			}
			
		}
		
		//用户编辑信息后提交
		else if("editHandin".equals(action))
		{
			String institutionCoding = request.getParameter("institutionCoding");
			System.out.println("组织机构代码是"+institutionCoding);
			if(institutionCoding != null)
			{
				//找到机构的基础信息
				Session session = HibernateSessionFactory.getSession();
				session.beginTransaction();
				Criteria criteria = session.createCriteria(InstitutionInfo.class);
				criteria.add(Restrictions.eq("institutionCoding",institutionCoding));
				InstitutionInfo company = (InstitutionInfo)criteria.list().get(0);
				System.out.println("要编辑的机构是"+company.getInstitutionCoding()+"       "+company.getEmail());
				
				
				//获取机构更新后的信息
				//获取公司信息
				String ManageDepart = request.getParameter("manageDepart");
				String Pwd = request.getParameter("pwd");
				String ComAddress = request.getParameter("comAddress");
				String NetAddress = request.getParameter("netAddress");
				String Email = request.getParameter("email");
				String Corporation = request.getParameter("corporation");
				String ZipCoding = request.getParameter("zipCoding");
				String LinkMan = request.getParameter("linkMan");
				System.out.println("传递过来的联系人的名字是"+LinkMan);
				String Tel = request.getParameter("tel");
				String Phone = request.getParameter("phone");
				String Fax = request.getParameter("fax");
				String location = request.getParameter("loc");
				String Attribute = request.getParameter("attribute");
				String Introduction = request.getParameter("introduction");
				
				
				company.setManageDepartment(ManageDepart);
				company.setPwd(Pwd);
				company.setComAddress(ComAddress);
				company.setNetAddress(NetAddress);
				company.setEmail(Email);
				company.setCorporation(Corporation);
				company.setZipCoding(ZipCoding);
				company.setLinkMan(LinkMan);
				System.out.println("联系人设置成功");
				company.setTel(Tel);
				company.setPhone(Phone);
				company.setFax(Fax);
				company.setAttribute(Attribute);
				company.setLoction(location);
				company.setIntroduction(Introduction);
				
				session.update(company);
				session.close();
				request.setAttribute("institution",company);
				request.getRequestDispatcher("/user/userInfo.jsp").forward(request, response);
			}
		}
	}
	
	private void changeArrayOrder(String[] array,String index)
	{
		for(int i = 0;i < array.length;i++)
		{
			if(array[i].equals(index))
			{
				String fir = null;
				fir =array[i];
				array[i] = index;
				index = fir;
				break;
			}
		}
	}
}
