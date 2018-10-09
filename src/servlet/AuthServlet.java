package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import entity.HibernateSessionFactory;
import entity.RoleInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import whw.Service;

@WebServlet(urlPatterns = {"/AuthServlet"}, asyncSupported = true, 
name = "AuthServlet") 
public class AuthServlet extends HttpServlet {

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
		System.out.println("AuthServlet参数传递过来了action    "+action);
		if("showAuth".equals(action))
		{
			request.getRequestDispatcher("showAuth.jsp").forward(request, response);
		}
		else if("menu".equals(action))
		{
			System.out.println("传递过来的参数是menu      "+action);
			HttpSession webSession = request.getSession();
			String roleId = webSession.getAttribute("roleId").toString();
			String [] authIdsArray = Service.getAuthIdsByRoleId(roleId);
			String parentId = request.getParameter("parentId");
			JSONArray jsonArray = Service.getAuthIdsByParentId(parentId, authIdsArray);
			System.out.println("查询回来的jsonarray是"+jsonArray.toString());
			out.println(jsonArray.toString());
			out.flush();
			out.close();
		}
		
	}

}
