package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.hibernate.Session;

import whw.PageUtil;
import whw.Service;
import entity.HibernateSessionFactory;
import entity.Page;
import entity.RoleInfo;

@WebServlet(urlPatterns = {"/RoleServlet"}, asyncSupported = true, 
name = "RoleServlet") 
public class RoleServlet extends HttpServlet {

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
		System.out.println("RoleServlet参数传递过来了 action        "+action);
		
		if("showRole".equals(action))
		{
			String curPage = request.getParameter("currentPage");
			int currentPage = Integer.parseInt(curPage);
			System.out.println("字符串            "+curPage+"           数字"+currentPage);
			PageUtil pageUtil = new PageUtil(5,currentPage,"RoleInfo");
			pageUtil.setPageInfo();
			Page page = pageUtil.getPage();
			request.setAttribute("page",page);
			request.getRequestDispatcher("/admin/showRole.jsp").forward(request, response);
		}
		else if("addRole".equals(action))
		{
			request.getRequestDispatcher("/admin/addRole.jsp").forward(request, response);
		}
		else if("addRoleHandin".equals(action))
		{
			//获取用户选择的权限的id
			String selectedAuthId = request.getParameter("roleId");
			System.out.println("用户传递过来的权限id"+selectedAuthId);
			//获取添加父权限id后的权限id
			String authId = Service.getAuthIDs(selectedAuthId.substring(0,selectedAuthId.length()-1));
			System.out.println("添加父id后的权限id为"+authId);
			//角色名称
			String roleName = request.getParameter("roleName");
			//角色描述
			String roleDec = request.getParameter("roleDec");
			RoleInfo role = new RoleInfo();
			role.setAuthIds(authId);
			role.setRoleName(roleName);
			role.setRoleDec(roleDec);
			
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			session.save(role);
			session.getTransaction().commit();
			session.close();
			
			//JSONObject jsonObject = new JSONObject();
			//jsonObject.put("returnData", "success");
			//out.println(jsonObject.toString());
			//out.close();
			
			//请求是从ajax那里过来的 页面的跳转是不会执行的
			//因为ajax设计的目的就是保证页面不用跳转 所以要想实现页面跳转必须得在ajax的回调函数里面实现跳转
			PageUtil pageUtil = new PageUtil(5,1,"RoleInfo");
			pageUtil.setPageInfo();
			Page page = pageUtil.getPage();
			request.setAttribute("page",page);
			request.getRequestDispatcher("/admin/showRole.jsp").forward(request, response);
			
		}
	}

}
