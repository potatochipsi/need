package whw;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import entity.*;


public class PageUtil {

	private Page page;
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public PageUtil() {
		// TODO Auto-generated constructor stub
	}
	public PageUtil(int span,int currentPage,String tableName) 
	{
		page = new Page();
		page.setCurrentPage(currentPage);
		page.setSpan(span);
		page.setTableName(tableName);
	}
	
	public void setPageInfo()
	{
		//要分页显示数据的表的名字
		String tableName = page.getTableName();
		Session session = HibernateSessionFactory.getSession(); 
		Criteria criteria = null;
		//组织机构信息
		if("InstitutionInfo".equals(tableName))
		{
			criteria = session.createCriteria(InstitutionInfo.class);
			criteria.addOrder(Order.asc("institutionCoding"));
			//总的记录数
			int totalRecord = criteria.list().size();
			//总页数
			int totalPage;
			if((totalRecord % page.getSpan()) == 0)
			{
				totalPage = totalRecord / page.getSpan();
			}
			else
			{
				totalPage = totalRecord / page.getSpan() + 1;
			}
			
			Object[] dataArray = criteria.list().toArray();
			List<Object> dataList = new ArrayList();
			//显示的页数超出了范围
			if(page.getCurrentPage() <= 0)
			{
				page.setCurrentPage(1);
			}
			if(page.getCurrentPage() >= totalPage)
			{
				page.setCurrentPage(totalPage);
			}
			//这一页要显示的数据的起始数据点
			int index = (page.getCurrentPage() - 1) * (page.getSpan());
			//数据还够page.getSpan()条 可以   完整的显示一页
			if(dataArray.length - page.getSpan() >= index)
			{
				int j = 0;
				//获取要显示的数据
				for(int i = index;j < page.getSpan();i++,j++)
				{
					InstitutionInfo ins = (InstitutionInfo)(dataArray[i]);
					dataList.add(ins);
				}
			}
			else
			{
				for(int i = index;i < dataArray.length;i++)
				{
					InstitutionInfo ins = (InstitutionInfo)(dataArray[i]);
					dataList.add(ins);
				}
			}
			
			page.setTotalRecord(totalRecord);
			page.setTotalPage(totalPage);
			page.setDataList(dataList);
		}
		else if("RequirementInfo".equals(tableName))
		{
			criteria = session.createCriteria(RequirementInfo.class);
			criteria.addOrder(Order.asc("requirementCoding"));
			//总的记录数
			int totalRecord = criteria.list().size();
			//总页数
			int totalPage;
			if((totalRecord % page.getSpan()) == 0)
			{
				totalPage = totalRecord / page.getSpan();
			}
			else
			{
				totalPage = totalRecord / page.getSpan() + 1;
			}
			
			Object[] dataArray = criteria.list().toArray();
			List<Object> dataList = new ArrayList();
			//显示的页数超出了范围
			if(page.getCurrentPage() <= 0)
			{
				page.setCurrentPage(1);
			}
			if(page.getCurrentPage() >= totalPage)
			{
				page.setCurrentPage(totalPage);
			}
			//这一页要显示的数据的起始数据点
			int index = (page.getCurrentPage() - 1) * (page.getSpan());
			//数据还够page.getSpan()条 可以   完整的显示一页
			if(dataArray.length - page.getSpan() >= index)
			{
				int j = 0;
				//获取要显示的数据
				for(int i = index;j < page.getSpan();i++,j++)
				{
					RequirementInfo ins = (RequirementInfo)(dataArray[i]);
					dataList.add(ins);
				}
			}
			else
			{
				for(int i = index;i < dataArray.length;i++)
				{
					RequirementInfo ins = (RequirementInfo)(dataArray[i]);
					dataList.add(ins);
				}
			}
			
			page.setTotalRecord(totalRecord);
			page.setTotalPage(totalPage);
			page.setDataList(dataList);
		}
		else if("RoleInfo".equals(tableName))
		{
			criteria = session.createCriteria(RoleInfo.class);
			criteria.addOrder(Order.asc("roleId"));
			//总的记录数
			int totalRecord = criteria.list().size();
			//总页数
			int totalPage;
			if((totalRecord % page.getSpan()) == 0)
			{
				totalPage = totalRecord / page.getSpan();
			}
			else
			{
				totalPage = totalRecord / page.getSpan() + 1;
			}
			
			Object[] dataArray = criteria.list().toArray();
			List<Object> dataList = new ArrayList();
			//显示的页数超出了范围
			if(page.getCurrentPage() <= 0)
			{
				page.setCurrentPage(1);
			}
			if(page.getCurrentPage() >= totalPage)
			{
				page.setCurrentPage(totalPage);
			}
			//这一页要显示的数据的起始数据点
			int index = (page.getCurrentPage() - 1) * (page.getSpan());
			//数据还够page.getSpan()条 可以   完整的显示一页
			if(dataArray.length - page.getSpan() >= index)
			{
				int j = 0;
				//获取要显示的数据
				for(int i = index;j < page.getSpan();i++,j++)
				{
					RoleInfo ins = (RoleInfo)(dataArray[i]);
					dataList.add(ins);
				}
			}
			else
			{
				for(int i = index;i < dataArray.length;i++)
				{
					RoleInfo ins = (RoleInfo)(dataArray[i]);
					dataList.add(ins);
				}
			}
			
			page.setTotalRecord(totalRecord);
			page.setTotalPage(totalPage);
			page.setDataList(dataList);
		}
		else if("UserInfo".equals(tableName))
		{
			criteria = session.createCriteria(UserInfo.class);
			criteria.addOrder(Order.asc("userId"));
			//总的记录数
			int totalRecord = criteria.list().size();
			//总页数
			int totalPage;
			if((totalRecord % page.getSpan()) == 0)
			{
				totalPage = totalRecord / page.getSpan();
			}
			else
			{
				totalPage = totalRecord / page.getSpan() + 1;
			}
			
			Object[] dataArray = criteria.list().toArray();
			List<Object> dataList = new ArrayList();
			//显示的页数超出了范围
			if(page.getCurrentPage() <= 0)
			{
				page.setCurrentPage(1);
			}
			if(page.getCurrentPage() >= totalPage)
			{
				page.setCurrentPage(totalPage);
			}
			//这一页要显示的数据的起始数据点
			int index = (page.getCurrentPage() - 1) * (page.getSpan());
			//数据还够page.getSpan()条 可以   完整的显示一页
			if(dataArray.length - page.getSpan() >= index)
			{
				int j = 0;
				//获取要显示的数据
				for(int i = index;j < page.getSpan();i++,j++)
				{
					UserInfo ins = (UserInfo)(dataArray[i]);
					dataList.add(ins);
				}
			}
			else
			{
				for(int i = index;i < dataArray.length;i++)
				{
					UserInfo ins = (UserInfo)(dataArray[i]);
					dataList.add(ins);
				}
			}
			
			page.setTotalRecord(totalRecord);
			page.setTotalPage(totalPage);
			page.setDataList(dataList);
		}
		
		
	}
}
