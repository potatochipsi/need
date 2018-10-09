package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import entity.UserInfo;
import entity.HibernateSessionFactory;
import entity.InstitutionInfo;

@WebServlet(urlPatterns = {"/LoginServlet"}, asyncSupported = true, 
name = "LoginServlet") 
public class LoginServlet extends HttpServlet {

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
		System.out.println("LoginServlet的doGet方法被执行");
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
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String action = request.getParameter("action");
		System.out.println("LoginServlet 传递过来的参数的值是"+action);
		//用户登录
		if("login".equals(action))
		{
			String userName = new String(request.getParameter("userName").toString().getBytes("iso8859-1"),"utf-8");
			String password = request.getParameter("pwd");
			
			System.out.println("传递过来的用户名和密码是"+userName+"    "+password);
			Session session = HibernateSessionFactory.getSession();  
			Criteria criteria = session.createCriteria(UserInfo.class);
			criteria.add(Restrictions.eq("userName",userName)); 
			criteria.add(Restrictions.eq("pwd",password));
			System.out.println("长度"+criteria.list().size());
			if(criteria.list().size() == 0)
			{
				session.close();
				System.out.println("连接关闭0");
				out.write("<script language='javascript'>alert('用户名或密码错误');window.location='login.html'</script>");
			}
			else
			{
				//获取网站的session对象  把当前登陆机构的机构信息保存到session对象中
				UserInfo userInfo = new UserInfo();
				userInfo = (UserInfo)(criteria.list().get(0));
				session.close();
				System.out.println("连接关闭");
				System.out.println("LoginServlet    "+userInfo.getUserName()+"      "+userInfo.getRoleId()+"               "+userInfo.getInsName());
				HttpSession webSession = request.getSession();
				//把用户名  机构名称  用户级别保存到webSession中
				webSession.setAttribute("userName",userInfo.getUserName());
				webSession.setAttribute("name",userInfo.getInsName());
				webSession.setAttribute("roleId",userInfo.getRoleId());
				System.out.println("存入webSession中的数据是"+webSession.getAttribute("userName")+"         "+webSession.getAttribute("name")+"         "+webSession.getAttribute("roleId"));
				out.write("<script language='javascript'>alert('登陆成功');</script>");
				request.getRequestDispatcher("main.jsp").forward(request, response);
			}
		}
		//用户退出登录
		else if("logout".equals(action))
		{
			request.getSession().removeAttribute("userName");
			request.getSession().removeAttribute("name");
			request.getSession().removeAttribute("roleId");
			out.write("<script language='javascript'>alert('退出成功');window.location='main.jsp'</script>");
		}
	}

}
