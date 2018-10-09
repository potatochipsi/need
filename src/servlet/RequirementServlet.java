package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import whw.Service;

import entity.HibernateSessionFactory;
import entity.InstitutionInfo;
import entity.RequirementInfo;

@WebServlet(urlPatterns = {"/RequirementServlet"}, asyncSupported = true, 
name = "RequirementServlet") 
public class RequirementServlet extends HttpServlet {

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
		System.out.println("doGetF方法被执行");
		this.doPost(request, response);
		System.out.println("dopost方法被调用了");
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
		System.out.println("dopost开始执行");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		System.out.println("传递过来的参数是"+action);
		//非正常提交回到首页
		if(action == null)
		{
			System.out.println("RequirementServlet dopost方法 action null");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		//提交表单信息
		else if("addRequireHandin".equals(action))
		{
			String submit = request.getParameter("submit");
			String save = request.getParameter("save");
			//String institutionCoding = requ
			System.out.println("submit的名称是"+submit+"   save的名称是"+save);
			System.out.println("传递过来的参数是add");
			RequirementInfo require = new RequirementInfo();
			//技术需求编号
			String reqirNum = request.getParameter("Num");
			require.setRequirementCoding(reqirNum);
			System.out.println(require.getRequirementCoding());
			//需求名称
			require.setName(request.getParameter("Name"));
			//起始年限
			require.setTimeLimited(request.getParameter("StartYear")+"/"+request.getParameter("EndYear"));
			//主要问题
			require.setIntroMainProblem(request.getParameter("Intro_MainProblem"));
			//关键技术
			require.setIntroTechnologyKey(request.getParameter("Intro_TechnologyKey"));
			//预期目标
			require.setIntroExceptGoal(request.getParameter("Intro_ExceptGoal"));
			//关键字
			require.setKeyWord(request.getParameter("key1")+"/"+request.getParameter("key2")+"/"+request.getParameter("key3")+"/"+request.getParameter("key4")+"/"+request.getParameter("key5"));
			//科技活动类型 数据库里面存储的是研究类型
			require.setStudyType(request.getParameter("TechnologyType"));
			//学科分类
			require.setSubjectType(request.getParameter("SubjectType1")+"/"+request.getParameter("SubjectType1")+"/"+request.getParameter("SubjectType1"));
			//技术需求所属领域           这是一个多选框传递过来的是一个String[] 
			//把各个技术需求用斜杠隔开保存到数据库的一个字段当中
			String[] technologyArea = request.getParameterValues("TechnologyArea");
			String techArea = "";
			if(technologyArea != null)
			{
				for(int i = 0;i < technologyArea.length;i++)
				{
					techArea = techArea + technologyArea[i] + "/";
					System.out.println(technologyArea[i]);
				}
				System.out.println("技术需求所属领域为"+technologyArea);
				require.setTechnologyArea(request.getParameter("techArea"));
			}
			//技术需求应用行业
			require.setApplyIndustry(request.getParameter("ApplyIndustry"));
			//解决方式
			require.setDealWay(request.getParameter("DealWay"));
			//合作意向单位
			require.setCooperationIndustry(request.getParameter("CooperationIndustry"));
			//所需资金总额
			require.setMoneyNeed(request.getParameter("MoneyNeed"));
			//设置技术需求所对应的组织机构代码
			System.out.println("表单提交过来的组织机构代码为"+request.getParameter("institutionCoding"));
			require.setInstitutionCoding(request.getParameter("institutionCoding"));
			System.out.println("需求信息的组织机构代码为"+require.getInstitutionCoding());
			require.setAddTime(new Timestamp((new Date()).getTime()));
			System.out.println("技术需求的添加时间为"+require.getAddTime());
			//设置技术需求对应的审核状态
			if("提交".equals(submit))
			{
				require.setNowState("提交待形式审核");
			}
			else
			{
				require.setNowState("保存未提交");
			}
			
			//把数据对象保存到数据库
			Session session = HibernateSessionFactory.getSession(); 
			session.beginTransaction();
			System.out.println(require.getRequirementCoding()+"gg");
			session.save(require);
			session.getTransaction().commit();
			session.close();
			
			//System.out.println("需求添加成功");
			//out.write("<script language='javascript'>alert('需求填写成功');</script>");
			String institutionCoding = request.getParameter("institutionCoding");
			request.setAttribute("institutionCoding",institutionCoding);
			request.getRequestDispatcher("/user/userRequirement.jsp").forward(request, response);
		}
		else if("addRequire".equals(action))
		{
			String name = new String(request.getParameter("name").toString().getBytes("iso8859-1"),"utf-8");
			Session session = HibernateSessionFactory.getSession();  
			Criteria criteria = session.createCriteria(InstitutionInfo.class);
			criteria.add(Restrictions.eq("name",name)); 
			//在机构基础信息表里面查找未到当前用户的基本信息 未能添加需求
			if(criteria.list().size() == 0)
			{
				session.close();
				out.write("<script language='javascript'>alert('您未是机构注册用户,您未能填写需求');</script>");
			}
			else
			{
				
				
				//获取组织机构代码
				String institutionCoding = ((InstitutionInfo)criteria.list().get(0)).getInstitutionCoding();
			    System.out.println("查询到的组织机构代码为"+institutionCoding);
				session.close();
			    request.setAttribute("institutionCoding",institutionCoding);
			
			    System.out.println("用户设置的组织机构代码为"+request.getAttribute("institutionCoding"));
				request.getRequestDispatcher("/user/FillinForm1.jsp").forward(request, response);
			}
			
		}
		else if("showRequire".equals(action))
		{
			String name = new String(request.getParameter("name").toString().getBytes("iso8859-1"),"utf-8");
			Session session = HibernateSessionFactory.getSession();  
			Criteria criteria = session.createCriteria(InstitutionInfo.class);
			criteria.add(Restrictions.eq("name",name)); 
			//在机构基础信息表里面查找未到当前用户的基本信息 未能添加需求
			if(criteria.list().size() == 0)
			{
				session.close();
				out.write("<script language='javascript'>alert('您未是机构注册用户，无法查看需求');</script>");
			}
			else
			{
				//获取组织机构代码
				String institutionCoding = ((InstitutionInfo)criteria.list().get(0)).getInstitutionCoding();
			    session.close();
			    request.setAttribute("institutionCoding",institutionCoding);
				request.getRequestDispatcher("/user/userRequirement.jsp").forward(request, response);
			}
		}
		
		//普通用户查看查看自己提交的某一条需求
		else if("normalUser".equals(action))
		{
			//获取所要查看的需求的编号 查找到对应的需求信息 然后传递给页面显示
			String requirementCoding = request.getParameter("requirementCoding").toString();
			Session session = HibernateSessionFactory.getSession();  
			Criteria criteria = session.createCriteria(RequirementInfo.class);
			criteria.add(Restrictions.eq("requirementCoding",requirementCoding));
			RequirementInfo require = (RequirementInfo)criteria.list().get(0);
			//把开始年限和结束年限分开
			String[] time = {"",""};
			time = require.getTimeLimited().toString().split("/");
			String startYear = time[0];
			String endYear = time[1];
			System.out.println("RequirementServlet获取的需求起始年限为"+time[0]+"需求的结束年限为"+time[1]);
			request.setAttribute("startYear",startYear);
			request.setAttribute("endYear",endYear);
			//把五个关健字分开
			String[] keyWord = {"","","","",""};
			keyWord = require.getKeyWord().toString().split("/");
			System.out.print("RequirementServlet获取的关键字为");
			for(int i = 0;i < keyWord.length;i++)
			{
				System.out.print(keyWord[i]+"   ");
			}
			request.setAttribute("keyWord",keyWord);
			request.setAttribute("require",require);
			request.getRequestDispatcher("/user/requirementInfo.jsp").forward(request, response);
		}
		
		
		//管理员查看所有用户的需求
		else if("showAllRequire".equals(action))
		{
			request.getRequestDispatcher("/admin/showAllRequirement.jsp").forward(request, response);
		}
		//审核查看需求的具体信息   或者是用户查看自己的某一条需求
		else if("showDetail".equals(action))
		{
			System.out.println("showDetail        通过参数获取的 checkable的值是"+request.getParameter("checkable"));
			request.setAttribute("checkable",request.getParameter("checkable"));
			String requirementCoding = request.getParameter("requirementCoding").toString();
			Session session = HibernateSessionFactory.getSession();  
			Criteria criteria = session.createCriteria(RequirementInfo.class);
			criteria.add(Restrictions.eq("requirementCoding",requirementCoding));
			RequirementInfo require = (RequirementInfo)criteria.list().get(0);
			
			System.out.println("状态1"+require.getNowState());
			
			//只能审核没有被正在审核的需求
			if("提交待形式审核".equals(require.getNowState()))
			{
				//把要审核的需求锁定
//				require.setNowState("正在形式审核");
//				session.beginTransaction();
//				session.update(require);
//				session.getTransaction().commit();
//				session.close();
				
				System.out.println("状态2"+require.getNowState());
				//把开始年限和结束年限分开
				String[] time = require.getTimeLimited().toString().split("/");
				String startYear = time[0];
				String endYear = time[1];
				request.setAttribute("startYear",startYear);
				request.setAttribute("endYear",endYear);
				//把五个关健字分开
				String[] keyWord = require.getKeyWord().toString().split("/");
				request.setAttribute("keyWord",keyWord);
				request.setAttribute("require",require);
				request.getRequestDispatcher("/admin/checkRequirement.jsp").forward(request, response);
			}
			//只能审核没有被正在审核的需求    这是技术审核
			else if("形式审核通过待技术审核".equals(require.getNowState()))
			{
				//把要审核的需求锁定
//				require.setNowState("正在技术审核");
//				session.beginTransaction();
//				session.update(require);
//				session.getTransaction().commit();
//				session.close();
				
				System.out.println("状态2"+require.getNowState());
				//把开始年限和结束年限分开
				String[] time = require.getTimeLimited().toString().split("/");
				String startYear = time[0];
				String endYear = time[1];
				request.setAttribute("startYear",startYear);
				request.setAttribute("endYear",endYear);
				//把五个关健字分开
				String[] keyWord = require.getKeyWord().toString().split("/");
				request.setAttribute("keyWord",keyWord);
				request.setAttribute("require",require);
				
				request.getRequestDispatcher("/admin/checkRequirement.jsp").forward(request, response);
			}
		}
		//形式审核提交
		else if("checkRequireHandin".equals(action))
		{
			System.out.println("formCheckRequireHandin1        通过参数获取的 checkenable的值是"+request.getAttribute("checkable"));
			String isPass = request.getParameter("checkState");
			//形式审核未通过
			if("形式审核未通过".equals(isPass))
			{
				String notPassReason = request.getParameter("reason");
				String requireCoding = request.getParameter("requireCoding");
				
				Session session = HibernateSessionFactory.getSession();  
				Criteria criteria = session.createCriteria(RequirementInfo.class);
				criteria.add(Restrictions.eq("requirementCoding",requireCoding));
				RequirementInfo require = (RequirementInfo)criteria.list().get(0);
				require.setNowState("形式审核未通过");
				
				//注:数据库设计的时候少设计一列 现在只能把审核未通过的理由保存在企业自筹那一列上面
				require.setSelfInvestment(notPassReason);
				System.out.println("RequirementServlet  设置的不通过理由是"+require.getSelfInvestment());
				session.beginTransaction();
				session.update(require);
				session.getTransaction().commit();
				session.close();
				
				request.getRequestDispatcher("/admin/showAllRequirement.jsp").forward(request, response);
			}
			//形式审核通过
			else
			{
				String requireCoding = request.getParameter("requireCoding");
				String manageDepart = request.getParameter("manageDepart");
				
				Session session = HibernateSessionFactory.getSession();  
				Criteria criteria = session.createCriteria(RequirementInfo.class);
				criteria.add(Restrictions.eq("requirementCoding",requireCoding));
				RequirementInfo require = (RequirementInfo)criteria.list().get(0);
				//形式审核通过  设置技术审核的的单位
				require.setSelfInvestment(manageDepart);
				System.out.println("形式审核通过，技术审核的部门是"+require.getSelfInvestment());
				require.setNowState("形式审核通过待技术审核");
				session.beginTransaction();
				session.update(require);
				session.getTransaction().commit();
				session.close();
				System.out.println("formCheckRequireHandin2        通过参数获取的 checkable的值是"+request.getAttribute("checkable"));
				out.write("<script language='javascript'>alert('审核成功');</script>");
				
				request.getRequestDispatcher("/admin/showAllRequirement.jsp").forward(request, response);
			}
		}
		//显示属于本机构的所有需要审核的需求
		else if("showTechnologyCheck".equals(action))
		{
			String manageDepart = request.getSession().getAttribute("name").toString();
			Session session = HibernateSessionFactory.getSession();  
			Criteria criteria = session.createCriteria(RequirementInfo.class);
			criteria.add(Restrictions.eq("nowState","形式审核通过待技术审核"));
			criteria.add(Restrictions.eq("selfInvestment",manageDepart));
			List<RequirementInfo> requireList = (List<RequirementInfo>)criteria.list();
			request.setAttribute("requireList",requireList);
			request.getRequestDispatcher("/admin/showTechnologyCheck.jsp").forward(request, response);
		}
		//技术审核某一条具体的需求
		else if("technologyCheck".equals(action))
		{
			String requirementCoding = request.getParameter("requirementCoding").toString();
			Session session = HibernateSessionFactory.getSession();  
			Criteria criteria = session.createCriteria(RequirementInfo.class);
			criteria.add(Restrictions.eq("requirementCoding",requirementCoding));
			RequirementInfo require = (RequirementInfo)criteria.list().get(0);
			System.out.println("状态2"+require.getNowState());
			//把开始年限和结束年限分开
			String[] time = require.getTimeLimited().toString().split("/");
			String startYear = time[0];
			String endYear = time[1];
			request.setAttribute("startYear",startYear);
			request.setAttribute("endYear",endYear);
			//把五个关健字分开
			String[] keyWord = require.getKeyWord().toString().split("/");
			request.setAttribute("keyWord",keyWord);
			request.setAttribute("require",require);
			request.getRequestDispatcher("/admin/technologyCheck.jsp").forward(request, response);
		}
		//技术审核提交
		else if("technologyCheckHandin".equals(action))
		{
			String isPass = request.getParameter("checkState");
			//形式审核未通过
			if("技术审核未通过".equals(isPass))
			{
				String notPassReason = request.getParameter("reason");
				String requireCoding = request.getParameter("requireCoding");
				
				Session session = HibernateSessionFactory.getSession();  
				Criteria criteria = session.createCriteria(RequirementInfo.class);
				criteria.add(Restrictions.eq("requirementCoding",requireCoding));
				RequirementInfo require = (RequirementInfo)criteria.list().get(0);
				require.setNowState("技术审核未通过");
				
				//注:数据库设计的时候少设计一列 现在只能把审核未通过的理由保存在企业自筹那一列上面
				require.setSelfInvestment(notPassReason);
				System.out.println("RequirementServlet  设置的不通过理由是"+require.getSelfInvestment());
				session.beginTransaction();
				session.update(require);
				session.getTransaction().commit();
				session.close();
				
				request.getRequestDispatcher("/admin/showTechnologyCheck.jsp").forward(request, response);
			}
			//形式审核通过
			else
			{
				String requireCoding = request.getParameter("requireCoding");
				Session session = HibernateSessionFactory.getSession();  
				Criteria criteria = session.createCriteria(RequirementInfo.class);
				criteria.add(Restrictions.eq("requirementCoding",requireCoding));
				RequirementInfo require = (RequirementInfo)criteria.list().get(0);
				//形式审核通过  设置技术审核的的单位
				require.setSelfInvestment("恭喜您，您的需求已经通过了形式审核和技术审核");
				System.out.println("技术审核通过，备注信息"+require.getSelfInvestment());
				require.setNowState("技术审核通过");
				session.beginTransaction();
				session.update(require);
				session.getTransaction().commit();
				session.close();
				System.out.println("formCheckRequireHandin2        通过参数获取的 checkable的值是"+request.getAttribute("checkable"));
				out.write("<script language='javascript'>alert('审核成功');</script>");
				
				request.getRequestDispatcher("/admin/showTechnologyCheck.jsp").forward(request, response);
			}
		}
	}
	
}
