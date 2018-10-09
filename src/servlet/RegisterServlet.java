package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.HibernateSessionFactory;
import entity.InstitutionInfo;
import entity.UserInfo;

import whw.DBOperation;

@WebServlet(urlPatterns = {"/RegisterServlet"}, asyncSupported = true, 
name = "RegisterServlet") 
public class RegisterServlet extends HttpServlet {

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
		// 获取标识符
		String action = request.getParameter("action");
		System.out.println("值已经传递过来了  "+action);
		
		String submitName = request.getParameter("submit");
		//防止刷新提交  如果是刷新提交submitName是null
		if(submitName == null || submitName.equals(""))
		{
			System.out.println("刷新提交已经返回");
			request.getRequestDispatcher("/user/register.jsp").forward(request, response);
		}
		//点击提交按钮提交数据
		else
		{
			//action参数是register
			if(action.equals("register"))
			{
				//获取公司名称和组织机构代码
				String Name = request.getParameter("name").trim();
				String InstitutionCoding = request.getParameter("InstitutionCoding").trim();
				System.out.println("传递过来的公司名称和机构代码是"+Name+"     "+InstitutionCoding);
				//request.getRequestDispatcher("/user/FillinForm1.jsp").forward(request, response);
				//获取session对象
				Session session = HibernateSessionFactory.getSession();
				System.out.println("session对象创建成功");
				//开始事务
				Transaction tran = session.beginTransaction();
				System.out.println("session对象开始事务");
				//从数据库里面取出相应组织机构代码的公司   如果没有对应的公司会抛出 org.hibernate.ObjectNotFoundException
				InstitutionInfo company = null;
				//要使用get方法不要使用load方法 get方法找不到对象会返回一个null load方法找不到对象会抛出 org.hibernate.ObjectNotFoundException
				company = (InstitutionInfo) session.get(InstitutionInfo.class,InstitutionCoding);
				//根据用户填写的组织机构代码获取
				if(company == null)
				{
					System.out.println("company为null");
					session.close();
					System.out.println("连接关闭");
					out.write("<script language='javascript'>alert('不存在该机构')</script>");
					request.getRequestDispatcher("register.jsp").forward(request, response);
				}
				else
				{
					//机构名称和组织机构代码不匹配
					if((!company.getInstitutionCoding().equals(InstitutionCoding)))
					{
						session.close();
						System.out.println("连接关闭");
						out.write("<script language='javascript'>alert('机构名称或组织机构代码错误')</script>");
						
					}
					//公司名称和组织机构代码匹配
					else
					{
						//用联系人名字来防止机构重复注册  联系人名字不为空说明该机构已经注册过了
						String linkMan = company.getLinkMan();
						if(linkMan != null)
						{
							session.close();
							System.out.println("连接关闭");
							out.write("<script language='javascript'>alert('该机构已经注册')</script>");
							
						}
						//联系人名称为null说明该机构还未注册
						else
						{
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
							
							//设置公司信息
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
							
							//将用户名和密码保存在用户表里面
							
							//更新该机构在数据库的数据
							session.update(company);
							//提交事务
							tran.commit();
							//关闭连接
							session.close();
							System.out.println("连接关闭");
							
							//下面要把用户名和密码加入到用户表当中
							Session sessionUser = HibernateSessionFactory.getSession();
							sessionUser.beginTransaction();
							//sessionUser.beginTransaction();
							UserInfo user = new UserInfo();
							user.setInsName(Name);
							user.setUserName(LinkMan);
							user.setPwd(Pwd);
							user.setRoleId(1);
							sessionUser.save(user);
							sessionUser.getTransaction().commit();
							sessionUser.close();
							out.write("<script language='javascript'>alert('机构注册成功,系统将跳转到登录界面');window.location='main.html'</script>");
						}
					}
				}
				
			}
		}//register
		
		
	

		
		
		
		
}//dopost
}//class	
