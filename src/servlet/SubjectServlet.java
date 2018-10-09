package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import whw.SubjectLevel;
@WebServlet(urlPatterns = {"/SubjectServlet"}, asyncSupported = true, 
name = "SubjectServlet") 
public class SubjectServlet extends HttpServlet {

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
		System.out.println("SubjectServlet   action    "+action);
		
		if("firLevSubject".equals(action))
		{
			out.println(SubjectLevel.getFirstSubject());
			out.close();
		}
		else if("secLevSubject".equals(action))
		{
			String firSubName = new String(request.getParameter("firSubName").toString().getBytes("iso-8859-1"),"utf-8");
			System.out.println("传递过来的一级学科的名称是"+firSubName);
			out.println(SubjectLevel.getSecLevelByFirCode(SubjectLevel.getSubjectCode(firSubName)));
			out.close();
		}
		else if("tirLevSubject".equals(action))
		{
			String secSubName = new String(request.getParameter("secSubName").toString().getBytes("iso-8859-1"),"utf-8");
			System.out.println("传递过来的一级学科的名称是"+secSubName);
			out.println(SubjectLevel.getTirLevelBySecCode(SubjectLevel.getSubjectCode(secSubName)));
			out.close();
		}
	}

}
