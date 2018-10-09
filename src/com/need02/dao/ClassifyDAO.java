package com.need02.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.need02.pojo.Industry;
import com.need02.pojo.Classify;

public class ClassifyDAO extends HibernateDaoSupport
{
	/*//获取国民经济行业的第一个下拉框
	public List<Industry> getFirstGmjjhys();
	
	//获取国民经济行业的第二个下拉框
	public List<Industry> getSecondGmjjhys(String secondCode);
	
	//获取国民经济行业的第三个下拉框
	public List<Industry> getThirdGmjjhys(String thirdCode);
	
	//获取学科分类第一个下拉框
	public List<Classify> getFirstXkfls();

	//获取学科分类的第二个下拉框
	public List<Classify> getSecondXkfls(String secondXcode);

	//获取学科分类的第三个下拉框的值
	public List<Classify> getThirdXkfls(String thirdXcode);*/
	
	//获取国民经济行业的第一个下拉框
		public List<Industry> getFirstGmjjhys()
		{
			@SuppressWarnings("unchecked")
			
			List<Industry> gm=this.getHibernateTemplate().find("from Industry g where g.code like '%0000'");
			System.out.println(gm);
			return gm;
		}
		
		//获取国民经济行业的第二个下拉框
		public List<Industry> getSecondGmjjhys(String secondCode)
		{
			@SuppressWarnings("unchecked")
			List<Industry> gm= this.getHibernateTemplate().find("from Industry g where g.code like '"+secondCode.substring(0, 1)+"%00'");
			return gm;
		}
		
		//获取国民经济行业的第三个下拉框
		public List<Industry> getThirdGmjjhys(String thirdCode)
		{
			@SuppressWarnings("unchecked")
			List<Industry> gm=this.getHibernateTemplate().find("from Industry g where g.code like '"+thirdCode.substring(0, 3)+"%'");
		    return gm;
		}
		
		//获取学科分类第一个下拉框
		public List<Classify> getFirstXkfls()
		{
			@SuppressWarnings("unchecked")
			List<Classify> cl=this.getHibernateTemplate().find("from Classify c where c.code like '%00000'");
			System.out.println("DAO执行getFirstXkfls()");
			return cl;
		}

		//获取学科分类的第二个下拉框
		public List<Classify> getSecondXkfls(String secondXcode)
		{
			@SuppressWarnings("unchecked")
			List<Classify> cl=this.getHibernateTemplate().find("from Classify c where c.code like '"+secondXcode.substring(0, 2)+"%00'");
			return cl;
		}

		//获取学科分类的第三个下拉框的值
		public List<Classify> getThirdXkfls(String thirdXcode)
		{
			@SuppressWarnings("unchecked")
			List<Classify> cl=this.getHibernateTemplate().find("from Classify c where c.code like '"+thirdXcode.substring(0, 5)+"%'");
			return cl;
		}
}
