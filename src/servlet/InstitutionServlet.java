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
import org.hibernate.SessionFactory;

import entity.HibernateSessionFactory;
import entity.InstitutionInfo;

@WebServlet(urlPatterns = {"/InstitutionServlet"}, asyncSupported = true, 
name = "InstitutionServlet") 
public class InstitutionServlet extends HttpServlet {

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
		System.out.println("传递过来的参数是"+action);
		//显示用户信息
		if("show".equals(action))
		{
			request.getRequestDispatcher("/user/userInfo.jsp").forward(request, response);
		}
		else if("edit".equals(action))
		{
			//防止刷新提交
			String submit = request.getParameter("submit");
			if(submit == null)
			{
				request.getRequestDispatcher("/user/userInfo.jsp").forward(request, response);
			}
			//正常提交
			else
			{
				String n = request.getParameter("nn");
				System.out.println("nn"+n);
				HttpSession webSession = request.getSession();
				//获取组织机构代码
				String institutionCoding = webSession.getAttribute("institutionCoding").toString();
				System.out.println("institutionCoding"+institutionCoding);
				Session session = HibernateSessionFactory.getSession();
				session.beginTransaction();
				InstitutionInfo institution = (InstitutionInfo)session.get(InstitutionInfo.class,institutionCoding);
				
				if(institution == null)
				{
					System.out.println("null");
				}
				String name = request.getParameter("name");
				
				String manageDepart = request.getParameter("manageDepart");
				System.out.println("manageDepart"+manageDepart);
				String pwd = request.getParameter("pwd");
				String comAddress = request.getParameter("comAddress");
				String netAddress = request.getParameter("netAddress");
				String email = request.getParameter("email");
				String corporation = request.getParameter("corporation");
				String zipCoding = request.getParameter("zipCoding");
				String linkMan = request.getParameter("linkMan");
				String tel = request.getParameter("tel");
				String phone = request.getParameter("phone");
				String fax = request.getParameter("fax");
				String attribute = request.getParameter("attribute");
				String introduction = request.getParameter("introduction");
				
				
				institution.setManageDepartment(manageDepart);
				//System.out.println("value"+institution.getManageDepartment());
				institution.setPwd(pwd);
				institution.setComAddress(comAddress);
				institution.setNetAddress(netAddress);
				institution.setEmail(email);
				institution.setCorporation(corporation);
				institution.setZipCoding(zipCoding);
				institution.setLinkMan(linkMan);
				System.out.println("联系人设置成功");
				institution.setTel(tel);
				institution.setPhone(phone);
				institution.setFax(fax);
				institution.setAttribute(attribute);
				institution.setIntroduction(introduction);	
				
				session.update(institution);
				session.getTransaction().commit();
				session.close();
				//System.out.println("sesion对象关闭");
				out.write("<script language='javascript'>alert('登陆成功');</script>");
				request.getRequestDispatcher("/user/userInfo.jsp").forward(request, response);
			}
		}
	}

}
